#include "JackAnalyzer.hpp"

namespace fs = std::filesystem;

JackAnalyzer::JackAnalyzer(const std::string &pathString)
    : pathString_(pathString), path_(pathString) {}

void JackAnalyzer::process() {
  if (fs::is_directory(path_, ec_)) {

    std::string name = pathString_;
    std::string directory_name = name.substr(name.find_last_of('/') + 1);
    for (const auto &entry : fs::directory_iterator(path_)) {
      std::string cur_path = entry.path();
      if (cur_path.substr(cur_path.size() - 4) == "jack") {
        CompilationEngine compilation_engine(cur_path);
        compilation_engine.process();
      }
    }
  } else if (fs::is_regular_file(path_, ec_)) {
    std::string file_path = path_;
    assert(file_path.substr(file_path.size() - 4) == "jack");
    CompilationEngine compilation_engine(file_path);
    compilation_engine.process();
  }
}

int main(int argc, char **argv) {
  JackAnalyzer jack_analyzer(argv[1]);
  jack_analyzer.process();
}