#include "CompilationEngine.hpp"
#include "JackTokenizer.hpp"
#include <cstddef>
#include <ios>
#include <string>
#include <unordered_set>

CompilationEngine::CompilationEngine(const std::string &path) { path_ = path; }

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

bool CompilationEngine::isOp() {
  std::unordered_set<std::string> ops = {"+", "-", "*", "/", "&",
                                         "|", "<", ">", "="};
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

bool CompilationEngine::isEndOfFile() { return index_ >= length_; }

bool CompilationEngine::isVarDec() { return isVar(); }

bool CompilationEngine::isClassName() { return isIdentifier(); }

bool CompilationEngine::isSubroutineName() { return isIdentifier(); }

bool CompilationEngine::isVarName() { return isIdentifier(); }

void CompilationEngine::writeTabs(int tab_count) {
  for (size_t i = 0; i < tab_count; ++i) {
    out_file_ << "\t";
  }
}

void CompilationEngine::writeOpenTag(const std::string &tag, int tab_count) {
  writeTabs(tab_count);
  out_file_ << "<" + tag + ">\n";
}

void CompilationEngine::writeCloseTag(const std::string &tag, int tab_count) {
  writeTabs(tab_count);
  out_file_ << "</" + tag + ">\n";
}

void CompilationEngine::writeToken(int tab_count) {
  writeTabs(tab_count);
  std::string token = tokens_[index_][0];
  if (token == "<") {
    token = "&lt;";
  } else if (token == ">") {
    token = "&gt;";
  } else if (token == "\"") {
    token = "&quot;";
  } else if (token == "&") {
    token = "&amp;";
  }
  out_file_ << "<" + tokens_[index_][1] + "> " + token + " </" +
                   tokens_[index_][1] + ">\n";
  index_++;
}

void CompilationEngine::eraseFileContent() {
  out_file_.close();
  out_file_.open(output_file_path_);
}

bool CompilationEngine::compilationError(const std::string &error) {
  compilation_error_ = error;
  // eraseFileContent();
  return false;
}

bool CompilationEngine::isClassVarDec() { return isStatic() || isField(); }
bool CompilationEngine::isSubroutine() {
  return isConstructor() || isFunction() || isMethod();
}

bool CompilationEngine::isStatements() {
  return isLet() || isIf() || isWhile() || isDo() || isReturn();
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

#define OPEN_TREE(name) writeOpenTag(name, tab_count);

#define CLOSE_TREE(name)                                                       \
  writeCloseTag(name, tab_count);                                              \
  return true;

#define FLAG_CLOSE_TREE(flag)                                                  \
  if (flag) {                                                                  \
    CLOSE_TREE(name)                                                           \
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
          TRY_WRITE_TOKEN(isIdentifier, ind4)        /*(className |varName)*/  \
          TRY_WRITE_TOKEN(isDot, ind5)               /*.*/                     \
          TRY_WRITE_TOKEN(isIdentifier, ind1)        /*subroutineName*/        \
          TRY_WRITE_TOKEN(isOpenRoundBracket, ind2)  /*(*/                     \
          TRY_COMPILE(CompileExpressionList)         /*expressionList*/        \
          TRY_WRITE_TOKEN(isCloseRoundBracket, ind3) /*)*/                     \
          FLAG_CLOSE_TREE(flag))                     /**/                      \
      FLAG_RETURN_SUBROUTINE_CALL(flag))

bool CompilationEngine::CompileClass(int tab_count) {
  std::string name = "class";
  OPEN_TREE(name)
  TRY_WRITE_TOKEN(isClass, 0)            // 'class'
  TRY_WRITE_TOKEN(isClassName, 1)        // 'className'
  TRY_WRITE_TOKEN(isOpenCurlyBracket, 2) // '{'

  ASTRIX_COMPILATION(isClassVarDec,                   // classVarDec*
                     TRY_COMPILE(CompileClassVarDec)) // classVarDec

  ASTRIX_COMPILATION(isSubroutine,                      // subroutineDec*
                     TRY_COMPILE(CompileSubroutineDec)) // subroutineDec
  TRY_WRITE_LAST_TOKEN(isCloseCurlyBracket, 3)          // '}'
  CLOSE_TREE(name)
};

bool CompilationEngine::CompileClassVarDec(int tab_count) {
  std::string name = "classVarDec";
  OPEN_TREE(name)
  TRY_WRITE_TOKEN(isClassVarDec, 0) // ('static' |
                                    // 'field')
  TRY_WRITE_TOKEN(isType, 1)        // type
  TRY_WRITE_TOKEN(isVarName, 2)     // varName

  ASTRIX_COMPILATION(isComma,                       // (',' varName)*
                     TRY_WRITE_TOKEN(isComma, 3)    // ,
                     TRY_WRITE_TOKEN(isVarName, 4)) // varName

  TRY_WRITE_TOKEN(isSemiColon, 5) // ';'
  CLOSE_TREE(name)
}

bool CompilationEngine::CompileSubroutineDec(int tab_count) {
  std::string name = "subroutineDec";
  OPEN_TREE(name)
  TRY_WRITE_TOKEN(isSubroutineKind,
                  0) // ('constructor' | 'function'
  // | 'method')
  TRY_WRITE_TOKEN(isSubroutineType, 1)    //('void' | type)
  TRY_WRITE_TOKEN(isSubroutineName, 2)    // subroutineName
  TRY_WRITE_TOKEN(isOpenRoundBracket, 3)  //'('
  TRY_COMPILE(compileParameterList)       // parameterList
  TRY_WRITE_TOKEN(isCloseRoundBracket, 4) // ')'
  TRY_COMPILE(CompileSubroutineBody)      // subroutineBody
  CLOSE_TREE(name)
}

bool CompilationEngine::CompileSubroutineBody(int tab_count) {
  std::string name = "subroutineBody";
  OPEN_TREE(name)
  TRY_WRITE_TOKEN(isOpenCurlyBracket, 0)         // '{'
  ASTRIX_COMPILATION(isVarDec,                   // varDec*
                     TRY_COMPILE(compileVarDec)) // varDec
  TRY_COMPILE(compileStatements)                 // statements
  TRY_WRITE_TOKEN(isCloseCurlyBracket, 1)        // '}'
  CLOSE_TREE(name)
}

bool CompilationEngine::compileParameterList(int tab_count) {
  std::string name = "parameterList";
  OPEN_TREE(name)
  CONDITION_COMPILATION(
      isType,                       // (type varName (, type varName)*)?
      TRY_WRITE_TOKEN(isType, 0)    // type
      TRY_WRITE_TOKEN(isVarName, 1) // varName
      ASTRIX_COMPILATION(isComma,   // (, type varName)*
                         TRY_WRITE_TOKEN(isComma, 2)   // ,
                         TRY_WRITE_TOKEN(isType, 3)    // type
                         TRY_WRITE_TOKEN(isVarName, 4) // varName
                         ))
  CLOSE_TREE(name)
}

bool CompilationEngine::compileVarDec(int tab_count) {
  std::string name = "varDec";
  OPEN_TREE(name)
  TRY_WRITE_TOKEN(isVar, 0)                            //'var'
  TRY_WRITE_TOKEN(isType, 1)                           // type
  TRY_WRITE_TOKEN(isIdentifier, 2)                     // varName
  ASTRIX_COMPILATION(isComma,                          // (, varName)*
                     TRY_WRITE_TOKEN(isComma, 3)       // ,
                     TRY_WRITE_TOKEN(isIdentifier, 4)) // varName
  TRY_WRITE_TOKEN(isSemiColon, 5)                      // ;
  CLOSE_TREE(name)
}

bool CompilationEngine::compileStatements(int tab_count) {
  std::string name = "statements";
  OPEN_TREE(name)
  ASTRIX_COMPILATION( // statements = statement*
      isStatements,
      CONDITION_COMPILATION(isLet,
                            TRY_COMPILE(compileLet)) // let statement ?
      CONDITION_COMPILATION(isIf,
                            TRY_COMPILE(compileIf)) // if statement ?

      CONDITION_COMPILATION(isReturn,
                            TRY_COMPILE(compileReturn)) // return statement ?
      CONDITION_COMPILATION(isDo,
                            TRY_COMPILE(compileDo)) // do statement ?
      CONDITION_COMPILATION(isWhile,
                            TRY_COMPILE(compileWhile))) // while statement ?
  CLOSE_TREE(name)
}

bool CompilationEngine::compileDo(int tab_count) {
  std::string name = "doStatement";
  OPEN_TREE(name)
  TRY_WRITE_TOKEN(isDo, 0) // do
  // subroutineCall
  SUBROUTINE_CALL(1, 2, 3, 4, 5, false)
  TRY_WRITE_TOKEN(isSemiColon, 6) //;
  CLOSE_TREE(name)
}

bool CompilationEngine::compileLet(int tab_count) {
  std::string name = "letStatement";
  OPEN_TREE(name)
  TRY_WRITE_TOKEN(isLet, 0)                  // let
  TRY_WRITE_TOKEN(isVarName, 1)              // varName
  CONDITION_COMPILATION(isOpenSquareBracket, // [expression] ?
                        TRY_WRITE_TOKEN(isOpenSquareBracket, 2)   // [
                        TRY_COMPILE(CompileExpression)            // expression
                        TRY_WRITE_TOKEN(isCloseSquareBracket, 3)) // ]

  TRY_WRITE_TOKEN(isEquality, 4)  // =
  TRY_COMPILE(CompileExpression)  // expression
  TRY_WRITE_TOKEN(isSemiColon, 5) // ;
  CLOSE_TREE(name)
}

bool CompilationEngine::compileWhile(int tab_count) {
  std::string name = "whileStatement";
  OPEN_TREE(name)
  TRY_WRITE_TOKEN(isWhile, 0)             // while
  TRY_WRITE_TOKEN(isOpenRoundBracket, 1)  // (
  TRY_COMPILE(CompileExpression)          // expression
  TRY_WRITE_TOKEN(isCloseRoundBracket, 2) // )
  TRY_WRITE_TOKEN(isOpenCurlyBracket, 3)  // {
  TRY_COMPILE(compileStatements)          // statements
  TRY_WRITE_TOKEN(isCloseCurlyBracket, 4) // }
  CLOSE_TREE(name)
}

bool CompilationEngine::compileReturn(int tab_count) {
  std::string name = "returnStatement";
  OPEN_TREE(name)
  TRY_WRITE_TOKEN(isReturn, 0)                          // return
  CONDITION_COMPILATION(isExpression,                   // expression ?
                        TRY_COMPILE(CompileExpression)) // expression
  TRY_WRITE_TOKEN(isSemiColon, 1)
  CLOSE_TREE(name)
}

bool CompilationEngine::compileIf(int tab_count) {
  std::string name = "ifStatement";
  OPEN_TREE(name)
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
  CLOSE_TREE(name)
}

bool CompilationEngine::CompileExpression(int tab_count) {
  std::string name = "expression";
  OPEN_TREE(name)
  TRY_COMPILE(CompileTerm)                    // term
  ASTRIX_COMPILATION(isOp,                    // (op term)*
                     TRY_WRITE_TOKEN(isOp, 0) // op
                     TRY_COMPILE(CompileTerm) // term
  )
  CLOSE_TREE(name)
}

bool CompilationEngine::CompileTerm(int tab_count) {
  std::string name = "term";
  OPEN_TREE(name)

  CONDITION_COMPILATION(isConstantTerm,
                        TRY_WRITE_TOKEN(isConstantTerm,
                                        0) // integerConstant | stringConstant |
                                           // keywordConstant
                        CLOSE_TREE(name))

  CONDITION_COMPILATION(isUnaryOp, TRY_WRITE_TOKEN(isUnaryOp, 1) // unaryOp
                        TRY_COMPILE(CompileTerm)                 // term
                        CLOSE_TREE(name))

  CONDITION_COMPILATION(isOpenRoundBracket,
                        TRY_WRITE_TOKEN(isOpenRoundBracket, 2)  // (
                        TRY_COMPILE(CompileExpression)          // expression
                        TRY_WRITE_TOKEN(isCloseRoundBracket, 3) // )
                        CLOSE_TREE(name))

  // subroutineCall
  SUBROUTINE_CALL(4, 5, 6, 7, 8, true)

  CONDITION_COMPILATION(isAddressTakeExpression,
                        TRY_WRITE_TOKEN(isVarName, 9)             // varName
                        TRY_WRITE_TOKEN(isOpenSquareBracket, 10)  // [
                        TRY_COMPILE(CompileExpression)            // expression
                        TRY_WRITE_TOKEN(isCloseSquareBracket, 11) // ]
                        CLOSE_TREE(name))

  CONDITION_COMPILATION(isVarName, TRY_WRITE_TOKEN(isVarName, 12) // varName
                        CLOSE_TREE(name))

  return compilationError("Term couldn't be parsed properly");
}

bool CompilationEngine::CompileExpressionList(int tab_count) {
  std::string name = "expressionList";
  OPEN_TREE(name)
  CONDITION_COMPILATION(
      isExpression,                  // (expression (, expression)* )?
      TRY_COMPILE(CompileExpression) // expression
      ASTRIX_COMPILATION(isComma,    // (, expression)*
                         TRY_WRITE_TOKEN(isComma, 0)      // ,
                         TRY_COMPILE(CompileExpression))) // expression

  CLOSE_TREE(name)
}

void CompilationEngine::process() {
  JackTokenizer jack_tokenizer(path_);
  bool tok = jack_tokenizer.process();
  if (!tok) {
    compilation_error_ = jack_tokenizer.getError();
    std::cout << "Error: " << compilation_error_ << "\n";
  }
  tokens_ = jack_tokenizer.getTokens();
  length_ = tokens_.size();
  output_file_path_ = path_.substr(0, path_.size() - 5) + "My.xml";
  out_file_.open(output_file_path_);
  if (tokens_.size() == 0) {
    std::cout << "Error: no tokens generated in tokenizer";
  }
  bool comp = CompileClass(0);
  if (!comp) {
    std::cout << "Error: " << compilation_error_ << "\n";
  } else {
    std::cout << "File compiled successfully. Parsing "
                 "tree can be "
                 "found in xml "
                 "format\n";
  }
}
