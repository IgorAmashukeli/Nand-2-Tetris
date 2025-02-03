#include "Parser.hpp"
#include <cstddef>
#include <iostream>

class isWhitespace {
public:
  bool operator()(unsigned c) {
    if (c == ' ' || c == '\t' || c == '\n' || c == '\r' || c == '\f' ||
        c == '\v') {
      return true;
    } else {
      return false;
    }
  }
};

Parser::Parser(const std::string &path) {
  vm_file_.open(path); // PAII -> no need to close the file
  if (!vm_file_) {
    throw std::runtime_error("Can not open VM source file\n");
  }
}

bool Parser::three_arithmetic(const std::string &command) {
  return command == "add" || command == "sub" || command == "neg" ||
         command == "and" || command == "not";
}

bool Parser::two_arithmetic(const std::string &command) {
  return command == "eq" || command == "gt" || command == "lt" ||
         command == "or";
}

Command Parser::commandType() {
  if (cur_command_.empty()) {
    return Command::C_NOT_COMMAND;
  }

  if (cur_command_.size() >= 4 && cur_command_.substr(0, 4) == "push") {
    return Command::C_PUSH;
  }

  if (cur_command_.size() >= 3 && cur_command_.substr(0, 3) == "pop") {
    return Command::C_POP;
  }

  if (cur_command_.size() == 3 && three_arithmetic(cur_command_.substr(0, 3))) {
    return Command::C_ARITHMETIC;
  }

  if (cur_command_.size() >= 2 && two_arithmetic(cur_command_.substr(0, 2))) {
    return Command::C_ARITHMETIC;
  }
  // TO DO IN VM_TRANSLATOR_2
  return Command::C_NOT_COMMAND;
}

void Parser::deleteSpaces() {
  cur_command_.erase(
      std::remove_if(cur_command_.begin(), cur_command_.end(), isWhitespace()),
      cur_command_.end());
}

void Parser::deleteComments() {
  std::string delimiter = "//";
  size_t comments_pos = cur_command_.find(delimiter);
  if (comments_pos != std::string::npos) {
    size_t comment_size = cur_command_.size() - comments_pos;
    cur_command_.erase(comments_pos, comment_size);
  }
}

std::string Parser::push_pop_arg1(int start) {
  if (cur_command_.substr(start, 3) == "loc") {
    return "local";
  } else if (cur_command_.substr(start, 3) == "arg") {
    return "argument";
  } else if (cur_command_.substr(start, 3) == "thi") {
    return "this";
  } else if (cur_command_.substr(start, 3) == "tha") {
    return "that";
  } else if (cur_command_.substr(start, 3) == "con") {
    return "constant";
  } else if (cur_command_.substr(start, 3) == "sta") {
    return "static";
  } else if (cur_command_.substr(start, 3) == "poi") {
    return "pointer";
  } else {
    return "temp";
  }
}

std::string Parser::arg1() {
  if (commandType() == Command::C_ARITHMETIC) {
    return cur_command_;
  }

  if (commandType() == Command::C_PUSH) {
    return push_pop_arg1(4);
  }

  if (commandType() == Command::C_POP) {
    return push_pop_arg1(3);
  }
  // TO DO for other commands in VM Translator 2
  return cur_command_;
}

int Parser::arg2() {
  if (commandType() == Command::C_PUSH) {
    std::string arg1 = Parser::arg1();
    size_t arg1_size = arg1.size();
    size_t push_size = 4;
    size_t number_start = arg1_size + push_size;
    size_t number_size = cur_command_.size() - number_start;
    return std::stoi(cur_command_.substr(number_start, number_size));
  }

  if (commandType() == Command::C_POP) {
    std::string arg1 = Parser::arg1();
    size_t arg1_size = arg1.size();
    size_t push_size = 3;
    size_t number_start = arg1_size + push_size;
    size_t number_size = cur_command_.size() - number_start;
    return std::stoi(cur_command_.substr(number_start, number_size));
  }

  // TO DO for other commands in VM Translator 2
  return 0;
}

bool Parser::advance() {
  bool hasMoreCommands =
      static_cast<bool>(std::getline(vm_file_, cur_command_));
  if (hasMoreCommands) {
    deleteSpaces();
    deleteComments();
  }
  return hasMoreCommands;
}
