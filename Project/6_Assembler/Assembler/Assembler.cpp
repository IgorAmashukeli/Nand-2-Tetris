#include "Assembler.hpp"
#include "Parser.hpp"

std::string Assembler::toBinary(int n) {
  std::string r;
  int k = 0;
  while (n != 0 || k < 16) {
    std::string bit;
    if (n % 2 == 0 || n == 0) {
      bit = "0";
    } else {
      bit = "1";
    }
    r += bit;
    n /= 2;
    k++;
  }

  std::reverse(r.begin(), r.end());
  return r;
}

Assembler::Assembler(const std::string &path) : parser_(path) {
  intput_path_ = path;
  output_file_.open(path.substr(0, path.size() - 3) + "hack");
}

void Assembler::restart() { parser_ = Parser(intput_path_); }

void Assembler::firstPass() {
  while (parser_.advance()) {
    if (parser_.commandType() == Command::L_COMMAND) {
      std::string label_value = parser_.symbol();
      int n = parser_.getLineNumber();
      symbol_table_.addEntry(label_value, n);
    }
  }
}

bool is_number(const std::string &s) {
  return !s.empty() && std::find_if(s.begin(), s.end(), [](unsigned char c) {
                         return !std::isdigit(c);
                       }) == s.end();
}

void Assembler::Aprocess(int address) {
  std::string bin = toBinary(address);
  output_file_ << bin << "\n";
}

void Assembler::Cprocess() {
  std::string dst = coder_.dest(parser_.dest());
  std::string cmp = coder_.comp(parser_.comp());
  std::string jmp = coder_.jump(parser_.jump());
  std::string result = "111";
  result += cmp;
  result += dst;
  result += jmp;
  output_file_ << result << "\n";
}

void Assembler::secondPass() {
  int variable_address = 16;
  while (parser_.advance()) {
    if (parser_.commandType() == Command::A_COMMAND) {
      std::string value = parser_.symbol();
      int a_address;
      if (is_number(value)) {
        a_address = std::stoi(value);
      } else if (symbol_table_.contains(value)) {
        a_address = symbol_table_.GetAddress(value);
      } else {
        a_address = variable_address;
        symbol_table_.addEntry(value, variable_address);
        variable_address++;
      }

      Assembler::Aprocess(a_address);
    } else if (parser_.commandType() == Command::C_COMMAND) {
      Assembler::Cprocess();
    }
  }
}

void Assembler::process() {
  firstPass();
  restart();
  secondPass();
}