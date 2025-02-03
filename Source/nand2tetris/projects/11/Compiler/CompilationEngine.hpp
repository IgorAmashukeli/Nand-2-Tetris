#pragma once
#include "SymbolTable.hpp"
#include "VMWriter.hpp"
#include <unordered_set>
#include <vector>

// new class .jack file is processing
// comments are deleted by Decommentifier
// tokens are found by Tokenizer
// syntax errors were not found by syntax Checker
// => it is syntax-error-free
// Symbol table class is prepared for variables
// VMWriter is prepared for .vm writing
// CompilationEngine does recursive top-down actual compilation

class CompilationEngine {
public:
  CompilationEngine(const std::vector<std::vector<std::string>> &tokens,
                    const std::string &out_file_path);
  void process();
  void compileClass();
  void compileClassVarDec();
  void compileSubroutineDec();
  void compileSubroutineBody(const std::string &subroutine_name,
                             const std::string &subroutine_kind);
  void compileParameterList();
  void compileVarDec();
  void compileStatements();
  void compileDo();
  void compileLet();
  void compileWhile();
  void compileFor();
  void compileReturn();
  void compileIf();
  void compileSubroutineCall();
  void compileExpression();
  void compileTerm();
  int compileExpressionList();

private:
  std::string getVMSubroutineName(const std::string &function_name);
  std::string getToken();
  void advance();
  bool isKeyword();
  bool isClass();
  bool isConstructor();
  bool isFor();

  bool isFunction();
  bool isMethod();
  bool isField();
  bool isStatic();

  bool isVar();

  bool isInt();
  bool isChar();
  bool isBoolean();
  bool isVoid();

  bool isTrue();

  bool isFalse();
  bool isNull();
  bool isThis();
  bool isLet();

  bool isDo();
  bool isIf();
  bool isElse();
  bool isWhile();

  bool isReturn();

  bool isSymbol();

  bool isIntegerConstant();

  bool isStringConstant();

  bool isIdentifier();

  bool isOpenCurlyBracket();

  bool isCloseCurlyBracket();

  bool isOpenRoundBracket();

  bool isCloseRoundBracket();

  bool isOpenSquareBracket();

  bool isCloseSquareBracket();

  bool isDot();

  bool isComma();

  bool isSemiColon();

  bool isPlus();

  bool isMinus();

  bool isMultiply();

  bool isDivide();

  bool isAmpersand();

  bool isVerticalBar();

  bool isLess();

  bool isGreater();

  bool isEquality();

  bool isNegation();

  bool isOp();

  bool isUnaryOp();

  bool isKeywordConstant();
  bool isType();

  bool isSubroutineKind();

  bool isSubroutineType();

  bool isVarDec();

  bool isClassName();

  bool isSubroutineName();

  bool isVarName();

  bool isClassVarDec();
  bool isSubroutineDec();
  bool isStatements();

  bool isTerm();

  bool isConstantTerm();
  bool isNextBracketDot();

  bool isSubroutineCall();

  bool isAddressTakeExpression();

  bool isExpression();

  bool isNonClassSubroutineCall();

  bool isClassSubroutineCall();

  void createFunctionDeclaration(const std::string &subroutineName);
  void constructFields();

  void pushVariableOnToTheStack(const std::string &var_name);

  void popVariablFromTheStack(const std::string &var_name);

  void callOpp(const std::string &op_str);

  bool isModulo();

  size_t label_index_{0};
  std::vector<std::vector<std::string>> tokens_;
  std::string class_name_;
  size_t index_{0};
  size_t length_;
  SymbolTable symbol_table;
  VMWriter vm_writer;
};