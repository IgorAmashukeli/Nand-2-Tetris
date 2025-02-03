#include "NoSymbolAssembler.hpp"

std::string NoSymbolAssembler::toBinary(int n) {
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

NoSymbolAssembler::NoSymbolAssembler(const std::string &path) : parser_(path) {
  output_file_.open(path.substr(0, path.size() - 3) + "hack");
}

void NoSymbolAssembler::Aprocess() {
  std::string dec_str = parser_.symbol();
  int dec = std::stoi(dec_str);
  std::string bin = toBinary(dec);
  output_file_ << bin << "\n";
}

void NoSymbolAssembler::Cprocess() {
  std::string dst = coder_.dest(parser_.dest());
  std::string cmp = coder_.comp(parser_.comp());
  std::string jmp = coder_.jump(parser_.jump());
  std::string result = "111";
  result += cmp;
  result += dst;
  result += jmp;
  output_file_ << result << "\n";
}

void NoSymbolAssembler::process() {
  while (parser_.advance()) {
    if (parser_.commandType() == Command::NOT_COMMAND) {

      continue;

    } else if (parser_.commandType() == Command::A_COMMAND) {

      NoSymbolAssembler::Aprocess();

    } else if (parser_.commandType() == Command::C_COMMAND) {

      NoSymbolAssembler::Cprocess();
    }
  }
}
