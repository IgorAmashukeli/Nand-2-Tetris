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

Command Parser::commandType() {
  if (args_.empty()) {
    return Command::C_NOT_COMMAND;
  }
  if (args_[0] == "push") {
    return Command::C_PUSH;
  }
  if (args_[0] == "pop") {
    return Command::C_POP;
  }
  if (args_[0] == "label") {
    return Command::C_LABEL;
  }
  if (args_[0] == "goto") {
    return Command::C_GOTO;
  }
  if (args_[0] == "if-goto") {
    return Command::C_IF;
  }
  if (args_[0] == "function") {
    return Command::C_FUNCTION;
  }
  if (args_[0] == "call") {
    return Command::C_CALL;
  }
  if (args_[0] == "return") {
    return Command::C_RETURN;
  }
  return Command::C_ARITHMETIC;
}

void Parser::split(const std::string &s) {
  std::vector<std::string> ans;
  std::stringstream ss(s);
  std::string word;
  while (ss >> word) {
    ans.push_back(word);
  }
  args_ = ans;
}

void Parser::deleteComments() {
  std::string delimiter = "//";
  size_t comments_pos = cur_command_.find(delimiter);
  if (comments_pos != std::string::npos) {
    size_t comment_size = cur_command_.size() - comments_pos;
    cur_command_.erase(comments_pos, comment_size);
  }
}

std::string Parser::arg1() {
  if (commandType() == Command::C_ARITHMETIC) {
    return args_[0];
  }

  return args_[1];
}

int Parser::arg2() {
  return std::stoi(args_[2]);
  return 0;
}

bool Parser::advance() {
  bool hasMoreCommands =
      static_cast<bool>(std::getline(vm_file_, cur_command_));
  if (hasMoreCommands) {
    deleteComments();
    split(cur_command_);
  }
  return hasMoreCommands;
}