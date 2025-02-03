#include <string>

class Coder {
public:
  Coder();

  std::string dest(const std::string &mnemonic);

  std::string comp(const std::string &mnemonic);

  std::string jump(const std::string &mnemonic);
};