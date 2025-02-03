#include "Parser.hpp"

int main(int argc, char **argv) {
  Parser parser_(argv[1]);
  while (parser_.advance()) {
    Command command_type = parser_.commandType();
    if (command_type == Command::C_NOT_COMMAND) {
      continue;
    }

    if (command_type == Command::C_PUSH || command_type == Command::C_POP ||
        command_type == Command::C_FUNCTION ||
        command_type == Command::C_CALL) {
      std::cout << parser_.arg1() << " " << parser_.arg2() << "\n";
    } else if (command_type != Command::C_RETURN) {
      std::cout << parser_.arg1() << "\n";
    } else {
      std::cout << "return\n";
    }
  }
}