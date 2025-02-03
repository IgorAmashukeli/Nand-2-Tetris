#include "VmTranslator.hpp"
#include "CodeWriter.hpp"
#include "Parser.hpp"
#include <cassert>
#include <filesystem>
#include <fstream>
#include <iostream>
namespace fs = std::filesystem;

std::string getFileName(const std::string &pathString) {
  size_t dot = pathString.find_last_of('.');
  size_t slash = pathString.find_last_of('/');
  std::string fileName = pathString.substr(slash + 1, dot - slash - 1);
  return fileName;
}

void VmTranslator::translate(const std::string &pathString) {
  const fs::path path(pathString);
  std::error_code ec;
  std::ofstream out_file;
  if (fs::is_directory(path, ec)) {
    std::string name = pathString;
    std::string directory_name = name.substr(name.find_last_of('/') + 1);
    out_file.open(name + "/" + directory_name + ".asm");
    out_file << code_writer_.writeInit();
    for (const auto &entry : fs::directory_iterator(path)) {
      std::string cur_path = entry.path();
      if (cur_path.substr(cur_path.size() - 2) == "vm") {
        code_writer_.setFileName(getFileName(cur_path));
        parser_.openFile(cur_path);
        process(pathString, out_file);
      }
    }

  } else if (fs::is_regular_file(path, ec)) {
    assert(pathString.substr(pathString.size() - 2) == "vm");
    parser_.openFile(pathString);
    std::string name = pathString.substr(0, pathString.size() - 3);
    code_writer_.setFileName(getFileName(pathString));
    out_file.open(name + ".asm");
    // out_file << code_writer_.writeInit();
    process(pathString, out_file);
  }
}

void VmTranslator::process(const std::string &pathString,
                           std::ofstream &out_file) {

  while (parser_.advance()) {
    Command command_type = parser_.commandType();
    if (command_type == Command::C_NOT_COMMAND) {
      continue;
    }

    if (command_type == Command::C_ARITHMETIC) {
      std::string command = parser_.arg1();
      out_file << code_writer_.writeArithmetic(command);
    } else if (command_type == Command::C_PUSH ||
               command_type == Command::C_POP) {
      std::string argument1 = parser_.arg1();
      int argument2 = parser_.arg2();
      out_file << code_writer_.WritePushPop(command_type, argument1, argument2);
    } else if (command_type == Command::C_LABEL) {
      out_file << code_writer_.writeLabel(parser_.arg1());
    } else if (command_type == Command::C_GOTO) {
      out_file << code_writer_.writeGoto(parser_.arg1());
    } else if (command_type == Command::C_IF) {
      out_file << code_writer_.writeIf(parser_.arg1());
    } else if (command_type == Command::C_CALL) {
      std::string arg1 = parser_.arg1();
      out_file << code_writer_.writeCall(arg1, parser_.arg2());
    } else if (command_type == Command::C_FUNCTION) {
      std::string arg1 = parser_.arg1();
      out_file << code_writer_.writeFunction(arg1, parser_.arg2());
    } else if (command_type == Command::C_RETURN) {
      out_file << code_writer_.writeReturn();
    }
  }
}