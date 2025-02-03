#include "JackTokenizer.hpp"

class isWhitespace {
public:
  bool operator()(unsigned c) {
    if (c == ' ' || c == '\t' || c == '\n' || c == '\r' || c == '\f' ||
        c == '\v') {
      return true;
    } else {
      return false;
    }
  }
};

JackTokenizer::JackTokenizer(const std::string &path) {
  path_ = path;
  std::ifstream t(path);
  std::stringstream buffer;
  buffer << t.rdbuf();
  content_ = buffer.str();
}

bool JackTokenizer::isDigit(unsigned char chr) {
  return (chr - '0' >= 0) && (chr - '0' <= 9);
}

bool JackTokenizer::isLetter(unsigned char chr) {
  bool lower = (chr - 'a' >= 0) && (chr - 'a' <= 25);
  bool upper = (chr - 'A' >= 0) && (chr - 'A' <= 25);
  return lower || upper;
}

bool JackTokenizer::isIdentifierChar(unsigned char chr) {
  return isDigit(chr) || isLetter(chr) || (chr == '_');
}

void JackTokenizer::deleteComments() {
  Decommentifier decommentifier(content_);
  content_ = decommentifier.deleteComments();
}

bool JackTokenizer::isSymbolChar(unsigned char chr) {
  return symbols_.find(chr) != symbols_.end();
}

bool JackTokenizer::isSymbol() { return isSymbolChar(content_[index_]); }

bool JackTokenizer::isString() { return content_[index_] == string_quotes_; }

bool JackTokenizer::isWhiteSpaceChar(unsigned char chr) {
  isWhitespace is_white_space;
  return is_white_space(chr);
}

bool JackTokenizer::isWhiteSpace() {
  return isWhiteSpaceChar(content_[index_]);
}

bool JackTokenizer::isDoubleQuoteChar(unsigned char chr) { return chr == '"'; }

bool JackTokenizer::isInteger() { return isDigit(content_[index_]); }

bool JackTokenizer::beforeKeyWord() {
  return index_ == 0 || isSymbolChar(content_[index_ - 1]) ||
         isWhiteSpaceChar(content_[index_ - 1]) ||
         isDoubleQuoteChar(content_[index_ - 1]);
}

bool JackTokenizer::afterKeyWord(size_t index) {
  return index >= length_ || isSymbolChar(content_[index]) ||
         isWhiteSpaceChar(content_[index]) ||
         isDoubleQuoteChar(content_[index]);
}

std::string JackTokenizer::isKeyWord() {
  bool before_key_word = beforeKeyWord();

  if (!before_key_word) {
    return "";
  }

  std::string found_key_word;
  size_t key_word_end;
  for (const auto &key_word : key_words_) {
    if (content_.substr(index_, key_word.size()) == key_word) {
      found_key_word = key_word;
      key_word_end = index_ + key_word.size();
      break;
    }
  }

  if (!found_key_word.empty() && !afterKeyWord(key_word_end)) {
    return "";
  }

  return found_key_word;
}

bool JackTokenizer::isIdentifier() {
  return isIdentifierChar(content_[index_]) && !isDigit(content_[index_]);
}

void JackTokenizer::doSymbol() {
  tokens_.push_back({content_.substr(index_, 1), "symbol"});
  index_++;
}

void JackTokenizer::doWhiteSpace() { index_++; }

bool JackTokenizer::doString() {
  std::string string_constant;
  index_++;

  if (index_ >= length_) {
    error_tokenisation_ = "StringConstant ended before end of file";
    tokens_ = {};
    return false;
  }

  while (index_ < length_ && content_[index_] != string_quotes_) {
    if (content_[index_] == '\n') {
      error_tokenisation_ = "StringConstant contained a newline character";
      tokens_ = {};
      return false;
    }
    string_constant += content_[index_];
    index_++;
  }

  if (index_ >= length_) {
    error_tokenisation_ = "StringConstant ended before end of file";
    tokens_ = {};
    return false;
  }

  tokens_.push_back({string_constant, "stringConstant"});
  index_++;

  return true;
}

bool JackTokenizer::doInteger() {
  std::string integer_constant;
  while (index_ < length_ && isDigit(content_[index_])) {
    integer_constant += content_[index_];
    index_++;
  }
  if (integer_constant.size() > 6) {
    error_tokenisation_ = "IntegerConstant is too big";
    tokens_ = {};
    return false;
  }

  if (std::stoi(integer_constant) > 32767) {
    error_tokenisation_ = "IntegerConstant is too big";
    tokens_ = {};
    return false;
  }

  if (index_ < length_ && isIdentifierChar(content_[index_])) {
    error_tokenisation_ = "Identifier started from an integer";
    tokens_ = {};
    return false;
  }

  tokens_.push_back({integer_constant, "integerConstant"});

  return true;
}

void JackTokenizer::doKeyWord(const std::string &key_word) {
  tokens_.push_back({key_word, "keyword"});

  index_ += key_word.size();
}

std::vector<std::vector<std::string>> JackTokenizer::getTokens() {
  return tokens_;
}

void JackTokenizer::doIdentifier() {
  std::string identifier;
  while (index_ < length_ && isIdentifierChar(content_[index_])) {
    identifier += content_[index_];
    index_++;
  }
  tokens_.push_back({identifier, "identifier"});
}

std::string JackTokenizer::getError() { return error_tokenisation_; }

bool JackTokenizer::process() {
  deleteComments();
  length_ = content_.size();

  while (index_ < length_) {
    if (isSymbol()) {
      doSymbol();
    } else if (isString()) {
      bool string_tok_code = doString();
      if (!string_tok_code) {
        return false;
      }
    } else if (isWhiteSpace()) {
      doWhiteSpace();
    } else if (isInteger()) {
      bool integer_tok_code = doInteger();
      if (!integer_tok_code) {
        return false;
      }
    } else {
      std::string found_key_word = isKeyWord();
      if (!found_key_word.empty()) {
        doKeyWord(found_key_word);
      } else {
        if (isIdentifier()) {
          doIdentifier();
        } else {
          error_tokenisation_ =
              "Found an element, which is nor keyword nor symbol nor "
              "IntegerConstant nor StringConstant nor Identiier";
          tokens_ = {};
          return false;
        }
      }
    }
  }
  return true;
}

void JackTokenizer::outPut() {
  std::string output_file_path = path_.substr(0, path_.size() - 5) + "MyT.xml";
  std::ofstream out_file_;
  out_file_.open(output_file_path);
  out_file_ << "<tokens>\n";
  for (size_t i = 0; i < tokens_.size(); ++i) {
    std::string token = tokens_[i][0];
    if (token == "<") {
      token = "&lt;";
    } else if (token == ">") {
      token = "&gt;";
    } else if (token == "\"") {
      token = "&quot;";
    } else if (token == "&") {
      token = "&amp;";
    }
    out_file_ << "\t<" + tokens_[i][1] + "> " + token + " </" + tokens_[i][1] +
                     ">\n";
  }
  out_file_ << "</tokens>\n";
}
