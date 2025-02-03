#pragma once
#include "Parser.hpp"
#include <cassert>
#include <fstream>
#include <string>
#include <unordered_map>

class CodeWriter {
public:
  CodeWriter(const std::string &path);
  void setFileName(const std::string &name);
  void writeArithmetic(const std::string &command);
  void WritePushPop(Command command, const std::string &segment, int index);

private:
  std::string writePush(const std::string &segment, int index);
  std::string writePop(const std::string &segment, int index);

  std::string pushConstant(int value);
  std::string pushSegment(const std::string &segment, int index);
  std::string popSegment(const std::string &segment, int index);
  std::string save_sum_in_address(const std::string &segment_symbol,
                                  const std::string &index_string);
  std::string incrementPointer();
  std::string decrementPointer();
  std::string putDValuetoStack();
  std::string takeDValuefromStack();
  std::string pushDValueToStack();
  std::string popDValueFromStack();
  std::string pushStatic(int index);
  std::string popStatic(int index);
  std::string pushTempPointer(int shift, int index);
  std::string popTempPointer(int shift, int index);

  std::string check(const std::string &word);
  std::string createUnaryInstruction(const std::string &command);
  std::string createBinaryInstruction(const std::string &command);

  void writePushPopComment(Command command, const std::string &segment,
                           int index);

  void writeArithmeticComment(const std::string &command);
  std::string splitFilename(const std::string &str);
  std::string name_;
  std::ofstream asm_file_;
  size_t label_index_{0};
};