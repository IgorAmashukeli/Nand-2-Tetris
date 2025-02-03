#include "VmTranslator.hpp"

int main(int argc, char **argv) {
  VmTranslator vm_translator(argv[1]);
  vm_translator.process();
}