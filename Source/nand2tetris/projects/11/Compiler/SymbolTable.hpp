#pragma once
#include <cassert>
#include <string>
#include <unordered_map>

enum class Kind { STATIC, FIELD, ARG, VAR, NONE };

struct Identifier {
  std::string name;
  std::string type;
  Kind kind;
  int index;
};

class SymbolTable {
public:
  SymbolTable() = default;
  void startSubroutine();
  void Define(const std::string &name, const std::string &type,
              const Kind &kind);
  int varCount(const Kind &kind);
  Kind kindOf(const std::string &name);
  std::string typeOf(const std::string &name);
  int IndexOf(const std::string &name);
  bool RedifinitionClass(const std::string &name);
  bool RedifinitionSubroutine(const std::string &name);

private:
  bool isClassScope(const Kind &kind);
  void increment_count(const Kind &kind);

  std::unordered_map<std::string, Identifier> class_table_;
  std::unordered_map<std::string, Identifier> subroutine_table_;
  int static_count_{0};
  int field_count_{0};
  int arg_count_{0};
  int var_count_{0};
};