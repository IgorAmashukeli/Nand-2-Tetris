#pragma once
#include <algorithm>
#include <fstream>
#include <string>

enum class Command {
  C_ARITHMETIC,
  C_PUSH,
  C_POP,
  C_LABEL,
  C_GOTO,
  C_IF,
  C_FUNCTION,
  C_RETURN,
  C_CALL,
  C_NOT_COMMAND
};

class Parser {
public:
  Parser(const std::string &path);
  bool advance();
  Command commandType();
  std::string arg1();
  int arg2();

private:
  bool three_arithmetic(const std::string &command);
  bool two_arithmetic(const std::string &command);
  std::string push_pop_arg1(int start);
  void deleteSpaces();
  void deleteComments();
  std::ifstream vm_file_;
  std::string cur_command_;
};