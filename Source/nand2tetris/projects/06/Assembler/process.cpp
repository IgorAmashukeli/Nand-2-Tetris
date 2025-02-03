#include "Assembler.hpp"

int main(int argc, char **argv) {
  Assembler assembler(argv[1]);
  assembler.process();
}