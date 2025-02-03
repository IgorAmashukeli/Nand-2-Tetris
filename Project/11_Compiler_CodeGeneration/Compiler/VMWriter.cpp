#include "VMWriter.hpp"
#include <cassert>
#include <string>

VMWriter::VMWriter(const std::string &out_file_path) {
  file_.open(out_file_path);
}

std::string VMWriter::segmentString(const Segment &segment) {
  if (segment == Segment::STATIC) {
    return "static";
  }

  if (segment == Segment::ARG) {
    return "argument";
  }

  if (segment == Segment::CONST) {
    return "constant";
  }

  if (segment == Segment::LOCAL) {
    return "local";
  }

  if (segment == Segment::POINTER) {
    return "pointer";
  }

  if (segment == Segment::TEMP) {
    return "temp";
  }

  if (segment == Segment::THIS) {
    return "this";
  }

  if (segment == Segment::THAT) {
    return "that";
  }

  // segment not found
  assert(false);

  return "";
}

std::string arithmeticString(const ArithmeticCommand &arithmetic_command) {
  if (arithmetic_command == ArithmeticCommand::ADD) {
    return "add";
  }

  if (arithmetic_command == ArithmeticCommand::AND) {
    return "and";
  }

  if (arithmetic_command == ArithmeticCommand::EQ) {
    return "eq";
  }

  if (arithmetic_command == ArithmeticCommand::GT) {
    return "gt";
  }

  if (arithmetic_command == ArithmeticCommand::LT) {
    return "lt";
  }

  if (arithmetic_command == ArithmeticCommand::NEG) {
    return "neg";
  }

  if (arithmetic_command == ArithmeticCommand::NOT) {
    return "not";
  }

  if (arithmetic_command == ArithmeticCommand::OR) {
    return "or";
  }

  if (arithmetic_command == ArithmeticCommand::SUB) {
    return "sub";
  }

  // arithmetic command not found
  assert(false);

  return "";
}

void VMWriter::writePush(const Segment &segment, int index) {
  file_ << "push"
        << " " << segmentString(segment) << " " << std::to_string(index)
        << "\n";
}

void VMWriter::writePop(const Segment &segment, int index) {
  file_ << "pop"
        << " " << segmentString(segment) << " " << std::to_string(index)
        << "\n";
}

void VMWriter::WriteArithmetic(const ArithmeticCommand &arithmetic_command) {
  file_ << arithmeticString(arithmetic_command) << "\n";
}

void VMWriter::WriteLabel(const std::string &label) {
  file_ << "label"
        << " " << label << "\n";
}

void VMWriter::WriteGoto(const std::string &label) {
  file_ << "goto"
        << " " << label << "\n";
}

void VMWriter::WriteIf(const std::string &label) {
  file_ << "if-goto"
        << " " << label << "\n";
}

void VMWriter::writeCall(const std::string &name, int nArgs) {
  file_ << "call"
        << " " << name << " " << std::to_string(nArgs) << "\n";
}

void VMWriter::writeFunction(const std::string &name, int nArgs) {
  file_ << "function"
        << " " << name << " " << std::to_string(nArgs) << "\n";
}

void VMWriter::writeReturn() {
  file_ << "return"
        << "\n";
}
