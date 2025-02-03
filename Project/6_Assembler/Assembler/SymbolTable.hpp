#pragma once
#include <string>
#include <unordered_map>

class SymbolTable {
public:
  SymbolTable();
  void addEntry(const std::string &entry, int addres);
  bool contains(const std::string &entry);
  int GetAddress(const std::string &entry);

private:
  std::unordered_map<std::string, int> table_;
};