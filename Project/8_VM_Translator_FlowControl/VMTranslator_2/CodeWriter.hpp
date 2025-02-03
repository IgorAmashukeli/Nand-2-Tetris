#pragma once
#include "Parser.hpp"
#include <cassert>
#include <fstream>
#include <string>
#include <unordered_map>

class CodeWriter {
public:
  CodeWriter() = default;
  CodeWriter(const std::string &path);
  void setFileName(const std::string &name);
  std::string writeArithmetic(const std::string &command);
  std::string WritePushPop(Command command, const std::string &segment,
                           int index);
  std::string writeInit();
  std::string writeLabel(const std::string &label);
  std::string writeGoto(const std::string &label);
  std::string writeIf(const std::string &label);
  std::string writeCall(std::string &function_name, int nArgs);
  std::string writeReturn();
  std::string writeFunction(std::string &function_name, int nArgs);

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

  std::string writePushPopComment(Command command, const std::string &segment,
                                  int index);
  std::string putLabelInD(const std::string &label);
  std::string pushReturnAddressOnTheStack(const std::string &return_address);
  std::string saveCurSegmentsOnTheStack();
  std::string shiftArg(int nArgs);
  std::string ARG_Pos(int arg_shift);
  std::string shiftLCL();
  std::string pushZeroes(int nArgs);

  std::string writeArithmeticComment(const std::string &command);
  std::string splitFilename(const std::string &str);
  std::string saveEndFrame();
  std::string saveRetAddress();
  std::string repositionReturnValue();
  std::string repositionSP();
  std::string gotoReturnAddress();
  std::string name_;
  size_t label_index_{0};
  std::unordered_set<std::string> used_labels_ = {"PUSH", "NOTPUSH"};
  std::unordered_map<std::string, std::string> new_labels_;
  std::string cur_function_name_{""};
  std::unordered_map<std::string, size_t> cur_return_ints_;
};