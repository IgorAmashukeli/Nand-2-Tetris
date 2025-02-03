#include "CompilationEngine.hpp"
#include "SymbolTable.hpp"
#include "VMWriter.hpp"
#include <cassert>
#include <cstddef>
#include <iostream>
#include <string>

CompilationEngine::CompilationEngine(
    const std::vector<std::vector<std::string>> &tokens,
    const std::string &out_file_path)
    : vm_writer(out_file_path) {
  tokens_ = tokens;
  length_ = tokens_.size();
}

std::string CompilationEngine::getToken() {
  std::string token = tokens_[index_][0];
  advance();
  return token;
}

bool CompilationEngine::isKeyword() { return tokens_[index_][1] == "keyword"; }
bool CompilationEngine::isClass() {
  return isKeyword() && tokens_[index_][0] == "class";
}
bool CompilationEngine::isConstructor() {
  return isKeyword() && tokens_[index_][0] == "constructor";
}

bool CompilationEngine::isFunction() {
  return isKeyword() && tokens_[index_][0] == "function";
}
bool CompilationEngine::isMethod() {
  return isKeyword() && tokens_[index_][0] == "method";
}
bool CompilationEngine::isField() {
  return isKeyword() && tokens_[index_][0] == "field";
}
bool CompilationEngine::isStatic() {
  return isKeyword() && tokens_[index_][0] == "static";
}

bool CompilationEngine::isVar() {
  return isKeyword() && tokens_[index_][0] == "var";
}

bool CompilationEngine::isInt() {
  return isKeyword() && tokens_[index_][0] == "int";
}
bool CompilationEngine::isChar() {
  return isKeyword() && tokens_[index_][0] == "char";
}
bool CompilationEngine::isBoolean() {
  return isKeyword() && tokens_[index_][0] == "boolean";
}
bool CompilationEngine::isVoid() {
  return isKeyword() && tokens_[index_][0] == "void";
}

bool CompilationEngine::isTrue() {
  return isKeyword() && tokens_[index_][0] == "true";
}

bool CompilationEngine::isFalse() {
  return isKeyword() && tokens_[index_][0] == "false";
}
bool CompilationEngine::isNull() {
  return isKeyword() && tokens_[index_][0] == "null";
}
bool CompilationEngine::isThis() {
  return isKeyword() && tokens_[index_][0] == "this";
}
bool CompilationEngine::isLet() {
  return isKeyword() && tokens_[index_][0] == "let";
}

bool CompilationEngine::isDo() {
  return isKeyword() && tokens_[index_][0] == "do";
}
bool CompilationEngine::isIf() {
  return isKeyword() && tokens_[index_][0] == "if";
}
bool CompilationEngine::isElse() {
  return isKeyword() && tokens_[index_][0] == "else";
}
bool CompilationEngine::isWhile() {
  return isKeyword() && tokens_[index_][0] == "while";
}
bool CompilationEngine::isFor() {
  return isKeyword() && tokens_[index_][0] == "for";
}

bool CompilationEngine::isReturn() {
  return isKeyword() && tokens_[index_][0] == "return";
}

bool CompilationEngine::isSymbol() { return tokens_[index_][1] == "symbol"; }

bool CompilationEngine::isIntegerConstant() {
  return tokens_[index_][1] == "integerConstant";
}

bool CompilationEngine::isStringConstant() {
  return tokens_[index_][1] == "stringConstant";
}

bool CompilationEngine::isIdentifier() {
  return tokens_[index_][1] == "identifier";
}

bool CompilationEngine::isOpenCurlyBracket() {
  return isSymbol() && tokens_[index_][0] == "{";
}

bool CompilationEngine::isCloseCurlyBracket() {
  return isSymbol() && tokens_[index_][0] == "}";
}

bool CompilationEngine::isOpenRoundBracket() {
  return isSymbol() && tokens_[index_][0] == "(";
}

bool CompilationEngine::isCloseRoundBracket() {
  return isSymbol() && tokens_[index_][0] == ")";
}

bool CompilationEngine::isOpenSquareBracket() {
  return isSymbol() && tokens_[index_][0] == "[";
}

bool CompilationEngine::isCloseSquareBracket() {
  return isSymbol() && tokens_[index_][0] == "]";
}

bool CompilationEngine::isDot() {
  return isSymbol() && tokens_[index_][0] == ".";
}

bool CompilationEngine::isComma() {
  return isSymbol() && tokens_[index_][0] == ",";
}

bool CompilationEngine::isSemiColon() {
  return isSymbol() && tokens_[index_][0] == ";";
}

bool CompilationEngine::isPlus() {
  return isSymbol() && tokens_[index_][0] == "+";
}

bool CompilationEngine::isMinus() {
  return isSymbol() && tokens_[index_][0] == "-";
}

bool CompilationEngine::isMultiply() {
  return isSymbol() && tokens_[index_][0] == "*";
}

bool CompilationEngine::isDivide() {
  return isSymbol() && tokens_[index_][0] == "/";
}

bool CompilationEngine::isAmpersand() {
  return isSymbol() && tokens_[index_][0] == "&";
}

bool CompilationEngine::isVerticalBar() {
  return isSymbol() && tokens_[index_][0] == "|";
}

bool CompilationEngine::isLess() {
  return isSymbol() && tokens_[index_][0] == "<";
}

bool CompilationEngine::isGreater() {
  return isSymbol() && tokens_[index_][0] == ">";
}

bool CompilationEngine::isEquality() {
  return isSymbol() && tokens_[index_][0] == "=";
}

bool CompilationEngine::isNegation() {
  return isSymbol() && tokens_[index_][0] == "~";
}

bool CompilationEngine::isModulo() {
  return isSymbol() && tokens_[index_][0] == "%";
}

bool CompilationEngine::isOp() {
  std::unordered_set<std::string> ops = {"+", "-", "*", "/", "&",
                                         "|", "<", ">", "=", "%"};
  return (ops.find(tokens_[index_][0]) != ops.end());
}

bool CompilationEngine::isUnaryOp() {
  std::unordered_set<std::string> un_ops = {"-", "~"};
  return (un_ops.find(tokens_[index_][0]) != un_ops.end());
}

bool CompilationEngine::isKeywordConstant() {
  std::unordered_set<std::string> keyword_constant = {"true", "false", "null",
                                                      "this"};
  return (keyword_constant.find(tokens_[index_][0]) != keyword_constant.end());
}

bool CompilationEngine::isType() {
  return tokens_[index_][0] == "int" || tokens_[index_][0] == "char" ||
         tokens_[index_][0] == "boolean" || tokens_[index_][1] == "identifier";
}

bool CompilationEngine::isSubroutineKind() {
  return isConstructor() || isMethod() || isFunction();
}

bool CompilationEngine::isSubroutineType() { return isVoid() || isType(); }

bool CompilationEngine::isVarDec() { return isVar(); }

bool CompilationEngine::isClassName() { return isIdentifier(); }

bool CompilationEngine::isSubroutineName() { return isIdentifier(); }

bool CompilationEngine::isVarName() { return isIdentifier(); }

void CompilationEngine::advance() { index_++; }

bool CompilationEngine::isClassVarDec() { return isStatic() || isField(); }
bool CompilationEngine::isSubroutineDec() {
  return isConstructor() || isFunction() || isMethod();
}

bool CompilationEngine::isStatements() {
  return isLet() || isIf() || isWhile() || isDo() || isFor() || isReturn();
}

bool CompilationEngine::isTerm() {
  return isIntegerConstant() || isStringConstant() || isKeywordConstant() ||
         isIdentifier() || isOpenRoundBracket() || isUnaryOp();
}

bool CompilationEngine::isConstantTerm() {
  return isIntegerConstant() || isStringConstant() || isKeywordConstant();
}

bool CompilationEngine::isNextBracketDot() {
  return index_ + 1 < length_ &&
         (tokens_[index_ + 1][0] == "(" || tokens_[index_ + 1][0] == ".");
}

bool CompilationEngine::isSubroutineCall() {
  return isIdentifier() && isNextBracketDot();
}

bool CompilationEngine::isAddressTakeExpression() {
  return isIdentifier() && index_ + 1 < length_ &&
         tokens_[index_ + 1][0] == "[";
}

bool CompilationEngine::isExpression() { return isTerm(); }

bool CompilationEngine::isNonClassSubroutineCall() {
  return index_ + 1 < length_ && tokens_[index_ + 1][0] == "(";
}

bool CompilationEngine::isClassSubroutineCall() {
  return index_ + 1 < length_ && tokens_[index_ + 1][0] == ".";
}

std::string
CompilationEngine::getVMSubroutineName(const std::string &function_name) {
  return class_name_ + "." + function_name;
}

void CompilationEngine::CompilationEngine::process() { compileClass(); }

void CompilationEngine::compileClass() {
  // 'class'
  advance();

  // 'className'
  class_name_ = getToken();

  // '}'
  advance();

  // 'classVarDec*'
  while (isClassVarDec()) {
    compileClassVarDec();
  }

  // 'subroutineDec*'
  while (isSubroutineDec()) {
    compileSubroutineDec();
  }

  // '}'
  advance();
}

void CompilationEngine::compileClassVarDec() {
  // (static | field)
  std::string kind_str = getToken();
  Kind kind;
  if (kind_str == "static") {
    kind = Kind::STATIC;
  } else {
    kind = Kind::FIELD;
  }

  // type
  std::string type = getToken();

  // varName
  std::string var_name = getToken();

  // put variable in Symbol table
  symbol_table.Define(var_name, type, kind);

  while (isComma()) {
    //,
    advance();

    // var_name
    std::string var_name = getToken();
    symbol_table.Define(var_name, type, kind);
  }

  // ;
  advance();
}

void CompilationEngine::createFunctionDeclaration(
    const std::string &subroutineName) {
  int nLoc = symbol_table.varCount(Kind::VAR);

  // create a function declaration code (name + nLoc)
  vm_writer.writeFunction(getVMSubroutineName(subroutineName), nLoc);
}

void CompilationEngine::constructFields() {
  // each variable of any type (int, char, boolean, ..., if it String, Array,
  // Object - it is pointer) has 16 bit in RAM
  // => the number of 16 bit words to allocate in THIS part for the object
  // fields
  // equals the number of fields

  // find number of fields
  int num_fields = symbol_table.varCount(Kind::FIELD);

  // push this value on the stack
  vm_writer.writePush(Segment::CONST, num_fields);

  // call OS function "Memory.alloc" to allocate space with one argument -
  // number of fields, pushed on the stack before will return the base address
  // of newly created object
  vm_writer.writeCall("Memory.alloc", 1);

  // saves the newly created object in pointer[0] = THIS
  vm_writer.writePop(Segment::POINTER, 0);
}

void CompilationEngine::compileSubroutineDec() {
  // create new subroutine table
  symbol_table.startSubroutine();

  // label_index_ = 0
  label_index_ = 0;

  // ('constructor' | 'function' | 'method')
  std::string subroutine_kind = getToken();

  // type
  std::string type = getToken();

  // check that type in case kind is a constructor: is it a class name
  if (subroutine_kind == "constructor") {
    assert(type == class_name_);
  }

  std::string subroutine_name = getToken();

  // check that name of constructor is "new"
  if (subroutine_kind == "constructor") {
    assert(subroutine_name == "new");
  }

  // (
  advance();

  // method has one implicit (first) argument - "this"
  if (subroutine_kind == "method") {
    // put THIS in subroutine table
    symbol_table.Define("this", class_name_, Kind::ARG);
  }

  // parameterList
  compileParameterList();

  // )
  advance();

  // subroutineBody
  compileSubroutineBody(subroutine_name, subroutine_kind);
}

void CompilationEngine::compileParameterList() {
  Kind kind = Kind::ARG;

  // if there are parameters in parameter list
  if (isType()) {
    // type
    std::string type = getToken();
    // varName
    std::string var_name = getToken();

    symbol_table.Define(var_name, type, kind);

    // additional parameters in parameter list
    while (isComma()) {
      // ,
      advance();

      // type
      std::string type = getToken();

      // varName
      std::string var_name = getToken();

      symbol_table.Define(var_name, type, kind);
    }
  }
}

void CompilationEngine::compileSubroutineBody(
    const std::string &subroutine_name, const std::string &subroutine_kind) {
  // {
  advance();

  // varDec*
  while (isVarDec()) {
    compileVarDec();
  }

  // Write function declaration in VM Writer
  createFunctionDeclaration(subroutine_name);

  // constructor creates fields
  if (subroutine_kind == "constructor") {
    // Construct fields of a class in VM Writer
    constructFields();
  }

  // set this to pointer 0 if it is method
  if (subroutine_kind == "method") {
    // ARG[0] - THIS
    vm_writer.writePush(Segment::ARG, 0);

    // put THIS in pointer 0
    vm_writer.writePop(Segment::POINTER, 0);
  }
  // statement
  compileStatements();

  // }
  advance();
}

void CompilationEngine::compileVarDec() {
  // var
  advance();

  // type
  std::string type = getToken();

  // varName
  std::string var_name = getToken();

  // create local variable in symbol table
  symbol_table.Define(var_name, type, Kind::VAR);

  while (isComma()) {
    // ,
    advance();

    // var_name
    std::string var_name = getToken();

    // create local variable in symbol table
    symbol_table.Define(var_name, type, Kind::VAR);
  }

  //;
  advance();
}

void CompilationEngine::compileStatements() {
  while (isStatements()) {
    if (isLet()) {
      compileLet();
    } else if (isDo()) {
      compileDo();
    } else if (isWhile()) {
      compileWhile();
    } else if (isIf()) {
      compileIf();
    } else if (isReturn()) {
      compileReturn();
    } else if (isFor()) {
      compileFor();
    }
  }
}

void CompilationEngine::compileDo() {
  // do
  advance();

  // subroutineCall
  compileSubroutineCall();

  // do operates with void method, void method pushes something on the stack
  // we dump the value in temp 0
  vm_writer.writePop(Segment::TEMP, 0);

  //;
  advance();
}

void CompilationEngine::compileLet() {
  // let
  advance();

  // varName
  std::string var_name = getToken();

  if (isOpenSquareBracket()) {
    // case 1 : let varName[expression1] = expression2;
    // therefore it is arr[expression1] = expression2;
    // here we use temp segment to avoid collision in pop pointer 1 to allign
    // THAT 0 cause we may need this twice in expression1 and expression2
    // (expression 2 may also use array manipulations)

    // [
    advance();

    // push arr

    // variable was declared
    assert(symbol_table.kindOf(var_name) != Kind::NONE);
    pushVariableOnToTheStack(var_name);

    // push expression1
    compileExpression();

    // stack contains arr + expression - address of arr[expression1]
    vm_writer.WriteArithmetic(ArithmeticCommand::ADD);

    //]
    advance();

    //=
    advance();

    // push expression2 on to the stack
    compileExpression();

    // temp 0 will contain the value of expression2: we are saving value to
    // avoid colision
    vm_writer.writePop(Segment::TEMP, 0);

    // pop pointer 1 => now we store arr + expression1 in pointer[1] = THAT
    vm_writer.writePop(Segment::POINTER, 1);

    // now we can push the value of expression 2 to the stack again
    vm_writer.writePush(Segment::TEMP, 0);

    // THAT[0] = expression2
    //  => arr[expression1] = expression2
    vm_writer.writePop(Segment::THAT, 0);

    //;
    advance();

  } else {
    // case 2: let varName = expression;

    // =
    advance();

    // expression
    compileExpression();

    Kind kind = symbol_table.kindOf(var_name);
    assert(kind != Kind::NONE); // variable was declared

    // assign var_name the expression, that lies on the stack
    popVariablFromTheStack(var_name);

    //;
    advance();
  }
}

void CompilationEngine::compileFor() {
  size_t label_index = label_index_;

  // change label_index to make labels unique in VM code
  label_index_++;

  // for
  advance();

  // (
  advance();

  // as we know from "while" compilation (look there) "not" + "if-goto" assures
  // if-goto will go to label in case of false expression

  /*

  this is for grammar:

  for (letst1; cond; letst2;) {
    sts;
  }

  VM code for executing statement letst1;
  label FOR1
  VM code for computing ~(expression)
  if-goto FOR2
  VM code for executing sts
  VM code for executing letsts
  goto FOR1
  label FOR2
  ...
  */

  // compile letst1
  compileLet();

  // write label FOR1
  vm_writer.WriteLabel("FOR1_" + std::to_string(label_index));

  // compile expression
  compileExpression();

  //;
  advance();

  // ~expression
  vm_writer.WriteArithmetic(ArithmeticCommand::NOT);
  vm_writer.WriteIf("FOR2_" + std::to_string(label_index));

  // save where to compile letst2
  size_t start_let_statement_index = index_;

  // skip letst2
  while (getToken() != ")") {
  }

  //{
  advance();

  // compile sts
  compileStatements();

  // save end of compile statement token index
  size_t end_inside_brackets_statement = index_;

  // restore the index of let statement to execute
  index_ = start_let_statement_index;

  // execute let statement
  compileLet();

  // go to the index after sts
  index_ = end_inside_brackets_statement;

  vm_writer.WriteGoto("FOR1_" + std::to_string(label_index));
  vm_writer.WriteLabel("FOR2_" + std::to_string(label_index));

  //}
  advance();

  // change label_index_ to make them unique in VM code
  label_index_++;
}

void CompilationEngine::compileWhile() {

  size_t label_index = label_index_;

  // change label_index to make labels unique in VM code
  label_index_++;

  // while
  advance();

  //(
  advance();

  // as we know from "if" compilation (look there) "not" + "if-goto" assures
  // if-goto will go to label in case of false expression

  /*
  label WHILE1
  VM code for computing ~(cond)
  if-goto WHILE2                  -if false, we goto label2 -> go out of while
  VM code for executing s1        -if true, we execute statements s1
  goto WHILE1                     -and go to while check again
  label WHILE2                    -continuing after while
  ...
  */

  vm_writer.WriteLabel("WHILE1_" + std::to_string(label_index));

  // expression
  compileExpression();

  //)
  advance();

  //{
  advance();
  vm_writer.WriteArithmetic(ArithmeticCommand::NOT);
  vm_writer.WriteIf("WHILE2_" + std::to_string(label_index));

  compileStatements();

  vm_writer.WriteGoto("WHILE1_" + std::to_string(label_index));
  vm_writer.WriteLabel("WHILE2_" + std::to_string(label_index));

  //}
  advance();

  // change label_index_ to make them unique in VM code
  label_index_++;
}

void CompilationEngine::compileReturn() {
  // return
  advance();

  if (isExpression()) {
    compileExpression();
  } else {
    // return; (void function) -> push constant 0
    vm_writer.writePush(Segment::CONST, 0);
  }

  vm_writer.writeReturn();

  //;
  advance();
}

void CompilationEngine::compileIf() {
  size_t label_index = label_index_;

  // change label_index to make labels unique in VM code
  label_index_++;
  // if
  advance();

  // (
  advance();

  // expression
  compileExpression();

  // )
  advance();

  // if true -> goto statement 1
  // if false -> goto statement 2 (else)

  // true == 1....1
  // false != 1....1

  // if value == false -> goto statement 2 (else)
  // if value != 1...1 -> goto statement 2 (else)
  // if not value != 0...0 -> goto statement 2 (else)
  // (if (not value != 0...0) -> goto) is if-goto after inverting the value

  // therefore:
  // not
  // if-goto -> IF1: statements 2
  // goto -> IF2: statements 1

  /* VM code for computing ~(cond)
   if-goto IF1
   VM code for executing s1        - if expression was true, do statements 1
   goto IF2                        - go to label IF2 to continue after doing s1
   label IF1                       - if expression was false
   VM code for executing s2        - do statements 2
   label IF2                       -continue after doing s1 or s2
   */

  // {
  advance();

  vm_writer.WriteArithmetic(ArithmeticCommand::NOT);
  vm_writer.WriteIf("IF1_" + std::to_string(label_index));

  // compile Statements 1
  compileStatements();

  // }
  advance();

  vm_writer.WriteGoto("IF2_" + std::to_string(label_index));
  vm_writer.WriteLabel("IF1_" + std::to_string(label_index));

  // (else {statements})?
  if (isElse()) {
    // else
    advance();
    // {
    advance();
    // compile Statements 2
    compileStatements();
    // }
    advance();
  }

  vm_writer.WriteLabel("IF2_" + std::to_string(label_index));
}

void CompilationEngine::popVariablFromTheStack(const std::string &var_name) {

  Kind kind = symbol_table.kindOf(var_name);
  Segment segment;
  if (kind == Kind::ARG) {
    segment = Segment::ARG;
  } else if (kind == Kind::VAR) {
    segment = Segment::LOCAL;
  } else if (kind == Kind::FIELD) {
    segment = Segment::THIS;
  } else if (kind == Kind::STATIC) {
    segment = Segment::STATIC;
  }
  int index = symbol_table.IndexOf(var_name);
  vm_writer.writePop(segment, index);
}

void CompilationEngine::pushVariableOnToTheStack(const std::string &var_name) {

  Kind kind = symbol_table.kindOf(var_name);
  Segment segment;
  if (kind == Kind::ARG) {
    segment = Segment::ARG;
  } else if (kind == Kind::VAR) {
    segment = Segment::LOCAL;
  } else if (kind == Kind::FIELD) {
    segment = Segment::THIS;
  } else if (kind == Kind::STATIC) {
    segment = Segment::STATIC;
  }
  int index = symbol_table.IndexOf(var_name);
  vm_writer.writePush(segment, index);
}

void CompilationEngine::compileSubroutineCall() {
  // it is method of a function inside one class
  if (isNonClassSubroutineCall()) {
    // subroutineName
    std::string function_name = getToken();

    // (
    advance();

    /// put the object "this"
    vm_writer.writePush(Segment::POINTER, 0);

    // expressionList
    int nArgs = compileExpressionList();

    // )
    advance();

    // code to call own method
    // call the function with nArgs + 1 arguments
    vm_writer.writeCall(getVMSubroutineName(function_name), nArgs + 1);
  } else if (isClassSubroutineCall()) {
    // (className | varName)
    std::string class_or_var_name = getToken();

    // if kind of variable is NONE => it is not a variable => it is class
    // if it is class => it is constructor or a function => no need to push this
    // on to the stack
    Kind kind = symbol_table.kindOf(class_or_var_name);

    //.
    advance();

    // subroutineName
    std::string function_name = getToken();

    // (
    advance();

    // kind == Kind::None => not a variable => class => constructor or function
    if (kind == Kind::NONE) {
      // add to the name of the function the className itself
      function_name = class_or_var_name + "." + function_name;
    } else {
      // it was a method => the first argument is object itself
      std::string type = symbol_table.typeOf(class_or_var_name);
      function_name = type + "." + function_name;
      pushVariableOnToTheStack(class_or_var_name);
    }

    // expressionList
    int nArgs = compileExpressionList();

    //)
    advance();

    // if it was object (method) call => the number of arguments is nArgs + 1

    if (kind != Kind::NONE) {
      ++nArgs;
    }

    vm_writer.writeCall(function_name, nArgs);
  }
}

void CompilationEngine::callOpp(const std::string &op_str) {
  if (op_str == "+") {
    vm_writer.WriteArithmetic(ArithmeticCommand::ADD);
  } else if (op_str == "-") {
    vm_writer.WriteArithmetic(ArithmeticCommand::SUB);
  } else if (op_str == "*") {
    vm_writer.writeCall("Math.multiply", 2);
  } else if (op_str == "/") {
    vm_writer.writeCall("Math.divide", 2);
  } else if (op_str == "&") {
    vm_writer.WriteArithmetic(ArithmeticCommand::AND);
  } else if (op_str == "|") {
    vm_writer.WriteArithmetic(ArithmeticCommand::OR);
  } else if (op_str == "<") {
    vm_writer.WriteArithmetic(ArithmeticCommand::LT);
  } else if (op_str == ">") {
    vm_writer.WriteArithmetic(ArithmeticCommand::GT);
  } else if (op_str == "=") {
    vm_writer.WriteArithmetic(ArithmeticCommand::EQ);
  } else if (op_str == "%") {
    vm_writer.writeCall("Math.mod", 2);
  }
}

void CompilationEngine::compileExpression() {
  // term
  compileTerm();
  while (isOp()) {
    //
    std::string op_str = getToken();

    // term
    compileTerm();

    // call op function
    callOpp(op_str);
  }
}
void CompilationEngine::compileTerm() {
  if (isIntegerConstant()) {
    // integerConstant

    std::string int_const = getToken();

    vm_writer.writePush(Segment::CONST, std::stoi(int_const));

  } else if (isStringConstant()) {
    // stringConstant

    std::string str_const = getToken();

    // create empty string constant with maximum length of str_const.size()
    vm_writer.writePush(Segment::CONST, str_const.size());
    vm_writer.writeCall("String.new", 1);

    // append all chars to string
    for (const unsigned char chr : str_const) {
      vm_writer.writePush(Segment::CONST, chr);
      vm_writer.writeCall("String.appendChar", 2);
    }

  } else if (isKeywordConstant()) {
    // keywordConstant

    std::string keyword_constant = getToken();
    if (keyword_constant == "true") {
      // true = 1...1 = -1
      vm_writer.writePush(Segment::CONST, 1);
      vm_writer.WriteArithmetic(ArithmeticCommand::NEG);

    } else if (keyword_constant == "false") {
      // false = 0

      vm_writer.writePush(Segment::CONST, 0);

    } else if (keyword_constant == "null") {
      // null = 0

      vm_writer.writePush(Segment::CONST, 0);

    } else if (keyword_constant == "this") {
      // this = pointer[0]

      vm_writer.writePush(Segment::POINTER, 0);
    }
  } else if (isUnaryOp()) {
    // unary op term

    // unary op
    std::string unary_op = getToken();

    // term
    compileTerm();

    // write the operation
    if (unary_op == "-") {
      vm_writer.WriteArithmetic(ArithmeticCommand::NEG);
    } else if (unary_op == "~") {
      vm_writer.WriteArithmetic(ArithmeticCommand::NOT);
    }

  } else if (isOpenRoundBracket()) {
    // ( expression )

    // (
    advance();

    // expression
    compileExpression();

    //)
    advance();
  } else if (isSubroutineCall()) {
    // subroutineCall
    compileSubroutineCall();

  } else if (isAddressTakeExpression()) {
    // varName - it is array
    std::string var_name = getToken();

    //[
    advance();

    // push varName - arr
    pushVariableOnToTheStack(var_name);

    // expression - push the value of expression (index of array) on to the
    // stack
    compileExpression();

    // varName (arr) + expression is on the stack
    vm_writer.WriteArithmetic(ArithmeticCommand::ADD);

    // THAT = varName (arr) + expression
    vm_writer.writePop(Segment::POINTER, 1);

    // THAT[0] = varName[expression] is on the stack
    vm_writer.writePush(Segment::THAT, 0);

    //]
    advance();
  } else if (isVarName()) {

    // varName
    std::string var_name = getToken();

    pushVariableOnToTheStack(var_name);
  }
}

int CompilationEngine::compileExpressionList() {
  int nArgs = 0;
  if (isExpression()) {
    // expression
    compileExpression();
    ++nArgs;

    while (isComma()) {
      // ,
      advance();

      // expression
      compileExpression();
      ++nArgs;
    }
  }
  return nArgs;
}