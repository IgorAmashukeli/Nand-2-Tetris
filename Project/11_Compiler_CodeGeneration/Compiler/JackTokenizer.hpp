#pragma once
#include "Decommentifier.hpp"
#include <cstddef>
#include <fstream>
#include <iostream>
#include <ratio>
#include <sstream>
#include <string>
#include <unordered_map>
#include <unordered_set>
#include <vector>

class JackTokenizer {
public:
  JackTokenizer(const std::string &path);

  bool process();

  std::vector<std::vector<std::string>> getTokens();
  std::string getError();
  void outPut();

private:
  void deleteComments();
  bool isDigit(unsigned char chr);
  bool isLetter(unsigned char chr);
  bool isIdentifierChar(unsigned char chr);
  bool isSymbolChar(unsigned char chr);
  bool isWhiteSpaceChar(unsigned char chr);
  bool isDoubleQuoteChar(unsigned char chr);

  bool isSymbol();
  bool isString();
  bool isWhiteSpace();
  bool isInteger();
  bool beforeKeyWord();
  bool afterKeyWord(size_t index);
  std::string isKeyWord();
  bool isIdentifier();

  void doSymbol();
  bool doString();
  void doWhiteSpace();
  bool doInteger();
  void doKeyWord(const std::string &key_word);
  void doIdentifier();

  std::string content_;
  std::unordered_set<std::string> key_words_{
      "class", "constructor", "function", "method",  "field", "static",
      "var",   "int",         "char",     "boolean", "void",  "true",
      "false", "null",        "this",     "let",     "do",    "if",
      "else",  "while",       "return",   "for"};
  std::unordered_set<unsigned char> symbols_{'{', '}', '(', ')', '[', ']', '.',
                                             ',', ';', '+', '-', '*', '/', '&',
                                             '|', '<', '>', '=', '~', '%'};
  int max_integer_ = 32767;
  unsigned char string_quotes_ = '"';
  std::unordered_set<unsigned char> not_valid_string_chr = {'"', '\n'};
  std::vector<std::vector<std::string>> tokens_;
  std::string error_tokenisation_;
  std::string path_;

  size_t length_{0};
  size_t index_{0};
};