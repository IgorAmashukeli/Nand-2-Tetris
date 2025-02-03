#pragma once
#include "JackTokenizer.hpp"
#include <fstream>
#include <vector>

class SyntaxChecker {
public:
  SyntaxChecker(const std::vector<std::vector<std::string>> &tokens);
  bool process();
  bool CompileClass(int tab_count);
  bool CompileAdditionalVarNames(int tab_count);
  bool CompileClassVarDec(int tab_count);
  bool CompileSubroutineDec(int tab_count);
  bool CompileSubroutineBody(int tab_count);
  bool compileParameterList(int tab_count);
  bool CompileVarDecs(int tab_count);
  bool compileVarDec(int tab_count);
  bool compileStatements(int tab_count);
  bool compileDo(int tab_count);
  bool compileLet(int tab_count);
  bool compileWhile(int tab_count);
  bool compileReturn(int tab_count);
  bool compileIf(int tab_count);
  bool compileFor(int tab_count);
  bool CompileSubroutineCall(int tab_count);
  bool CompileExpression(int tab_count);
  bool CompileTerm(int tab_count);
  bool CompileExpressionList(int tab_count);
  std::string getError();

private:
  bool compilationError(const std::string &error);
  void writeToken(int tab_count);
  bool isEndOfFile();
  bool isClass();
  bool isConstructor();

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
  bool isFor();

  bool isReturn();
  bool isKeyword();
  bool isSymbol();
  bool isOpenCurlyBracket();
  bool isType();
  bool isOp();
  bool isUnaryOp();
  bool isKeywordConstant();

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
  bool isIntegerConstant();
  bool isStringConstant();
  bool isIdentifier();
  bool isClassVarDec();
  bool isSubroutine();
  bool isSubroutineKind();
  bool isSubroutineType();
  bool isVarDec();
  bool isClassName();
  bool isSubroutineName();
  bool isVarName();
  bool isStatements();
  bool isTerm();
  bool isExpression();
  bool isConstantTerm();
  bool isNextBracketDot();
  bool isSubroutineCall();
  bool isAddressTakeExpression();
  bool isNonClassSubroutineCall();
  bool isClassSubroutineCall();

  std::string compilation_error_;
  std::vector<std::vector<std::string>> tokens_;
  size_t index_{0};
  size_t length_;

  std::unordered_map<std::string, std::vector<std::string>> errors_ = {
      {"class",
       {"File started without class", "No name for class provided",
        "No curly bracket opened for class",
        "No curly bracket closed for class"}},
      {
          "classVarDec",
          {"Class var declarations has no static or field keyword",
           "Class var declaration has no type",
           "Class var declaration has no name", "No comma before identifier",
           "No identifier after comma",
           "There is no semicolom in class var declaration"},
      },
      {"subroutineDec",
       {"Subroutine declaration has no kind",
        "Subroutine declaration has no type", "Subroutine has no name",
        "Subroutine doesn't open parenthesis",
        "Subroutine doesn't close parenthesis"}},

      {"subroutineBody",
       {"Subroutine body has no open curly bracket",
        "Subroutine body has no closed curly bracket"}},

      {"parameterList",
       {"First parameter in parameterList has no type",
        "First parameter in parameterList has no varName",
        "There is no comma in parameterList",
        "There is no type in parameterList",
        "There is no varName in parameterList"}},

      {"varDec",
       {"There is no var in var declaration",
        "There is no type in var declaration",
        "There is no varName in var declaration",
        "There is no comma after first variable in var declaration",
        "There is no varName after first variable in var declaration",
        "There is no semicolon in var declatation"

       }},

      {"doStatement",
       {
           "There is no do in do statement",

           "There is no semicolon in do statement",

       }},

      {"letStatement",
       {"There is no let in let statement",
        "There is no varName in let statement",
        "There is no square bracket in square bracket let statement",
        "Square bracket is not closed",
        "There is no equality sign in let statement",
        "There is no semicolon in let statement"}},

      {"whileStatement",
       {"There is no while in while statement",
        "There is no open round bracket in while statement",
        "There is no closed round bracket in while statement",
        "There is no open curly bracket in while statement",
        "There is no closed curly bracket in while statement"}},

      {"returnStatement",
       {"There is no return keyword in return statement",
        "There is no subroutine name in subroutine call",
        "There is no open round bracket in subroutine call",
        "There is no closed round bracket in subroutine call",
        "There is no className or varName in subroutine call",
        "There is no dot in subroutine call",
        "There is no semicolon in return statement"}},

      {"ifStatement",
       {"There is no if in if statement",
        "There is no round open bracket in if statement",
        "There is no round closed bracket in if statement",
        "There is no curly open bracket in if statement",
        "There is no curly closed bracket in if statement",
        "There is no else in else statement",
        "There is no curly open bracket in else statement",
        "There is no curly closed bracket in else statement"}},

      {"forStatement",
       {"There is no for in for statement",
        "There is no round open bracket in for statement",
        "There is no semicolon after expression in for statement",
        "There is no round close bracket in for statement",
        "There is no curly open bracket in for statement",
        "There is no curly close bracket in for statement"}},

      {"expression", {"There is no op in other terms of expression"}},

      {"term",
       {"There is no constant in constant term",
        "There is no unary op in unary op term",
        "There is no open round bracket in round bracket expression term",
        "There is no closed round bracket in round bracket expression term",
        "There is no subroutine name in subroutine call",
        "There is no open round bracket in subroutine call",
        "There is no closed round bracket in subroutine call",
        "There is no className or varName in subroutine call",
        "There is no dot in subroutine call",
        "There is no var name in address take expression term",
        "There is no open square bracket in address take expression term",
        "There is no close square bracket in address take expression term",
        "There is no var name in var name expression term"

       }},

      {"expressionList", {"There is no comma in not single expression list "}}

  };
};