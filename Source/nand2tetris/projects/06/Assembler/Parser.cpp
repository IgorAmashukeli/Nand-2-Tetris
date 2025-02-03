#include "Parser.hpp"

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

Parser::Parser(const std::string &path) {
  asm_file_.open(path); // RAII file object -> no need to close in destructor
  if (!asm_file_) {
    throw std::runtime_error("Can not open assembly source file\n");
  }
}

Command Parser::commandType() {
  if (cur_command_.empty()) {
    return Command::NOT_COMMAND;
  }

  if (cur_command_[0] == '@') {
    return Command::A_COMMAND;
  }

  if (cur_command_[0] == '(') {
    return Command::L_COMMAND;
  }

  return Command::C_COMMAND;
}

std::string Parser::symbol() {
  if (commandType() == Command::L_COMMAND) {
    return cur_command_.substr(1, cur_command_.size() - 2);
  }
  if (commandType() == Command::A_COMMAND) {
    return cur_command_.substr(1, cur_command_.size() - 1);
  }
  return "";
}

void Parser::deleteSpaces() {
  cur_command_.erase(
      std::remove_if(cur_command_.begin(), cur_command_.end(), isWhitespace()),
      cur_command_.end());
}

void Parser::deleteComments() {
  std::string delimiter = "//";
  size_t comments_pos = cur_command_.find(delimiter);
  if (comments_pos != std::string::npos) {
    size_t comment_size = cur_command_.size() - comments_pos;
    cur_command_.erase(comments_pos, comment_size);
  }
}

bool Parser::advance() {
  bool hasMoreCommands =
      static_cast<bool>(std::getline(asm_file_, cur_command_));
  if (hasMoreCommands) {
    deleteSpaces();
    deleteComments();
    if (commandType() != Command::L_COMMAND &&
        commandType() != Command::NOT_COMMAND) {
      next_line_++;
    }
    if (commandType() == Command::C_COMMAND) {
      findEqualPos();
      findSemicolumnPos();
    }
  }
  return hasMoreCommands;
}

int Parser::getLineNumber() { return next_line_; }

void Parser::findEqualPos() {
  std::string delimiter1 = "=";
  equal_pos_ = cur_command_.find(delimiter1);
}

void Parser::findSemicolumnPos() {
  std::string delimiter2 = ";";
  semicolumn_pos_ = cur_command_.find(delimiter2);
}

std::string Parser::comp() {

  std::string beforeJump;
  if (semicolumn_pos_ == std::string::npos) {
    beforeJump = cur_command_;
  } else {
    beforeJump = cur_command_.substr(0, semicolumn_pos_);
  }

  if (equal_pos_ == std::string::npos) {
    return beforeJump;
  }

  size_t size = beforeJump.size() - equal_pos_ - 1;
  return beforeJump.substr(equal_pos_ + 1, size);
}

std::string Parser::dest() {

  if (equal_pos_ == std::string::npos) {
    return "null";
  }

  return cur_command_.substr(0, equal_pos_);
}

std::string Parser::jump() {
  if (semicolumn_pos_ == std::string::npos) {
    return "null";
  }
  size_t size = cur_command_.size() - semicolumn_pos_ - 1;
  return cur_command_.substr(semicolumn_pos_ + 1, size);
}
