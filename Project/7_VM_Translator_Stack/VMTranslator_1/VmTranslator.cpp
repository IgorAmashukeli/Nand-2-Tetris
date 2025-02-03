#include "VmTranslator.hpp"

VmTranslator::VmTranslator(const std::string &path)
    : parser_(path), code_writer_(path) {}

void VmTranslator::process() {
  while (parser_.advance()) {
    Command command_type = parser_.commandType();
    if (command_type == Command::C_NOT_COMMAND) {
      continue;
    }

    if (command_type == Command::C_ARITHMETIC) {
      std::string command = parser_.arg1();
      code_writer_.writeArithmetic(command);
    } else if (command_type == Command::C_PUSH ||
               command_type == Command::C_POP) {
      std::string argument1 = parser_.arg1();
      int argument2 = parser_.arg2();
      code_writer_.WritePushPop(command_type, argument1, argument2);
    }
  }
}