#include "SymbolTable.hpp"

SymbolTable::SymbolTable() {
  for (size_t i = 0; i <= 15; ++i) {
    std::string register_num = std::to_string(i);
    table_["R" + register_num] = i;
  }
  table_["SCREEN"] = 16384;
  table_["KBD"] = 24576;
  table_["SP"] = 0;
  table_["LCL"] = 1;
  table_["ARG"] = 2;
  table_["THIS"] = 3;
  table_["THAT"] = 4;
}

void SymbolTable::addEntry(const std::string &entry, int address) {
  table_[entry] = address;
}

bool SymbolTable::contains(const std::string &entry) {
  return table_.find(entry) != table_.end();
}

int SymbolTable::GetAddress(const std::string &entry) { return table_[entry]; }