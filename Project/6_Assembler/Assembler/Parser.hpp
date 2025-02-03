#pragma once
#include <algorithm>
#include <cstddef>
#include <fstream>
#include <iostream>
#include <stdexcept>
#include <string>
#include <tuple>

enum class Command { A_COMMAND, C_COMMAND, L_COMMAND, NOT_COMMAND };

class Parser {
public:
  Parser(const std::string &path);
  Command commandType();
  std::string symbol();
  void deleteSpaces();
  void deleteComments();
  bool advance();
  void findEqualPos();
  void findSemicolumnPos();
  int getLineNumber();
  std::string comp();
  std::string dest();
  std::string jump();

private:
  std::ifstream asm_file_;
  std::string cur_command_;
  size_t equal_pos_;
  size_t semicolumn_pos_;
  int next_line_{0};
};