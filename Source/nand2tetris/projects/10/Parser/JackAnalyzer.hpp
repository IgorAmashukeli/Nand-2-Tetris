#pragma once
#include "CompilationEngine.hpp"
#include "JackAnalyzer.hpp"
#include <cassert>
#include <filesystem>

namespace fs = std::filesystem;

class JackAnalyzer {
public:
  JackAnalyzer(const std::string &path);
  void process();

private:
  fs::path path_;
  std::error_code ec_;
  std::string pathString_;
};
