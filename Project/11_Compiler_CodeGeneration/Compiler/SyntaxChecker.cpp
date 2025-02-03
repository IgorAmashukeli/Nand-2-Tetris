#include "SyntaxChecker.hpp"
#include "JackTokenizer.hpp"
#include <cstddef>
#include <ios>
#include <iostream>
#include <string>
#include <unordered_set>

SyntaxChecker::SyntaxChecker(
    const std::vector<std::vector<std::string>> &tokens) {
  tokens_ = tokens;
  length_ = tokens.size();
}

bool SyntaxChecker::isKeyword() { return tokens_[index_][1] == "keyword"; }
bool SyntaxChecker::isClass() {
  return isKeyword() && tokens_[index_][0] == "class";
}
bool SyntaxChecker::isConstructor() {
  return isKeyword() && tokens_[index_][0] == "constructor";
}

bool SyntaxChecker::isFunction() {
  return isKeyword() && tokens_[index_][0] == "function";
}
bool SyntaxChecker::isMethod() {
  return isKeyword() && tokens_[index_][0] == "method";
}
bool SyntaxChecker::isField() {
  return isKeyword() && tokens_[index_][0] == "field";
}
bool SyntaxChecker::isStatic() {
  return isKeyword() && tokens_[index_][0] == "static";
}

bool SyntaxChecker::isVar() {
  return isKeyword() && tokens_[index_][0] == "var";
}

bool SyntaxChecker::isInt() {
  return isKeyword() && tokens_[index_][0] == "int";
}
bool SyntaxChecker::isChar() {
  return isKeyword() && tokens_[index_][0] == "char";
}
bool SyntaxChecker::isBoolean() {
  return isKeyword() && tokens_[index_][0] == "boolean";
}
bool SyntaxChecker::isVoid() {
  return isKeyword() && tokens_[index_][0] == "void";
}

bool SyntaxChecker::isTrue() {
  return isKeyword() && tokens_[index_][0] == "true";
}

bool SyntaxChecker::isFalse() {
  return isKeyword() && tokens_[index_][0] == "false";
}
bool SyntaxChecker::isNull() {
  return isKeyword() && tokens_[index_][0] == "null";
}
bool SyntaxChecker::isThis() {
  return isKeyword() && tokens_[index_][0] == "this";
}
bool SyntaxChecker::isLet() {
  return isKeyword() && tokens_[index_][0] == "let";
}

bool SyntaxChecker::isDo() { return isKeyword() && tokens_[index_][0] == "do"; }
bool SyntaxChecker::isIf() { return isKeyword() && tokens_[index_][0] == "if"; }
bool SyntaxChecker::isElse() {
  return isKeyword() && tokens_[index_][0] == "else";
}
bool SyntaxChecker::isWhile() {
  return isKeyword() && tokens_[index_][0] == "while";
}
bool SyntaxChecker::isFor() {
  return isKeyword() && tokens_[index_][0] == "for";
}
bool SyntaxChecker::isReturn() {
  return isKeyword() && tokens_[index_][0] == "return";
}

bool SyntaxChecker::isSymbol() { return tokens_[index_][1] == "symbol"; }

bool SyntaxChecker::isIntegerConstant() {
  return tokens_[index_][1] == "integerConstant";
}

bool SyntaxChecker::isStringConstant() {
  return tokens_[index_][1] == "stringConstant";
}

bool SyntaxChecker::isIdentifier() {
  return tokens_[index_][1] == "identifier";
}

bool SyntaxChecker::isOpenCurlyBracket() {
  return isSymbol() && tokens_[index_][0] == "{";
}

bool SyntaxChecker::isCloseCurlyBracket() {
  return isSymbol() && tokens_[index_][0] == "}";
}

bool SyntaxChecker::isOpenRoundBracket() {
  return isSymbol() && tokens_[index_][0] == "(";
}

bool SyntaxChecker::isCloseRoundBracket() {
  return isSymbol() && tokens_[index_][0] == ")";
}

bool SyntaxChecker::isOpenSquareBracket() {
  return isSymbol() && tokens_[index_][0] == "[";
}

bool SyntaxChecker::isCloseSquareBracket() {
  return isSymbol() && tokens_[index_][0] == "]";
}

bool SyntaxChecker::isDot() { return isSymbol() && tokens_[index_][0] == "."; }

bool SyntaxChecker::isComma() {
  return isSymbol() && tokens_[index_][0] == ",";
}

bool SyntaxChecker::isSemiColon() {
  return isSymbol() && tokens_[index_][0] == ";";
}

bool SyntaxChecker::isPlus() { return isSymbol() && tokens_[index_][0] == "+"; }

bool SyntaxChecker::isMinus() {
  return isSymbol() && tokens_[index_][0] == "-";
}

bool SyntaxChecker::isMultiply() {
  return isSymbol() && tokens_[index_][0] == "*";
}

bool SyntaxChecker::isDivide() {
  return isSymbol() && tokens_[index_][0] == "/";
}

bool SyntaxChecker::isAmpersand() {
  return isSymbol() && tokens_[index_][0] == "&";
}

bool SyntaxChecker::isVerticalBar() {
  return isSymbol() && tokens_[index_][0] == "|";
}

bool SyntaxChecker::isLess() { return isSymbol() && tokens_[index_][0] == "<"; }

bool SyntaxChecker::isGreater() {
  return isSymbol() && tokens_[index_][0] == ">";
}

bool SyntaxChecker::isEquality() {
  return isSymbol() && tokens_[index_][0] == "=";
}

bool SyntaxChecker::isNegation() {
  return isSymbol() && tokens_[index_][0] == "~";
}

bool SyntaxChecker::isOp() {
  std::unordered_set<std::string> ops = {"+", "-", "*", "/", "&",
                                         "|", "<", ">", "=", "%"};
  return (ops.find(tokens_[index_][0]) != ops.end());
}

bool SyntaxChecker::isUnaryOp() {
  std::unordered_set<std::string> un_ops = {"-", "~"};
  return (un_ops.find(tokens_[index_][0]) != un_ops.end());
}

bool SyntaxChecker::isKeywordConstant() {
  std::unordered_set<std::string> keyword_constant = {"true", "false", "null",
                                                      "this"};
  return (keyword_constant.find(tokens_[index_][0]) != keyword_constant.end());
}

bool SyntaxChecker::isType() {
  return tokens_[index_][0] == "int" || tokens_[index_][0] == "char" ||
         tokens_[index_][0] == "boolean" || tokens_[index_][1] == "identifier";
}

bool SyntaxChecker::isSubroutineKind() {
  return isConstructor() || isMethod() || isFunction();
}

bool SyntaxChecker::isSubroutineType() { return isVoid() || isType(); }

bool SyntaxChecker::isEndOfFile() { return index_ >= length_; }

bool SyntaxChecker::isVarDec() { return isVar(); }

bool SyntaxChecker::isClassName() { return isIdentifier(); }

bool SyntaxChecker::isSubroutineName() { return isIdentifier(); }

bool SyntaxChecker::isVarName() { return isIdentifier(); }

void SyntaxChecker::writeToken(int tab_count) {
  // std::cout << tokens_[index_][0] << "\n";
  ++index_;
}

bool SyntaxChecker::compilationError(const std::string &error) {
  compilation_error_ = error;
  return false;
}

bool SyntaxChecker::isClassVarDec() { return isStatic() || isField(); }
bool SyntaxChecker::isSubroutine() {
  return isConstructor() || isFunction() || isMethod();
}

bool SyntaxChecker::isStatements() {
  return isLet() || isIf() || isWhile() || isDo() || isReturn() || isFor();
}

bool SyntaxChecker::isTerm() {
  return isIntegerConstant() || isStringConstant() || isKeywordConstant() ||
         isIdentifier() || isOpenRoundBracket() || isUnaryOp();
}

bool SyntaxChecker::isConstantTerm() {
  return isIntegerConstant() || isStringConstant() || isKeywordConstant();
}

bool SyntaxChecker::isNextBracketDot() {
  return index_ + 1 < length_ &&
         (tokens_[index_ + 1][0] == "(" || tokens_[index_ + 1][0] == ".");
}

bool SyntaxChecker::isSubroutineCall() {
  return isIdentifier() && isNextBracketDot();
}

bool SyntaxChecker::isAddressTakeExpression() {
  return isIdentifier() && index_ + 1 < length_ &&
         tokens_[index_ + 1][0] == "[";
}

bool SyntaxChecker::isExpression() { return isTerm(); }

bool SyntaxChecker::isNonClassSubroutineCall() {
  return index_ + 1 < length_ && tokens_[index_ + 1][0] == "(";
}

bool SyntaxChecker::isClassSubroutineCall() {
  return index_ + 1 < length_ && tokens_[index_ + 1][0] == ".";
}

#define CHECK_END_OF_FILE()                                                    \
  if (isEndOfFile()) {                                                         \
    return compilationError("File ended too early");                           \
  }

#define CHECK_NO_TOKENS() CHECK_END_OF_FILE()

#define WRITE_LAST_TOKEN()                                                     \
  writeToken(tab_count + 1);                                                   \
  if (!isEndOfFile()) {                                                        \
    return compilationError(                                                   \
        "There is something redundant after class declaration");               \
  }

#define WRITE_TOKEN()                                                          \
  writeToken(tab_count + 1);                                                   \
  CHECK_END_OF_FILE()

#define TRY_WRITE_TOKEN(checker, error_index)                                  \
  if (!checker()) {                                                            \
    return compilationError(errors_[name][error_index]);                       \
  }                                                                            \
  WRITE_TOKEN()

#define TRY_WRITE_LAST_TOKEN(checker, error_index)                             \
  if (!checker()) {                                                            \
    return compilationError(errors_[name][error_index]);                       \
  }                                                                            \
  WRITE_LAST_TOKEN()

#define TRY_COMPILE(compilation_function)                                      \
  if (!compilation_function(tab_count + 1)) {                                  \
    return false;                                                              \
  }

#define ASTRIX_COMPILATION(condition, code)                                    \
  while (condition()) {                                                        \
    code                                                                       \
  }

#define CONDITION_COMPILATION(condition, code)                                 \
  if (condition()) {                                                           \
    code                                                                       \
  }

#define FLAG_CLOSE_TREE(flag)                                                  \
  if (flag) {                                                                  \
    return true;                                                               \
  }

#define FLAG_RETURN_SUBROUTINE_CALL(flag)                                      \
  if (flag) {                                                                  \
    return compilationError("Subroutine call "                                 \
                            "couldn't be parsed "                              \
                            "properly");                                       \
  }

#define SUBROUTINE_CALL(ind1, ind2, ind3, ind4, ind5, flag)                    \
                                                                               \
  CONDITION_COMPILATION(                                                       \
      isSubroutineCall,                                                        \
      CONDITION_COMPILATION(                                                   \
          isNonClassSubroutineCall,                                            \
          TRY_WRITE_TOKEN(isSubroutineName, ind1)    /*subroutineName*/        \
          TRY_WRITE_TOKEN(isOpenRoundBracket, ind2)  /*(*/                     \
          TRY_COMPILE(CompileExpressionList)         /*expressionList*/        \
          TRY_WRITE_TOKEN(isCloseRoundBracket, ind3) /*)*/                     \
          FLAG_CLOSE_TREE(flag))                     /**/                      \
                                                                               \
      CONDITION_COMPILATION(                                                   \
          isClassSubroutineCall,                     /**/                      \
          TRY_WRITE_TOKEN(isIdentifier, ind4)        /*(className | varName)*/ \
          TRY_WRITE_TOKEN(isDot, ind5)               /*.*/                     \
          TRY_WRITE_TOKEN(isIdentifier, ind1)        /*subroutineName*/        \
          TRY_WRITE_TOKEN(isOpenRoundBracket, ind2)  /*(*/                     \
          TRY_COMPILE(CompileExpressionList)         /*expressionList*/        \
          TRY_WRITE_TOKEN(isCloseRoundBracket, ind3) /*)*/                     \
          FLAG_CLOSE_TREE(flag))                     /**/                      \
      FLAG_RETURN_SUBROUTINE_CALL(flag))

bool SyntaxChecker::CompileClass(int tab_count) {
  std::string name = "class";
  TRY_WRITE_TOKEN(isClass, 0)            // 'class'
  TRY_WRITE_TOKEN(isClassName, 1)        // 'className'
  TRY_WRITE_TOKEN(isOpenCurlyBracket, 2) // '{'

  ASTRIX_COMPILATION(isClassVarDec,                   // classVarDec*
                     TRY_COMPILE(CompileClassVarDec)) // classVarDec

  ASTRIX_COMPILATION(isSubroutine,                      // subroutineDec*
                     TRY_COMPILE(CompileSubroutineDec)) // subroutineDec
  TRY_WRITE_LAST_TOKEN(isCloseCurlyBracket, 3)          // '}'
  return true;
};

bool SyntaxChecker::CompileClassVarDec(int tab_count) {
  std::string name = "classVarDec";
  TRY_WRITE_TOKEN(isClassVarDec, 0) // ('static' |
                                    // 'field')
  TRY_WRITE_TOKEN(isType, 1)        // type
  TRY_WRITE_TOKEN(isVarName, 2)     // varName

  ASTRIX_COMPILATION(isComma,                       // (',' varName)*
                     TRY_WRITE_TOKEN(isComma, 3)    // ,
                     TRY_WRITE_TOKEN(isVarName, 4)) // varName

  TRY_WRITE_TOKEN(isSemiColon, 5) // ';'
  return true;
}

bool SyntaxChecker::CompileSubroutineDec(int tab_count) {
  std::string name = "subroutineDec";
  TRY_WRITE_TOKEN(isSubroutineKind,
                  0) // ('constructor' | 'function'
  // | 'method')
  TRY_WRITE_TOKEN(isSubroutineType, 1)    //('void' | type)
  TRY_WRITE_TOKEN(isSubroutineName, 2)    // subroutineName
  TRY_WRITE_TOKEN(isOpenRoundBracket, 3)  //'('
  TRY_COMPILE(compileParameterList)       // parameterList
  TRY_WRITE_TOKEN(isCloseRoundBracket, 4) // ')'
  TRY_COMPILE(CompileSubroutineBody)      // subroutineBody
  return true;
}

bool SyntaxChecker::CompileSubroutineBody(int tab_count) {
  std::string name = "subroutineBody";
  TRY_WRITE_TOKEN(isOpenCurlyBracket, 0)         // '{'
  ASTRIX_COMPILATION(isVarDec,                   // varDec*
                     TRY_COMPILE(compileVarDec)) // varDec
  TRY_COMPILE(compileStatements)                 // statements
  TRY_WRITE_TOKEN(isCloseCurlyBracket, 1)        // '}'
  return true;
}

bool SyntaxChecker::compileParameterList(int tab_count) {
  std::string name = "parameterList";
  CONDITION_COMPILATION(
      isType,                       // (type varName (, type varName)*)?
      TRY_WRITE_TOKEN(isType, 0)    // type
      TRY_WRITE_TOKEN(isVarName, 1) // varName
      ASTRIX_COMPILATION(isComma,   // (, type varName)*
                         TRY_WRITE_TOKEN(isComma, 2)   // ,
                         TRY_WRITE_TOKEN(isType, 3)    // type
                         TRY_WRITE_TOKEN(isVarName, 4) // varName
                         ))
  return true;
}

bool SyntaxChecker::compileVarDec(int tab_count) {
  std::string name = "varDec";
  TRY_WRITE_TOKEN(isVar, 0)                            //'var'
  TRY_WRITE_TOKEN(isType, 1)                           // type
  TRY_WRITE_TOKEN(isIdentifier, 2)                     // varName
  ASTRIX_COMPILATION(isComma,                          // (, varName)*
                     TRY_WRITE_TOKEN(isComma, 3)       // ,
                     TRY_WRITE_TOKEN(isIdentifier, 4)) // varName
  TRY_WRITE_TOKEN(isSemiColon, 5)                      // ;
  return true;
}

bool SyntaxChecker::compileStatements(int tab_count) {
  std::string name = "statements";
  ASTRIX_COMPILATION( // statements = statement*
      isStatements,
      CONDITION_COMPILATION(isLet,
                            TRY_COMPILE(compileLet)) // let statement ?
      else CONDITION_COMPILATION(isIf,
                                 TRY_COMPILE(compileIf)) // if statement ?

      else CONDITION_COMPILATION(
          isReturn,
          TRY_COMPILE(compileReturn)) // return statement ?
      else CONDITION_COMPILATION(isDo,
                                 TRY_COMPILE(compileDo)) // do statement ?
      else CONDITION_COMPILATION(isWhile,
                                 TRY_COMPILE(compileWhile)) // while statement ?
      else CONDITION_COMPILATION(isFor, TRY_COMPILE(compileFor)))
  return true;
}

bool SyntaxChecker::compileDo(int tab_count) {
  std::string name = "doStatement";
  TRY_WRITE_TOKEN(isDo, 0) // do
  // subroutineCall
  SUBROUTINE_CALL(1, 2, 3, 4, 5, false)
  TRY_WRITE_TOKEN(isSemiColon, 6) //;
  return true;
}

bool SyntaxChecker::compileLet(int tab_count) {
  std::string name = "letStatement";
  TRY_WRITE_TOKEN(isLet, 0)                  // let
  TRY_WRITE_TOKEN(isVarName, 1)              // varName
  CONDITION_COMPILATION(isOpenSquareBracket, // [expression] ?
                        TRY_WRITE_TOKEN(isOpenSquareBracket, 2)   // [
                        TRY_COMPILE(CompileExpression)            // expression
                        TRY_WRITE_TOKEN(isCloseSquareBracket, 3)) // ]

  TRY_WRITE_TOKEN(isEquality, 4)  // =
  TRY_COMPILE(CompileExpression)  // expression
  TRY_WRITE_TOKEN(isSemiColon, 5) // ;
  return true;
}

bool SyntaxChecker::compileWhile(int tab_count) {
  std::string name = "whileStatement";
  TRY_WRITE_TOKEN(isWhile, 0)             // while
  TRY_WRITE_TOKEN(isOpenRoundBracket, 1)  // (
  TRY_COMPILE(CompileExpression)          // expression
  TRY_WRITE_TOKEN(isCloseRoundBracket, 2) // )
  TRY_WRITE_TOKEN(isOpenCurlyBracket, 3)  // {
  TRY_COMPILE(compileStatements)          // statements
  TRY_WRITE_TOKEN(isCloseCurlyBracket, 4) // }
  return true;
}

bool SyntaxChecker::compileFor(int tab_count) {
  std::string name = "forStatement";
  TRY_WRITE_TOKEN(isFor, 0)               // for
  TRY_WRITE_TOKEN(isOpenRoundBracket, 1)  // (
  TRY_COMPILE(compileLet)                 // let statement (with ;)
  TRY_COMPILE(CompileExpression)          // expression
  TRY_WRITE_TOKEN(isSemiColon, 2)         // ;
  TRY_COMPILE(compileLet)                 // let statement
  TRY_WRITE_TOKEN(isCloseRoundBracket, 3) // )
  TRY_WRITE_TOKEN(isOpenCurlyBracket, 4)  // {
  TRY_COMPILE(compileStatements)          // statements
  TRY_WRITE_TOKEN(isCloseCurlyBracket, 5) // }
  return true;
}

bool SyntaxChecker::compileReturn(int tab_count) {
  std::string name = "returnStatement";
  TRY_WRITE_TOKEN(isReturn, 0)                          // return
  CONDITION_COMPILATION(isExpression,                   // expression ?
                        TRY_COMPILE(CompileExpression)) // expression
  TRY_WRITE_TOKEN(isSemiColon, 1)
  return true;
}

bool SyntaxChecker::compileIf(int tab_count) {
  std::string name = "ifStatement";
  TRY_WRITE_TOKEN(isIf, 0)                // if
  TRY_WRITE_TOKEN(isOpenRoundBracket, 1)  // (
  TRY_COMPILE(CompileExpression)          // expression
  TRY_WRITE_TOKEN(isCloseRoundBracket, 2) // )
  TRY_WRITE_TOKEN(isOpenCurlyBracket, 3)  // {
  TRY_COMPILE(compileStatements)          // statements
  TRY_WRITE_TOKEN(isCloseCurlyBracket, 4) // }

  CONDITION_COMPILATION(isElse,                    // (else {statements})?
                        TRY_WRITE_TOKEN(isElse, 5) // else
                        TRY_WRITE_TOKEN(isOpenCurlyBracket, 6)  // {
                        TRY_COMPILE(compileStatements)          // statements
                        TRY_WRITE_TOKEN(isCloseCurlyBracket, 7) // }
  )
  return true;
}

bool SyntaxChecker::CompileExpression(int tab_count) {
  std::string name = "expression";
  TRY_COMPILE(CompileTerm)                    // term
  ASTRIX_COMPILATION(isOp,                    // (op term)*
                     TRY_WRITE_TOKEN(isOp, 0) // op
                     TRY_COMPILE(CompileTerm) // term
  )
  return true;
}

bool SyntaxChecker::CompileTerm(int tab_count) {
  std::string name = "term";

  CONDITION_COMPILATION(isConstantTerm,
                        TRY_WRITE_TOKEN(isConstantTerm,
                                        0) // integerConstant | stringConstant |
                                           // keywordConstant
                        return true;)

  CONDITION_COMPILATION(isUnaryOp, TRY_WRITE_TOKEN(isUnaryOp, 1) // unaryOp
                        TRY_COMPILE(CompileTerm)                 // term
                        return true;)

  CONDITION_COMPILATION(isOpenRoundBracket,
                        TRY_WRITE_TOKEN(isOpenRoundBracket, 2)  // (
                        TRY_COMPILE(CompileExpression)          // expression
                        TRY_WRITE_TOKEN(isCloseRoundBracket, 3) // )
                        return true;)

  // subroutineCall
  SUBROUTINE_CALL(4, 5, 6, 7, 8, true)

  CONDITION_COMPILATION(isAddressTakeExpression,
                        TRY_WRITE_TOKEN(isVarName, 9)             // varName
                        TRY_WRITE_TOKEN(isOpenSquareBracket, 10)  // [
                        TRY_COMPILE(CompileExpression)            // expression
                        TRY_WRITE_TOKEN(isCloseSquareBracket, 11) // ]
                        return true;)

  CONDITION_COMPILATION(isVarName, TRY_WRITE_TOKEN(isVarName, 12) // varName
                        return true;)

  return compilationError("Term couldn't be parsed properly");
}

bool SyntaxChecker::CompileExpressionList(int tab_count) {
  std::string name = "expressionList";
  CONDITION_COMPILATION(
      isExpression,                  // (expression (, expression)* )?
      TRY_COMPILE(CompileExpression) // expression
      ASTRIX_COMPILATION(isComma,    // (, expression)*
                         TRY_WRITE_TOKEN(isComma, 0)      // ,
                         TRY_COMPILE(CompileExpression))) // expression

  return true;
}

std::string SyntaxChecker::getError() { return compilation_error_; }

bool SyntaxChecker::process() { return CompileClass(0); }
