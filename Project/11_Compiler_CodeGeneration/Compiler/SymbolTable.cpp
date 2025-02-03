#include "SymbolTable.hpp"

void SymbolTable::startSubroutine() {
  subroutine_table_ = {};
  var_count_ = 0;
  arg_count_ = 0;
}

bool SymbolTable::isClassScope(const Kind &kind) {
  return kind == Kind::FIELD || kind == Kind::STATIC;
}

bool SymbolTable::RedifinitionClass(const std::string &name) {
  return class_table_.find(name) != class_table_.end();
}

bool SymbolTable::RedifinitionSubroutine(const std::string &name) {
  return subroutine_table_.find(name) != subroutine_table_.end();
}

void SymbolTable::increment_count(const Kind &kind) {
  if (kind == Kind::FIELD) {
    field_count_++;
  } else if (kind == Kind::STATIC) {
    static_count_++;
  } else if (kind == Kind::ARG) {
    arg_count_++;
  } else {
    var_count_++;
  }
}

void SymbolTable::Define(const std::string &name, const std::string &type,
                         const Kind &kind) {

  // check that there is no such variable declared before
  if (isClassScope(kind)) {
    assert(!RedifinitionClass(name));
  } else {
    assert(!RedifinitionSubroutine(name));
  }

  Identifier identifier;
  identifier.kind = kind;
  identifier.name = name;
  identifier.type = type;
  identifier.index = varCount(kind);
  if (isClassScope(kind)) {
    class_table_[name] = identifier;
  } else {
    subroutine_table_[name] = identifier;
  }
  increment_count(kind);
}

Kind SymbolTable::kindOf(const std::string &name) {
  if (subroutine_table_.find(name) != subroutine_table_.end()) {
    return subroutine_table_[name].kind;
  }

  if (class_table_.find(name) != class_table_.end()) {
    return class_table_[name].kind;
  }

  return Kind::NONE;
}

std::string SymbolTable::typeOf(const std::string &name) {
  if (subroutine_table_.find(name) != subroutine_table_.end()) {
    return subroutine_table_[name].type;
  }

  if (class_table_.find(name) != class_table_.end()) {
    return class_table_[name].type;
  }

  // the variable doesn't exist, however we run the code, that needs it
  assert(false);

  return "";
}

int SymbolTable::IndexOf(const std::string &name) {
  if (subroutine_table_.find(name) != subroutine_table_.end()) {
    return subroutine_table_[name].index;
  }

  if (class_table_.find(name) != class_table_.end()) {
    return class_table_[name].index;
  }

  // the variable doesn't exist, however we run the code, that needs it
  assert(false);

  return -1;
}

int SymbolTable::varCount(const Kind &kind) {
  if (kind == Kind::FIELD) {
    return field_count_;
  }

  if (kind == Kind::ARG) {
    return arg_count_;
  }

  if (kind == Kind::STATIC) {
    return static_count_;
  }

  if (kind == Kind::VAR) {
    return var_count_;
  }

  return 0;
}
