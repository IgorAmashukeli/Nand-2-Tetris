#include "CodeWriter.hpp"
#include "Parser.hpp"
#include <iostream>
#include <string>

CodeWriter::CodeWriter(const std::string &path) {
  std::string name = path.substr(0, path.size() - 3);
  setFileName(name);
  std::string output_name = name + ".asm";
  asm_file_.open(output_name); // RAII - no need to close the file
}

std::string CodeWriter::splitFilename(const std::string &str) {
  std::size_t found = str.find_last_of("/");
  return str.substr(found + 1);
}

void CodeWriter::setFileName(const std::string &name) {
  name_ = splitFilename(name);
}

std::string CodeWriter::createUnaryInstruction(const std::string &command) {
  std::string pop_from_the_stack = CodeWriter::popDValueFromStack();
  std::string instruction;
  if (command == "neg") {
    instruction = "D=-D\n";
  } else if (command == "not") {
    instruction = "D=!D\n";
  }
  std::string push_to_the_stack = CodeWriter::pushDValueToStack();
  return pop_from_the_stack + instruction + push_to_the_stack;
}

std::string CodeWriter::check(const std::string &word) {
  std::string instruction;
  std::string string_label_index_ = std::to_string(label_index_);
  instruction += "@y\n";
  instruction += "D=D-M\n";
  instruction += "@";
  instruction += word;
  instruction += string_label_index_ + "\n";
  if (word == "EQUAL") {
    instruction += "D;JEQ\n";
  } else if (word == "LESS") {
    instruction += "D;JLT\n";
  } else if (word == "GREATER") {
    instruction += "D;JGT\n";
  }

  instruction += "@NOT";
  instruction += word;
  instruction += string_label_index_ + "\n";
  instruction += "0;JMP\n";
  instruction += "(";
  instruction += word;
  instruction += string_label_index_ + ")\n";
  instruction += "D=-1\n";
  instruction += "@CONTINUE";
  instruction += string_label_index_ + "\n";
  instruction += "0;JMP\n";
  instruction += "(NOT";
  instruction += word;
  instruction += string_label_index_ + ")\n";
  instruction += "D=0\n";
  instruction += "@CONTINUE";
  instruction += string_label_index_ + "\n";
  instruction += "0;JMP\n";
  instruction += "(CONTINUE";
  instruction += string_label_index_ + ")\n";
  return instruction;
}

std::string CodeWriter::createBinaryInstruction(const std::string &command) {
  std::string pop_from_the_stack =
      CodeWriter::popDValueFromStack(); // D from stack

  std::string create_y_variable = pop_from_the_stack + "@y\n" + "M=D\n"; // y =
                                                                         // D

  std::string pop_from_the_stack2 =
      create_y_variable + CodeWriter::popDValueFromStack(); // D from stack

  std::string instruction = pop_from_the_stack2;
  if (command == "add") {
    instruction += "@y\n";
    instruction += "D=D+M\n";
  } else if (command == "sub") {
    instruction += "@y\n";
    instruction += "D=D-M\n";
  } else if (command == "and") {
    instruction += "@y\n";
    instruction += "D=D&M\n";
  } else if (command == "or") {
    instruction += "@y\n";
    instruction += "D=D|M\n";
  } else if (command == "gt") {
    instruction += CodeWriter::check("GREATER");
    label_index_++;
  } else if (command == "lt") {
    instruction += CodeWriter::check("LESS");
    label_index_++;
  } else if (command == "eq") {
    instruction += CodeWriter::check("EQUAL");
    label_index_++;
  }

  return instruction + CodeWriter::pushDValueToStack(); // D to the stack
}

void CodeWriter::writeArithmeticComment(const std::string &command) {
  std::string arithmetic_command = "// " + command + "\n";
  asm_file_ << arithmetic_command;
}

void CodeWriter::writeArithmetic(const std::string &command) {
  writeArithmeticComment(command);
  std::string instruction;
  if (command == "neg" || command == "not") {
    instruction = CodeWriter::createUnaryInstruction(command);
  } else {
    instruction = CodeWriter::createBinaryInstruction(command);
  }
  asm_file_ << instruction;
}

std::string CodeWriter::incrementPointer() {
  std::string SP_to_A =
      "@SP\n";                // A = SP; M = RAM[SP] = last_stack_value_address
  return SP_to_A + "M=M+1\n"; // last_stack_value_address++
}

std::string CodeWriter::decrementPointer() {
  std::string SP_to_A =
      "@SP\n";                // A = SP; M = RAM[SP] = last_stack_value_address
  return SP_to_A + "M=M-1\n"; // last_stack_value_address--
}

//*SP = D
std::string CodeWriter::putDValuetoStack() {
  std::string put_SP_to_A = "@SP\n";
  return put_SP_to_A + "A=M\n" + "M=D\n";
  // 1) A = SP; M = RAM[SP] = last_stack_value_address;
  // 2) A = last_stack_value_address; M = RAM[last_stack_value_address] =
  // last_stack_value; 3) last_stack_value = D
}

// D = *SP
std::string CodeWriter::takeDValuefromStack() {
  std::string put_SP_to_A = "@SP\n";
  return put_SP_to_A + "A=M\n" + "D=M\n";
  // 1) A = SP; M = RAM[SP] = last_stack_value_address;
  // 2) A = last_stack_value_address; M = RAM[last_stack_value_address] =
  // last_stack_value; 3) D = last_stack_value_address
}

// push D to the stack
//*SP = D; SP++
std::string CodeWriter::pushDValueToStack() {
  //*SP = D
  std::string put_to_the_stack = CodeWriter::putDValuetoStack();

  return put_to_the_stack + CodeWriter::incrementPointer();
}

// pop to D from the stack
// SP--; D = *SP
std::string CodeWriter::popDValueFromStack() {
  // SP--
  std::string decrement_pointer = CodeWriter::decrementPointer();

  return decrement_pointer + CodeWriter::takeDValuefromStack();
}

std::string CodeWriter::pushConstant(int value) {
  std::string str_value =
      std::to_string(value); // string interpretation of constant to push
  std::string A_instruction = "@" + str_value + "\n"; // A = constant
  std::string value_in_D = A_instruction + "D=A\n";   // D = constant

  // push D to the stack
  return value_in_D + CodeWriter::pushDValueToStack();
}

// address = i + segment_start_address
std::string CodeWriter::save_sum_in_address(const std::string &segment_symbol,
                                            const std::string &index_string) {
  std::string put_i_to_D = "@" + index_string + "\n" + "D=A\n"; // D = i
  std::string put_i_to_address =
      put_i_to_D + "@address\n" + "M=D\n"; // RAM[address] = D = i
  std::string put_segment_to_D =
      put_i_to_address + "@" + segment_symbol + "\n" +
      "D=M\n"; // D = RAM[segment_symbol] = segment_start_address
  std::string sum_segment_and_i =
      put_segment_to_D + "@address\n" +
      "M=M+D\n"; // RAM[address] = i + segment_start_address
  return sum_segment_and_i;
}

std::string CodeWriter::pushSegment(const std::string &segment, int index) {
  std::unordered_map<std::string, std::string> segment_table = {
      {"local", "LCL"},
      {"argument", "ARG"},
      {"this", "THIS"},
      {"that", "THAT"}};
  std::string segment_symbol =
      segment_table[segment]; // LCL || ARG || THIS || THAT
  std::string index_string = std::to_string(
      index); // string interpretation of index of segment memory to push

  // address = i + segment_start_address
  std::string sum_segment_and_i =
      CodeWriter::save_sum_in_address(segment_symbol, index_string);

  // D = *( i + segment_start_address)
  std::string put_asterik_address_to_D =
      sum_segment_and_i + "@address\n" + "A=M\n" +
      "D=M\n"; // 1) A = address; M = RAM[address] = i + segment_start_address;
               // 2) A = RAM[address] = i + segment_start_address;  M = RAM[i +
               // segment_start_address] = *( i + segment_start_address);
               // D = *( i + segment_start_address)

  // push D to the stack
  return put_asterik_address_to_D + CodeWriter::pushDValueToStack();
}

std::string CodeWriter::popSegment(const std::string &segment, int index) {
  std::unordered_map<std::string, std::string> segment_table = {
      {"local", "LCL"},
      {"argument", "ARG"},
      {"this", "THIS"},
      {"that", "THAT"}};
  std::string segment_symbol =
      segment_table[segment]; // LCL || ARG || THIS || THAT
  std::string index_string = std::to_string(
      index); // string interpretation of index of segment memory to push

  // address = i + segment_start_address
  std::string sum_segment_and_i =
      CodeWriter::save_sum_in_address(segment_symbol, index_string);

  // SP--; D = *SP;
  std::string pop_from_the_stack =
      sum_segment_and_i + CodeWriter::popDValueFromStack();

  //*address = D
  return pop_from_the_stack + "@address\n" + "A=M\n" + "M=D\n";
}

std::string CodeWriter::pushStatic(int index) {
  std::string string_index = std::to_string(index);
  std::string take_global_variable = "@" + name_ + "." + string_index + "\n";
  std::string put_global_to_D = take_global_variable + "D=M\n";

  // push D to the stack
  return put_global_to_D + CodeWriter::pushDValueToStack();
}

std::string CodeWriter::popStatic(int index) {
  // SP--; D = *SP
  std::string pop_from_the_stack = CodeWriter::popDValueFromStack();
  std::string string_index = std::to_string(index);
  std::string take_global_variable = "@" + name_ + "." + string_index + "\n";
  return pop_from_the_stack + take_global_variable + "M=D\n";
}

std::string CodeWriter::pushTempPointer(int shift, int index) {
  int address_value = shift + index;
  std::string string_address_value =
      std::to_string(address_value); // index + shift = index + 5 (3)
  std::string put_address_value_to_A =
      "@R" + string_address_value + "\n"; // A = index + shift = index + 5 (3)
  std::string put_value_to_D =
      put_address_value_to_A +
      "D=M\n"; // D = RAM[index + shift] = RAM[index + 5 (3)]

  // push D to the stack
  return put_value_to_D + CodeWriter::pushDValueToStack();
}

std::string CodeWriter::popTempPointer(int shift, int index) {
  // SP--; D = *SP
  std::string pop_from_the_stack = CodeWriter::popDValueFromStack();

  int address_value = shift + index;
  std::string string_address_value =
      std::to_string(address_value); // index + shift = index + 5 (3)
  std::string put_address_value_to_A =
      "@R" + string_address_value + "\n"; // A = index + shift = index + 5 (3)

  return pop_from_the_stack + put_address_value_to_A + "M=D\n";
}

std::string CodeWriter::writePush(const std::string &segment, int index) {
  if (segment == "constant") {
    return CodeWriter::pushConstant(index);
  } else if (segment == "local" || segment == "argument" || segment == "this" ||
             segment == "that") {
    return CodeWriter::pushSegment(segment, index);
  } else if (segment == "static") {
    return CodeWriter::pushStatic(index);
  } else if (segment == "temp") {
    return CodeWriter::pushTempPointer(5, index);
  } else {
    return CodeWriter::pushTempPointer(3, index);
  }
}

std::string CodeWriter::writePop(const std::string &segment, int index) {
  assert(segment != "constant");
  if (segment == "local" || segment == "argument" || segment == "this" ||
      segment == "that") {
    return CodeWriter::popSegment(segment, index);
  } else if (segment == "static") {
    return CodeWriter::popStatic(index);
  } else if (segment == "temp") {
    return CodeWriter::popTempPointer(5, index);
  } else {
    return CodeWriter::popTempPointer(3, index);
  }
}

void CodeWriter::writePushPopComment(Command command,
                                     const std::string &segment, int index) {
  std::string comment_command;
  if (command == Command::C_PUSH) {
    comment_command = " push";
  } else {
    comment_command = " pop";
  }
  std::string comment = "//" + comment_command + " " + segment + " " +
                        std::to_string(index) + "\n";
  asm_file_ << comment;
}

void CodeWriter::WritePushPop(Command command, const std::string &segment,
                              int index) {

  writePushPopComment(command, segment, index);
  std::string instruction;
  if (command == Command::C_PUSH) {
    instruction = writePush(segment, index);
  } else {
    instruction = writePop(segment, index);
  }
  asm_file_ << instruction;
}
