#pragma once
#include "Coder.hpp"
#include "Parser.hpp"
#include "SymbolTable.hpp"
#include <fstream>
#include <string>

class Assembler {
public:
  Assembler(const std::string &path);
  std::string toBinary(int n);
  void restart();
  void firstPass();
  void secondPass();
  void Aprocess(int address);
  void Cprocess();
  void process();

private:
  std::string intput_path_;
  Parser parser_;
  Coder coder_;
  SymbolTable symbol_table_;
  std::ofstream output_file_;
};