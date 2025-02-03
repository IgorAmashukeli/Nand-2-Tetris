#pragma once
#include "CodeWriter.hpp"
class VmTranslator {
public:
  VmTranslator(const std::string &path);
  void process();

private:
  Parser parser_;
  CodeWriter code_writer_;
};