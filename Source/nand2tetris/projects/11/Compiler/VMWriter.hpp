#pragma once
#include <cassert>
#include <fstream>

enum class Segment { CONST, ARG, LOCAL, STATIC, THIS, THAT, POINTER, TEMP };

enum class ArithmeticCommand { ADD, SUB, NEG, EQ, GT, LT, AND, OR, NOT };

class VMWriter {
public:
  VMWriter(const std::string &out_file_path);
  void writePush(const Segment &segment, int index);
  void writePop(const Segment &segment, int index);
  void WriteArithmetic(const ArithmeticCommand &command);
  void WriteLabel(const std::string &label);
  void WriteGoto(const std::string &label);
  void WriteIf(const std::string &label);
  void writeCall(const std::string &name, int nArgs);
  void writeFunction(const std::string &name, int nArgs);
  void writeReturn();

private:
  std::string segmentString(const Segment &segment);
  std::ofstream file_;
};
