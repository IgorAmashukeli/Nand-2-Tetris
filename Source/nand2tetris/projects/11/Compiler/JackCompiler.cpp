#include "JackCompiler.hpp"
#include "CompilationEngine.hpp"
#include "JackTokenizer.hpp"
#include "SyntaxChecker.hpp"
#include <cstdlib>
#include <vector>

namespace fs = std::filesystem;

JackCompiler::JackCompiler(const std::string &path_string)
    : path_string_(path_string), path_(path_string) {}

void ::JackCompiler::compile(const std::string &path) {
  std::cout << "compiling " << path << "\n";
  // tokenization
  JackTokenizer jack_tokenizer(path);
  bool tok_code = jack_tokenizer.process();

  // check tokenization errors
  if (!tok_code) {
    std::cout << "Tokenization error: " << jack_tokenizer.getError() << "\n";
    std::exit(1);
  }
  std::vector<std::vector<std::string>> tokens = jack_tokenizer.getTokens();
  if (tokens.empty()) {
    std::cout << "Tokenization error: "
              << "No tokens genetated\n";
    std::exit(1);
  }

  std::cout << "1) Tokenization was OK!\n";

  // check syntax errors
  SyntaxChecker syntax_checker(tokens);
  bool parse_code = syntax_checker.process();
  if (!parse_code) {
    std::cout << "Parsing error: " << syntax_checker.getError() << "\n";
    std::exit(1);
  }

  std::cout << "2) Parsing was OK!\n";

  // compilation with some use of assert (checking somes semantic compilation
  // errors)
  std::string output_file_path = path.substr(0, path.size() - 4) + "vm";
  CompilationEngine compilation_engine(tokens, output_file_path);
  compilation_engine.process();

  std::cout
      << "3) Compilation was OK\n4) Result can be found in \"vm\" files\n";
}

void JackCompiler::process() {
  if (fs::is_directory(path_, ec_)) {

    std::string name = path_string_;
    std::string directory_name = name.substr(name.find_last_of('/') + 1);
    for (const auto &entry : fs::directory_iterator(path_)) {
      std::string cur_path = entry.path();
      if (cur_path.substr(cur_path.size() - 4) == "jack") {
        compile(cur_path);
      }
    }
  } else if (fs::is_regular_file(path_, ec_)) {
    std::string file_path = path_;
    assert(file_path.substr(file_path.size() - 4) == "jack");
    compile(file_path);
  }
}

int main(int argc, char **argv) {
  JackCompiler jack_compiler(argv[1]);
  jack_compiler.process();
}