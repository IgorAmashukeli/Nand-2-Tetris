#pragma once
#include <cstddef>
#include <fstream>
#include <sstream>
#include <string>

class Decommentifier {
public:
  Decommentifier(const std::string &path);
  std::string deleteComments();

private:
  bool isEndOfOneLineComment();
  bool isEndOfMultipleLineComment();
  bool isStartOfOneLineComment();
  bool isStartOfMultipleLineComment();
  bool isStartOfDoubleQuote();
  bool isStartOfSingleQuote();
  bool isEndOfSingleQuote();
  bool isEndOfDoubleQuote();
  bool isNotComment();

  void endOfMulipleLineComment();
  void startOfOneLineComment();
  void endOfOneLineComment();
  void startOfMultipleLineComment();
  void startOfDoubleQuote();
  void startOfSingleQuote();
  void endOfSingleQuote();
  void endOfDoubleQuote();
  void notComment();
  void shift();

  std::string content_;
  std::string no_comments_;
  std::ifstream in_file_;

  size_t length_{0};
  size_t index_{0};
  bool one_line_comment_{false};
  bool multiple_line_comment_{false};
  bool double_quote_{false};
};