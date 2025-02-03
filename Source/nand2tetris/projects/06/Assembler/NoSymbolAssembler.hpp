#include "Coder.hpp"
#include "Parser.hpp"
#include <algorithm>
#include <fstream>

class NoSymbolAssembler {
public:
  NoSymbolAssembler(const std::string &path);
  std::string toBinary(int n);
  void process();
  void Aprocess();
  void Cprocess();

private:
  Parser parser_;
  Coder coder_;
  std::ofstream output_file_;
};