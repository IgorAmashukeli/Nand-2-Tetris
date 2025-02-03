#pragma once
#include "CompilationEngine.hpp"
#include "JackTokenizer.hpp"
#include "SyntaxChecker.hpp"
#include <filesystem>

namespace fs = std::filesystem;

class JackCompiler {
public:
  JackCompiler(const std::string &path_string);
  void process();
  void compile(const std::string &path);

private:
  fs::path path_;
  std::error_code ec_;
  std::string path_string_;
};