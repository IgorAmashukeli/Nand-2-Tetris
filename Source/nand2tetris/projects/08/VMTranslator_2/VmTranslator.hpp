#pragma once
#include "CodeWriter.hpp"
class VmTranslator {
public:
  VmTranslator() = default;
  void process(const std::string &pathString, std::ofstream &out_file);
  void translate(const std::string &pathString);

private:
  Parser parser_;
  CodeWriter code_writer_;
};