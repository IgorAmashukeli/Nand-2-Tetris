#include "CodeWriter.hpp"
#include "Parser.hpp"
#include <iostream>
#include <string>

CodeWriter::CodeWriter(const std::string &path) {
  std::string name = path.substr(0, path.size() - 3);
  setFileName(name);
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
    used_labels_.insert("GREATER" + std::to_string(label_index_));
    label_index_++;
  } else if (command == "lt") {
    instruction += CodeWriter::check("LESS");
    used_labels_.insert("LESS" + std::to_string(label_index_));
    label_index_++;
  } else if (command == "eq") {
    instruction += CodeWriter::check("EQUAL");
    used_labels_.insert("EQUAL" + std::to_string(label_index_));
    label_index_++;
  }

  return instruction + CodeWriter::pushDValueToStack(); // D to the stack
}

std::string CodeWriter::writeArithmeticComment(const std::string &command) {
  std::string arithmetic_command = "// " + command + "\n";
  return arithmetic_command;
}

std::string CodeWriter::writeArithmetic(const std::string &command) {

  std::string instruction;
  if (command == "neg" || command == "not") {
    instruction = CodeWriter::createUnaryInstruction(command);
  } else {
    instruction = CodeWriter::createBinaryInstruction(command);
  }
  return writeArithmeticComment(command) + instruction;
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

std::string CodeWriter::writePushPopComment(Command command,
                                            const std::string &segment,
                                            int index) {
  std::string comment_command;
  if (command == Command::C_PUSH) {
    comment_command = " push";
  } else {
    comment_command = " pop";
  }
  std::string comment = "//" + comment_command + " " + segment + " " +
                        std::to_string(index) + "\n";
  return comment;
}

std::string CodeWriter::WritePushPop(Command command,
                                     const std::string &segment, int index) {
  std::string instruction;
  if (command == Command::C_PUSH) {
    instruction = writePush(segment, index);
  } else {
    instruction = writePop(segment, index);
  }
  return writePushPopComment(command, segment, index) + instruction;
}

std::string CodeWriter::writeLabel(const std::string &label) {
  std::string comment_command = "// label command\n";
  return comment_command + "(" + cur_function_name_ + "$" + label + ")\n";
}

std::string CodeWriter::writeGoto(const std::string &label) {
  std::string comment_command = "// goto command\n";
  std::string instruction = "@" + cur_function_name_ + "$" + label + "\n";
  instruction += "0; JMP\n";
  return comment_command + instruction;
}

std::string CodeWriter::writeIf(const std::string &label) {
  std::string comment_command = "// if-goto command\n";
  std::string instruction = popDValueFromStack();
  instruction += "@" + cur_function_name_ + "$" + label + "\n";
  instruction += "D; JNE\n";
  return comment_command + instruction;
}

std::string CodeWriter::putLabelInD(const std::string &label) {
  return "@" + label + "\n" + "D=A\n";
}

std::string
CodeWriter::pushReturnAddressOnTheStack(const std::string &return_address) {

  cur_return_ints_[cur_function_name_]++;
  std::string comment_command = "//push return address\n";
  std::string put_label_in_D = putLabelInD(return_address);
  std::string push_to_the_stack = pushDValueToStack();
  return comment_command + put_label_in_D + push_to_the_stack;
}

std::string CodeWriter::saveCurSegmentsOnTheStack() {
  std::string comment_command = "// save cur segments\n// LCL\n";
  std::string instruction = "@LCL\nD=M\n";
  instruction += pushDValueToStack();
  instruction += "// ARG\n@ARG\nD=M\n";
  instruction += pushDValueToStack();
  instruction += "// THIS\n@THIS\nD=M\n";
  instruction += pushDValueToStack();
  instruction += "// THAT\n@THAT\nD=M\n";
  instruction += pushDValueToStack();
  return comment_command + instruction;
}

std::string CodeWriter::ARG_Pos(int arg_shift) {
  std::string put_arg_shift_in_D =
      "@" + std::to_string(arg_shift) + "\n" + "D=A\n";

  std::string get_arg_pos_in_D = "@SP\nD=M-D\n";
  return put_arg_shift_in_D + get_arg_pos_in_D;
}

std::string CodeWriter::shiftArg(int nArgs) {
  std::string comment_command = "//shift ARG\n";
  int arg_shift = nArgs + 5;
  std::string arg_position = ARG_Pos(arg_shift);
  std::string shift_ARG = "@ARG\nM=D\n";
  return comment_command + arg_position + shift_ARG;
}

std::string CodeWriter::shiftLCL() {
  std::string comment_command = "//shift LCL\n";
  std::string put_SP_to_D = "@SP\nD=M\n";
  std::string shift_LCL = "@LCL\nM=D\n";
  return comment_command + put_SP_to_D + shift_LCL;
}

std::string CodeWriter::writeCall(std::string &function_name, int nArgs) {
  std::string comment_command =
      "// call " + function_name + " " + std::to_string(nArgs) + "\n";

  std::string return_address =
      cur_function_name_ + "$" + "ret." +
      std::to_string(cur_return_ints_[cur_function_name_]);

  std::string push_return_address_to_the_stack =
      pushReturnAddressOnTheStack(return_address);
  std::string save_cur_segments_on_the_stack = saveCurSegmentsOnTheStack();
  std::string shift_ARG = shiftArg(nArgs);
  std::string shift_LCL = shiftLCL();
  std::string call_comment = "// call function\n";
  std::string goto_function = "@" + function_name + "\n" + "0;JMP\n";
  std::string continue_in_function_comment = "// continue after call\n";
  std::string ret_label = "(" + return_address + ")\n";
  return comment_command + push_return_address_to_the_stack +
         save_cur_segments_on_the_stack + shift_ARG + shift_LCL + call_comment +
         goto_function + continue_in_function_comment + ret_label;
}

std::string CodeWriter::pushZeroes(int nArgs) {
  std::string comment_command = "//push zeroes\n";
  std::string instruction =
      "@" + std::to_string(nArgs) + "\n" + "D=A\n" + "@nargs\n" + "M=D\n";
  instruction += "(PUSH" + std::to_string(label_index_) + ")\n";
  instruction += "@nargs\n";
  instruction += "D=M\n";
  instruction += "@NOTPUSH" + std::to_string(label_index_) + "\n";
  instruction += "D;JEQ\n";
  instruction += "D=0\n";
  instruction += pushDValueToStack();
  instruction += "@nargs\n";
  instruction += "M=M-1\n";
  instruction += "@PUSH" + std::to_string(label_index_) + "\n";
  instruction += "0; JMP\n";
  instruction += "(NOTPUSH" + std::to_string(label_index_) + ")\n";
  used_labels_.insert("PUSH" + std::to_string(label_index_));
  used_labels_.insert("NOTPUSH" + std::to_string(label_index_));
  label_index_++;
  return comment_command + instruction;
}

std::string CodeWriter::writeFunction(std::string &function_name, int nArgs) {
  cur_function_name_ = function_name;
  std::string comment_command =
      "// function " + function_name + " " + std::to_string(nArgs) + "\n";
  std::string create_label = "(" + function_name + ")\n";
  std::string push_zeroes = pushZeroes(nArgs);
  return comment_command + create_label + push_zeroes;
}

std::string CodeWriter::saveEndFrame() {
  std::string comment_command = "// save LCL in end frame variable endFrame\n";
  std::string instruction = "@LCL\nD=M\n@endFrame\nM=D\n";
  return comment_command + instruction;
}

std::string CodeWriter::saveRetAddress() {
  std::string comment_command =
      "// save return address in variable retAddress\n";
  std::string instruction =
      "@5\nD=A\n@endFrame\nD=M-D\nA=D\nD=M\n@retAddress\nM=D\n";
  return comment_command + instruction;
}

std::string CodeWriter::repositionReturnValue() {
  std::string comment_command = "// reposition return value for the caller\n";
  std::string instruction = popDValueFromStack() + "@ARG\nA=M\nM=D\n";
  return comment_command + instruction;
}

std::string CodeWriter::repositionSP() {
  std::string comment_command = "// reposition SP\n";
  std::string instruction = "@ARG\nD=M+1\n@SP\nM=D\n";
  return comment_command + instruction;
}

std::string recoverSegments() {
  std::string comment_command = "// recover segments\n";
  std::string instruction =
      "// recover THAT\n@endFrame\nD=M-1\nA=D\nD=M\n@THAT\nM=D\n";
  instruction +=
      "// recover THIS\n@2\nD=A\n@endFrame\nD=M-D\nA=D\nD=M\n@THIS\nM=D\n";
  instruction +=
      "// recover ARG\n@3\nD=A\n@endFrame\nD=M-D\nA=D\nD=M\n@ARG\nM=D\n";
  instruction +=
      "// recover LCL\n@4\nD=A\n@endFrame\nD=M-D\nA=D\nD=M\n@LCL\nM=D\n";
  return comment_command + instruction;
}

std::string CodeWriter::gotoReturnAddress() {
  std::string comment_command = "// actual return\n";
  std::string instruction = "@retAddress\nA=M\n0;JMP\n";
  return comment_command + instruction;
}

std::string CodeWriter::writeReturn() {
  std::string comment_command = "// return\n";
  std::string save_end_frame = saveEndFrame();
  std::string save_ret_adress = saveRetAddress();
  std::string reposition_return_value = repositionReturnValue();
  std::string reposition_SP = repositionSP();
  std::string recover_segments = recoverSegments();
  std::string goto_return_address = gotoReturnAddress();
  return comment_command + save_end_frame + save_ret_adress +
         reposition_return_value + reposition_SP + recover_segments +
         goto_return_address;
}

std::string CodeWriter::writeInit() {
  std::string comment_command = "// write Init\n";
  std::string instruction = "@256\nD=A\n@SP\nM=D\n";
  std::string init = "Sys.init";
  instruction += writeCall(init, 0);
  return comment_command + instruction;
}