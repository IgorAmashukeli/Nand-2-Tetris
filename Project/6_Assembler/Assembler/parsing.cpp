#include "Coder.hpp"
#include "Parser.hpp"

int main(int argc, char **argv) {

  Parser parser(argv[1]);
  Coder coder;

  while (parser.advance()) {
    if (parser.commandType() == Command::NOT_COMMAND) {

      std::cout << "NOT A COMMAND\n";
    } else if (parser.commandType() == Command::A_COMMAND) {
      std::cout << "A COMMAND, symbol is: " << parser.symbol() << "\n";
    } else if (parser.commandType() == Command::L_COMMAND) {
      std::cout << "L COMMAND, symbol is: " << parser.symbol() << "\n";
    } else {
      std::cout << "C COMMAND, dest is: " << coder.dest(parser.dest())
                << " comp is: " << coder.comp(parser.comp()) << " jump is "
                << coder.jump(parser.jump()) << "\n";
    }
  }
}