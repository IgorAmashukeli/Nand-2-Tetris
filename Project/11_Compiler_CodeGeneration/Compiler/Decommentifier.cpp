#include "Decommentifier.hpp"
#include <iostream>

Decommentifier::Decommentifier(const std::string &content) {
  content_ = content;
}

bool Decommentifier::isEndOfOneLineComment() {
  return one_line_comment_ && content_[index_] == '\n';
}

bool Decommentifier::isEndOfMultipleLineComment() {
  return multiple_line_comment_ && content_[index_] == '*' &&
         index_ + 1 < length_ && content_[index_ + 1] == '/';
}

bool Decommentifier::isStartOfOneLineComment() {
  return !one_line_comment_ && !multiple_line_comment_ && !double_quote_ &&
         content_[index_] == '/' && index_ + 1 < length_ &&
         content_[index_ + 1] == '/';
}

bool Decommentifier::isStartOfMultipleLineComment() {
  return !one_line_comment_ && !multiple_line_comment_ && !double_quote_ &&
         content_[index_] == '/' && index_ + 1 < length_ &&
         content_[index_ + 1] == '*';
}

bool Decommentifier::isStartOfDoubleQuote() {
  return !one_line_comment_ && !multiple_line_comment_ && !double_quote_ &&
         content_[index_] == '"';
}

bool Decommentifier::isEndOfDoubleQuote() {
  return !one_line_comment_ && !multiple_line_comment_ && double_quote_ &&
         content_[index_] == '"';
}

bool Decommentifier::isNotComment() {
  return !one_line_comment_ && !multiple_line_comment_;
}

void Decommentifier::endOfOneLineComment() {
  no_comments_ += "\n";
  one_line_comment_ = false;
  index_++;
}

void Decommentifier::endOfMulipleLineComment() {
  no_comments_ += " ";
  multiple_line_comment_ = false;
  index_ = index_ + 2;
}

void Decommentifier::startOfOneLineComment() {
  one_line_comment_ = true;
  index_ = index_ + 2;
}

void Decommentifier::startOfMultipleLineComment() {
  multiple_line_comment_ = true;
  index_ = index_ + 2;
}

void Decommentifier::startOfDoubleQuote() {
  double_quote_ = true;
  no_comments_ += content_[index_];
  index_++;
}

void Decommentifier::endOfDoubleQuote() {
  double_quote_ = false;
  no_comments_ += content_[index_];
  index_++;
}

void Decommentifier::notComment() {
  no_comments_ += content_[index_];
  index_++;
}

void Decommentifier::shift() { index_++; }

std::string Decommentifier::deleteComments() {
  length_ = content_.size();
  index_ = 0;
  while (index_ < length_) {
    if (isEndOfOneLineComment()) {
      endOfOneLineComment();
    } else if (isEndOfMultipleLineComment()) {
      endOfMulipleLineComment();
    } else if (isStartOfOneLineComment()) {
      startOfOneLineComment();
    } else if (isStartOfMultipleLineComment()) {
      startOfMultipleLineComment();
    } else if (isStartOfDoubleQuote()) {
      startOfDoubleQuote();
    } else if (isEndOfDoubleQuote()) {
      endOfDoubleQuote();
    } else if (isNotComment()) {
      notComment();
    } else {
      shift();
    }
  }
  return no_comments_;
}
