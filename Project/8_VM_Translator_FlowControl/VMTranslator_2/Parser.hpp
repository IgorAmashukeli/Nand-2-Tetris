#pragma once
#include <algorithm>
#include <bits/stdc++.h>
#include <fstream>
#include <string>
#include <vector>

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
  Parser() = default;
  void openFile(const std::string &path);
  Parser(const std::string &path);
  bool advance();
  Command commandType();
  std::string arg1();
  int arg2();

private:
  void deleteComments();
  void split(const std::string &s);
  std::ifstream vm_file_;
  std::string cur_command_;
  std::vector<std::string> args_;
};