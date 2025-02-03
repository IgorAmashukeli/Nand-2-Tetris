#include "VmTranslator.hpp"

int main(int argc, char **argv) {
  VmTranslator vm_translator;
  vm_translator.translate(argv[1]);
}