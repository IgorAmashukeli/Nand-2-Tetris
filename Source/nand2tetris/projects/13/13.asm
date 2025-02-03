// write Init
@256
D=A
@SP
M=D
// call Sys.init 0
//push return address
@$ret.0
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@5
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Sys.init
0;JMP
// continue after call
($ret.0)
// function Array.new 0
(Array.new)
//push zeroes
@0
D=A
@nargs
M=D
(PUSH0)
@nargs
D=M
@NOTPUSH0
D;JEQ
D=0
@SP
A=M
M=D
@SP
M=M+1
@nargs
M=M-1
@PUSH0
0; JMP
(NOTPUSH0)
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// gt
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@GREATER1
D;JGT
@NOTGREATER1
0;JMP
(GREATER1)
D=-1
@CONTINUE1
0;JMP
(NOTGREATER1)
D=0
@CONTINUE1
0;JMP
(CONTINUE1)
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// if-goto command
@SP
M=M-1
@SP
A=M
D=M
@Array.new$IF1_0
D; JNE
// push constant 2
@2
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Sys.error 1
//push return address
@Array.new$ret.0
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@6
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Sys.error
0;JMP
// continue after call
(Array.new$ret.0)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// goto command
@Array.new$IF2_0
0; JMP
// label command
(Array.new$IF1_0)
// label command
(Array.new$IF2_0)
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Memory.alloc 1
//push return address
@Array.new$ret.1
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@6
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Memory.alloc
0;JMP
// continue after call
(Array.new$ret.1)
// return
// save LCL in end frame variable endFrame
@LCL
D=M
@endFrame
M=D
// save return address in variable retAddress
@5
D=A
@endFrame
D=M-D
A=D
D=M
@retAddress
M=D
// reposition return value for the caller
@SP
M=M-1
@SP
A=M
D=M
@ARG
A=M
M=D
// reposition SP
@ARG
D=M+1
@SP
M=D
// recover segments
// recover THAT
@endFrame
D=M-1
A=D
D=M
@THAT
M=D
// recover THIS
@2
D=A
@endFrame
D=M-D
A=D
D=M
@THIS
M=D
// recover ARG
@3
D=A
@endFrame
D=M-D
A=D
D=M
@ARG
M=D
// recover LCL
@4
D=A
@endFrame
D=M-D
A=D
D=M
@LCL
M=D
// actual return
@retAddress
A=M
0;JMP
// function Array.dispose 0
(Array.dispose)
//push zeroes
@0
D=A
@nargs
M=D
(PUSH2)
@nargs
D=M
@NOTPUSH2
D;JEQ
D=0
@SP
A=M
M=D
@SP
M=M+1
@nargs
M=M-1
@PUSH2
0; JMP
(NOTPUSH2)
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop pointer 0
@SP
M=M-1
@SP
A=M
D=M
@R3
M=D
// push pointer 0
@R3
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Memory.deAlloc 1
//push return address
@Array.dispose$ret.0
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@6
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Memory.deAlloc
0;JMP
// continue after call
(Array.dispose$ret.0)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// return
// save LCL in end frame variable endFrame
@LCL
D=M
@endFrame
M=D
// save return address in variable retAddress
@5
D=A
@endFrame
D=M-D
A=D
D=M
@retAddress
M=D
// reposition return value for the caller
@SP
M=M-1
@SP
A=M
D=M
@ARG
A=M
M=D
// reposition SP
@ARG
D=M+1
@SP
M=D
// recover segments
// recover THAT
@endFrame
D=M-1
A=D
D=M
@THAT
M=D
// recover THIS
@2
D=A
@endFrame
D=M-D
A=D
D=M
@THIS
M=D
// recover ARG
@3
D=A
@endFrame
D=M-D
A=D
D=M
@ARG
M=D
// recover LCL
@4
D=A
@endFrame
D=M-D
A=D
D=M
@LCL
M=D
// actual return
@retAddress
A=M
0;JMP
// function Keyboard.init 0
(Keyboard.init)
//push zeroes
@0
D=A
@nargs
M=D
(PUSH3)
@nargs
D=M
@NOTPUSH3
D;JEQ
D=0
@SP
A=M
M=D
@SP
M=M+1
@nargs
M=M-1
@PUSH3
0; JMP
(NOTPUSH3)
// push constant 24576
@24576
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop static 0
@SP
M=M-1
@SP
A=M
D=M
@Keyboard.0
M=D
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop static 1
@SP
M=M-1
@SP
A=M
D=M
@Keyboard.1
M=D
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop static 2
@SP
M=M-1
@SP
A=M
D=M
@Keyboard.2
M=D
// push constant 128
@128
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop static 4
@SP
M=M-1
@SP
A=M
D=M
@Keyboard.4
M=D
// push constant 129
@129
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop static 5
@SP
M=M-1
@SP
A=M
D=M
@Keyboard.5
M=D
// push constant 64
@64
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop static 3
@SP
M=M-1
@SP
A=M
D=M
@Keyboard.3
M=D
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// return
// save LCL in end frame variable endFrame
@LCL
D=M
@endFrame
M=D
// save return address in variable retAddress
@5
D=A
@endFrame
D=M-D
A=D
D=M
@retAddress
M=D
// reposition return value for the caller
@SP
M=M-1
@SP
A=M
D=M
@ARG
A=M
M=D
// reposition SP
@ARG
D=M+1
@SP
M=D
// recover segments
// recover THAT
@endFrame
D=M-1
A=D
D=M
@THAT
M=D
// recover THIS
@2
D=A
@endFrame
D=M-D
A=D
D=M
@THIS
M=D
// recover ARG
@3
D=A
@endFrame
D=M-D
A=D
D=M
@ARG
M=D
// recover LCL
@4
D=A
@endFrame
D=M-D
A=D
D=M
@LCL
M=D
// actual return
@retAddress
A=M
0;JMP
// function Keyboard.keyPressed 0
(Keyboard.keyPressed)
//push zeroes
@0
D=A
@nargs
M=D
(PUSH4)
@nargs
D=M
@NOTPUSH4
D;JEQ
D=0
@SP
A=M
M=D
@SP
M=M+1
@nargs
M=M-1
@PUSH4
0; JMP
(NOTPUSH4)
// push static 0
@Keyboard.0
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Memory.peek 1
//push return address
@Keyboard.keyPressed$ret.0
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@6
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Memory.peek
0;JMP
// continue after call
(Keyboard.keyPressed$ret.0)
// return
// save LCL in end frame variable endFrame
@LCL
D=M
@endFrame
M=D
// save return address in variable retAddress
@5
D=A
@endFrame
D=M-D
A=D
D=M
@retAddress
M=D
// reposition return value for the caller
@SP
M=M-1
@SP
A=M
D=M
@ARG
A=M
M=D
// reposition SP
@ARG
D=M+1
@SP
M=D
// recover segments
// recover THAT
@endFrame
D=M-1
A=D
D=M
@THAT
M=D
// recover THIS
@2
D=A
@endFrame
D=M-D
A=D
D=M
@THIS
M=D
// recover ARG
@3
D=A
@endFrame
D=M-D
A=D
D=M
@ARG
M=D
// recover LCL
@4
D=A
@endFrame
D=M-D
A=D
D=M
@LCL
M=D
// actual return
@retAddress
A=M
0;JMP
// function Keyboard.display 0
(Keyboard.display)
//push zeroes
@0
D=A
@nargs
M=D
(PUSH5)
@nargs
D=M
@NOTPUSH5
D;JEQ
D=0
@SP
A=M
M=D
@SP
M=M+1
@nargs
M=M-1
@PUSH5
0; JMP
(NOTPUSH5)
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Output.printChar 1
//push return address
@Keyboard.display$ret.0
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@6
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Output.printChar
0;JMP
// continue after call
(Keyboard.display$ret.0)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// call Output.backSpace 0
//push return address
@Keyboard.display$ret.1
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@5
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Output.backSpace
0;JMP
// continue after call
(Keyboard.display$ret.1)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// return
// save LCL in end frame variable endFrame
@LCL
D=M
@endFrame
M=D
// save return address in variable retAddress
@5
D=A
@endFrame
D=M-D
A=D
D=M
@retAddress
M=D
// reposition return value for the caller
@SP
M=M-1
@SP
A=M
D=M
@ARG
A=M
M=D
// reposition SP
@ARG
D=M+1
@SP
M=D
// recover segments
// recover THAT
@endFrame
D=M-1
A=D
D=M
@THAT
M=D
// recover THIS
@2
D=A
@endFrame
D=M-D
A=D
D=M
@THIS
M=D
// recover ARG
@3
D=A
@endFrame
D=M-D
A=D
D=M
@ARG
M=D
// recover LCL
@4
D=A
@endFrame
D=M-D
A=D
D=M
@LCL
M=D
// actual return
@retAddress
A=M
0;JMP
// function Keyboard.readChar 1
(Keyboard.readChar)
//push zeroes
@1
D=A
@nargs
M=D
(PUSH6)
@nargs
D=M
@NOTPUSH6
D;JEQ
D=0
@SP
A=M
M=D
@SP
M=M+1
@nargs
M=M-1
@PUSH6
0; JMP
(NOTPUSH6)
// push static 1
@Keyboard.1
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Keyboard.display 1
//push return address
@Keyboard.readChar$ret.0
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@6
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Keyboard.display
0;JMP
// continue after call
(Keyboard.readChar$ret.0)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// label command
(Keyboard.readChar$WHILE1_0)
// call Keyboard.keyPressed 0
//push return address
@Keyboard.readChar$ret.1
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@5
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Keyboard.keyPressed
0;JMP
// continue after call
(Keyboard.readChar$ret.1)
// push static 2
@Keyboard.2
D=M
@SP
A=M
M=D
@SP
M=M+1
// eq
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@EQUAL7
D;JEQ
@NOTEQUAL7
0;JMP
(EQUAL7)
D=-1
@CONTINUE7
0;JMP
(NOTEQUAL7)
D=0
@CONTINUE7
0;JMP
(CONTINUE7)
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// if-goto command
@SP
M=M-1
@SP
A=M
D=M
@Keyboard.readChar$WHILE2_0
D; JNE
// goto command
@Keyboard.readChar$WHILE1_0
0; JMP
// label command
(Keyboard.readChar$WHILE2_0)
// call Keyboard.keyPressed 0
//push return address
@Keyboard.readChar$ret.2
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@5
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Keyboard.keyPressed
0;JMP
// continue after call
(Keyboard.readChar$ret.2)
// pop local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// label command
(Keyboard.readChar$WHILE1_2)
// call Keyboard.keyPressed 0
//push return address
@Keyboard.readChar$ret.3
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@5
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Keyboard.keyPressed
0;JMP
// continue after call
(Keyboard.readChar$ret.3)
// push static 2
@Keyboard.2
D=M
@SP
A=M
M=D
@SP
M=M+1
// eq
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@EQUAL8
D;JEQ
@NOTEQUAL8
0;JMP
(EQUAL8)
D=-1
@CONTINUE8
0;JMP
(NOTEQUAL8)
D=0
@CONTINUE8
0;JMP
(CONTINUE8)
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// if-goto command
@SP
M=M-1
@SP
A=M
D=M
@Keyboard.readChar$WHILE2_2
D; JNE
// goto command
@Keyboard.readChar$WHILE1_2
0; JMP
// label command
(Keyboard.readChar$WHILE2_2)
// push local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Output.printChar 1
//push return address
@Keyboard.readChar$ret.4
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@6
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Output.printChar
0;JMP
// continue after call
(Keyboard.readChar$ret.4)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// return
// save LCL in end frame variable endFrame
@LCL
D=M
@endFrame
M=D
// save return address in variable retAddress
@5
D=A
@endFrame
D=M-D
A=D
D=M
@retAddress
M=D
// reposition return value for the caller
@SP
M=M-1
@SP
A=M
D=M
@ARG
A=M
M=D
// reposition SP
@ARG
D=M+1
@SP
M=D
// recover segments
// recover THAT
@endFrame
D=M-1
A=D
D=M
@THAT
M=D
// recover THIS
@2
D=A
@endFrame
D=M-D
A=D
D=M
@THIS
M=D
// recover ARG
@3
D=A
@endFrame
D=M-D
A=D
D=M
@ARG
M=D
// recover LCL
@4
D=A
@endFrame
D=M-D
A=D
D=M
@LCL
M=D
// actual return
@retAddress
A=M
0;JMP
// function Keyboard.readLine 2
(Keyboard.readLine)
//push zeroes
@2
D=A
@nargs
M=D
(PUSH9)
@nargs
D=M
@NOTPUSH9
D;JEQ
D=0
@SP
A=M
M=D
@SP
M=M+1
@nargs
M=M-1
@PUSH9
0; JMP
(NOTPUSH9)
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Output.printString 1
//push return address
@Keyboard.readLine$ret.0
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@6
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Output.printString
0;JMP
// continue after call
(Keyboard.readLine$ret.0)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push static 3
@Keyboard.3
D=M
@SP
A=M
M=D
@SP
M=M+1
// call String.new 1
//push return address
@Keyboard.readLine$ret.1
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@6
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@String.new
0;JMP
// continue after call
(Keyboard.readLine$ret.1)
// pop local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// label command
(Keyboard.readLine$WHILE1_0)
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// neg
@SP
M=M-1
@SP
A=M
D=M
D=-D
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// if-goto command
@SP
M=M-1
@SP
A=M
D=M
@Keyboard.readLine$WHILE2_0
D; JNE
// call Keyboard.readChar 0
//push return address
@Keyboard.readLine$ret.2
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@5
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Keyboard.readChar
0;JMP
// continue after call
(Keyboard.readLine$ret.2)
// pop local 1
@1
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push local 1
@1
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push static 4
@Keyboard.4
D=M
@SP
A=M
M=D
@SP
M=M+1
// eq
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@EQUAL10
D;JEQ
@NOTEQUAL10
0;JMP
(EQUAL10)
D=-1
@CONTINUE10
0;JMP
(NOTEQUAL10)
D=0
@CONTINUE10
0;JMP
(CONTINUE10)
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// if-goto command
@SP
M=M-1
@SP
A=M
D=M
@Keyboard.readLine$IF1_1
D; JNE
// call Output.backSpace 0
//push return address
@Keyboard.readLine$ret.3
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@5
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Output.backSpace
0;JMP
// continue after call
(Keyboard.readLine$ret.3)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// call Output.println 0
//push return address
@Keyboard.readLine$ret.4
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@5
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Output.println
0;JMP
// continue after call
(Keyboard.readLine$ret.4)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// return
// save LCL in end frame variable endFrame
@LCL
D=M
@endFrame
M=D
// save return address in variable retAddress
@5
D=A
@endFrame
D=M-D
A=D
D=M
@retAddress
M=D
// reposition return value for the caller
@SP
M=M-1
@SP
A=M
D=M
@ARG
A=M
M=D
// reposition SP
@ARG
D=M+1
@SP
M=D
// recover segments
// recover THAT
@endFrame
D=M-1
A=D
D=M
@THAT
M=D
// recover THIS
@2
D=A
@endFrame
D=M-D
A=D
D=M
@THIS
M=D
// recover ARG
@3
D=A
@endFrame
D=M-D
A=D
D=M
@ARG
M=D
// recover LCL
@4
D=A
@endFrame
D=M-D
A=D
D=M
@LCL
M=D
// actual return
@retAddress
A=M
0;JMP
// goto command
@Keyboard.readLine$IF2_1
0; JMP
// label command
(Keyboard.readLine$IF1_1)
// push local 1
@1
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push static 5
@Keyboard.5
D=M
@SP
A=M
M=D
@SP
M=M+1
// eq
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@EQUAL11
D;JEQ
@NOTEQUAL11
0;JMP
(EQUAL11)
D=-1
@CONTINUE11
0;JMP
(NOTEQUAL11)
D=0
@CONTINUE11
0;JMP
(CONTINUE11)
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// if-goto command
@SP
M=M-1
@SP
A=M
D=M
@Keyboard.readLine$IF1_2
D; JNE
// call Output.backSpace 0
//push return address
@Keyboard.readLine$ret.5
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@5
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Output.backSpace
0;JMP
// continue after call
(Keyboard.readLine$ret.5)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// call String.eraseLastChar 1
//push return address
@Keyboard.readLine$ret.6
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@6
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@String.eraseLastChar
0;JMP
// continue after call
(Keyboard.readLine$ret.6)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// call Output.backSpace 0
//push return address
@Keyboard.readLine$ret.7
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@5
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Output.backSpace
0;JMP
// continue after call
(Keyboard.readLine$ret.7)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// goto command
@Keyboard.readLine$IF2_2
0; JMP
// label command
(Keyboard.readLine$IF1_2)
// push local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 1
@1
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// call String.appendChar 2
//push return address
@Keyboard.readLine$ret.8
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@7
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@String.appendChar
0;JMP
// continue after call
(Keyboard.readLine$ret.8)
// pop local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// label command
(Keyboard.readLine$IF2_2)
// label command
(Keyboard.readLine$IF2_1)
// goto command
@Keyboard.readLine$WHILE1_0
0; JMP
// label command
(Keyboard.readLine$WHILE2_0)
// push local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// return
// save LCL in end frame variable endFrame
@LCL
D=M
@endFrame
M=D
// save return address in variable retAddress
@5
D=A
@endFrame
D=M-D
A=D
D=M
@retAddress
M=D
// reposition return value for the caller
@SP
M=M-1
@SP
A=M
D=M
@ARG
A=M
M=D
// reposition SP
@ARG
D=M+1
@SP
M=D
// recover segments
// recover THAT
@endFrame
D=M-1
A=D
D=M
@THAT
M=D
// recover THIS
@2
D=A
@endFrame
D=M-D
A=D
D=M
@THIS
M=D
// recover ARG
@3
D=A
@endFrame
D=M-D
A=D
D=M
@ARG
M=D
// recover LCL
@4
D=A
@endFrame
D=M-D
A=D
D=M
@LCL
M=D
// actual return
@retAddress
A=M
0;JMP
// function Keyboard.readInt 2
(Keyboard.readInt)
//push zeroes
@2
D=A
@nargs
M=D
(PUSH12)
@nargs
D=M
@NOTPUSH12
D;JEQ
D=0
@SP
A=M
M=D
@SP
M=M+1
@nargs
M=M-1
@PUSH12
0; JMP
(NOTPUSH12)
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Keyboard.readLine 1
//push return address
@Keyboard.readInt$ret.0
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@6
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Keyboard.readLine
0;JMP
// continue after call
(Keyboard.readInt$ret.0)
// pop local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// call String.intValue 1
//push return address
@Keyboard.readInt$ret.1
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@6
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@String.intValue
0;JMP
// continue after call
(Keyboard.readInt$ret.1)
// return
// save LCL in end frame variable endFrame
@LCL
D=M
@endFrame
M=D
// save return address in variable retAddress
@5
D=A
@endFrame
D=M-D
A=D
D=M
@retAddress
M=D
// reposition return value for the caller
@SP
M=M-1
@SP
A=M
D=M
@ARG
A=M
M=D
// reposition SP
@ARG
D=M+1
@SP
M=D
// recover segments
// recover THAT
@endFrame
D=M-1
A=D
D=M
@THAT
M=D
// recover THIS
@2
D=A
@endFrame
D=M-D
A=D
D=M
@THIS
M=D
// recover ARG
@3
D=A
@endFrame
D=M-D
A=D
D=M
@ARG
M=D
// recover LCL
@4
D=A
@endFrame
D=M-D
A=D
D=M
@LCL
M=D
// actual return
@retAddress
A=M
0;JMP
// function Math.init 0
(Math.init)
//push zeroes
@0
D=A
@nargs
M=D
(PUSH13)
@nargs
D=M
@NOTPUSH13
D;JEQ
D=0
@SP
A=M
M=D
@SP
M=M+1
@nargs
M=M-1
@PUSH13
0; JMP
(NOTPUSH13)
// push constant 16
@16
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Array.new 1
//push return address
@Math.init$ret.0
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@6
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Array.new
0;JMP
// continue after call
(Math.init$ret.0)
// pop static 0
@SP
M=M-1
@SP
A=M
D=M
@Math.0
M=D
// push static 0
@Math.0
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// pop pointer 1
@SP
M=M-1
@SP
A=M
D=M
@R4
M=D
// push temp 0
@R5
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop that 0
@0
D=A
@address
M=D
@THAT
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push static 0
@Math.0
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// push constant 2
@2
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// pop pointer 1
@SP
M=M-1
@SP
A=M
D=M
@R4
M=D
// push temp 0
@R5
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop that 0
@0
D=A
@address
M=D
@THAT
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push static 0
@Math.0
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 2
@2
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// push constant 4
@4
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// pop pointer 1
@SP
M=M-1
@SP
A=M
D=M
@R4
M=D
// push temp 0
@R5
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop that 0
@0
D=A
@address
M=D
@THAT
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push static 0
@Math.0
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 3
@3
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// push constant 8
@8
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// pop pointer 1
@SP
M=M-1
@SP
A=M
D=M
@R4
M=D
// push temp 0
@R5
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop that 0
@0
D=A
@address
M=D
@THAT
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push static 0
@Math.0
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 4
@4
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// push constant 16
@16
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// pop pointer 1
@SP
M=M-1
@SP
A=M
D=M
@R4
M=D
// push temp 0
@R5
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop that 0
@0
D=A
@address
M=D
@THAT
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push static 0
@Math.0
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 5
@5
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// push constant 32
@32
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// pop pointer 1
@SP
M=M-1
@SP
A=M
D=M
@R4
M=D
// push temp 0
@R5
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop that 0
@0
D=A
@address
M=D
@THAT
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push static 0
@Math.0
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 6
@6
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// push constant 64
@64
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// pop pointer 1
@SP
M=M-1
@SP
A=M
D=M
@R4
M=D
// push temp 0
@R5
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop that 0
@0
D=A
@address
M=D
@THAT
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push static 0
@Math.0
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 7
@7
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// push constant 128
@128
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// pop pointer 1
@SP
M=M-1
@SP
A=M
D=M
@R4
M=D
// push temp 0
@R5
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop that 0
@0
D=A
@address
M=D
@THAT
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push static 0
@Math.0
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 8
@8
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// push constant 256
@256
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// pop pointer 1
@SP
M=M-1
@SP
A=M
D=M
@R4
M=D
// push temp 0
@R5
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop that 0
@0
D=A
@address
M=D
@THAT
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push static 0
@Math.0
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 9
@9
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// push constant 512
@512
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// pop pointer 1
@SP
M=M-1
@SP
A=M
D=M
@R4
M=D
// push temp 0
@R5
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop that 0
@0
D=A
@address
M=D
@THAT
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push static 0
@Math.0
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 10
@10
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// push constant 1024
@1024
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// pop pointer 1
@SP
M=M-1
@SP
A=M
D=M
@R4
M=D
// push temp 0
@R5
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop that 0
@0
D=A
@address
M=D
@THAT
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push static 0
@Math.0
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 11
@11
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// push constant 2048
@2048
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// pop pointer 1
@SP
M=M-1
@SP
A=M
D=M
@R4
M=D
// push temp 0
@R5
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop that 0
@0
D=A
@address
M=D
@THAT
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push static 0
@Math.0
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// push constant 4096
@4096
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// pop pointer 1
@SP
M=M-1
@SP
A=M
D=M
@R4
M=D
// push temp 0
@R5
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop that 0
@0
D=A
@address
M=D
@THAT
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push static 0
@Math.0
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 13
@13
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// push constant 8192
@8192
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// pop pointer 1
@SP
M=M-1
@SP
A=M
D=M
@R4
M=D
// push temp 0
@R5
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop that 0
@0
D=A
@address
M=D
@THAT
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push static 0
@Math.0
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 14
@14
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// push constant 16384
@16384
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// pop pointer 1
@SP
M=M-1
@SP
A=M
D=M
@R4
M=D
// push temp 0
@R5
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop that 0
@0
D=A
@address
M=D
@THAT
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push static 0
@Math.0
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 15
@15
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// push constant 32767
@32767
D=A
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// pop pointer 1
@SP
M=M-1
@SP
A=M
D=M
@R4
M=D
// push temp 0
@R5
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop that 0
@0
D=A
@address
M=D
@THAT
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// return
// save LCL in end frame variable endFrame
@LCL
D=M
@endFrame
M=D
// save return address in variable retAddress
@5
D=A
@endFrame
D=M-D
A=D
D=M
@retAddress
M=D
// reposition return value for the caller
@SP
M=M-1
@SP
A=M
D=M
@ARG
A=M
M=D
// reposition SP
@ARG
D=M+1
@SP
M=D
// recover segments
// recover THAT
@endFrame
D=M-1
A=D
D=M
@THAT
M=D
// recover THIS
@2
D=A
@endFrame
D=M-D
A=D
D=M
@THIS
M=D
// recover ARG
@3
D=A
@endFrame
D=M-D
A=D
D=M
@ARG
M=D
// recover LCL
@4
D=A
@endFrame
D=M-D
A=D
D=M
@LCL
M=D
// actual return
@retAddress
A=M
0;JMP
// function Math.bitSet 0
(Math.bitSet)
//push zeroes
@0
D=A
@nargs
M=D
(PUSH14)
@nargs
D=M
@NOTPUSH14
D;JEQ
D=0
@SP
A=M
M=D
@SP
M=M+1
@nargs
M=M-1
@PUSH14
0; JMP
(NOTPUSH14)
// push static 0
@Math.0
D=M
@SP
A=M
M=D
@SP
M=M+1
// push argument 1
@1
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// pop pointer 1
@SP
M=M-1
@SP
A=M
D=M
@R4
M=D
// push that 0
@0
D=A
@address
M=D
@THAT
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// and
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D&M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// eq
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@EQUAL15
D;JEQ
@NOTEQUAL15
0;JMP
(EQUAL15)
D=-1
@CONTINUE15
0;JMP
(NOTEQUAL15)
D=0
@CONTINUE15
0;JMP
(CONTINUE15)
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// return
// save LCL in end frame variable endFrame
@LCL
D=M
@endFrame
M=D
// save return address in variable retAddress
@5
D=A
@endFrame
D=M-D
A=D
D=M
@retAddress
M=D
// reposition return value for the caller
@SP
M=M-1
@SP
A=M
D=M
@ARG
A=M
M=D
// reposition SP
@ARG
D=M+1
@SP
M=D
// recover segments
// recover THAT
@endFrame
D=M-1
A=D
D=M
@THAT
M=D
// recover THIS
@2
D=A
@endFrame
D=M-D
A=D
D=M
@THIS
M=D
// recover ARG
@3
D=A
@endFrame
D=M-D
A=D
D=M
@ARG
M=D
// recover LCL
@4
D=A
@endFrame
D=M-D
A=D
D=M
@LCL
M=D
// actual return
@retAddress
A=M
0;JMP
// function Math.abs 0
(Math.abs)
//push zeroes
@0
D=A
@nargs
M=D
(PUSH16)
@nargs
D=M
@NOTPUSH16
D;JEQ
D=0
@SP
A=M
M=D
@SP
M=M+1
@nargs
M=M-1
@PUSH16
0; JMP
(NOTPUSH16)
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// gt
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@GREATER17
D;JGT
@NOTGREATER17
0;JMP
(GREATER17)
D=-1
@CONTINUE17
0;JMP
(NOTGREATER17)
D=0
@CONTINUE17
0;JMP
(CONTINUE17)
@SP
A=M
M=D
@SP
M=M+1
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// eq
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@EQUAL18
D;JEQ
@NOTEQUAL18
0;JMP
(EQUAL18)
D=-1
@CONTINUE18
0;JMP
(NOTEQUAL18)
D=0
@CONTINUE18
0;JMP
(CONTINUE18)
@SP
A=M
M=D
@SP
M=M+1
// or
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D|M
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// if-goto command
@SP
M=M-1
@SP
A=M
D=M
@Math.abs$IF1_0
D; JNE
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// return
// save LCL in end frame variable endFrame
@LCL
D=M
@endFrame
M=D
// save return address in variable retAddress
@5
D=A
@endFrame
D=M-D
A=D
D=M
@retAddress
M=D
// reposition return value for the caller
@SP
M=M-1
@SP
A=M
D=M
@ARG
A=M
M=D
// reposition SP
@ARG
D=M+1
@SP
M=D
// recover segments
// recover THAT
@endFrame
D=M-1
A=D
D=M
@THAT
M=D
// recover THIS
@2
D=A
@endFrame
D=M-D
A=D
D=M
@THIS
M=D
// recover ARG
@3
D=A
@endFrame
D=M-D
A=D
D=M
@ARG
M=D
// recover LCL
@4
D=A
@endFrame
D=M-D
A=D
D=M
@LCL
M=D
// actual return
@retAddress
A=M
0;JMP
// goto command
@Math.abs$IF2_0
0; JMP
// label command
(Math.abs$IF1_0)
// label command
(Math.abs$IF2_0)
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// neg
@SP
M=M-1
@SP
A=M
D=M
D=-D
@SP
A=M
M=D
@SP
M=M+1
// return
// save LCL in end frame variable endFrame
@LCL
D=M
@endFrame
M=D
// save return address in variable retAddress
@5
D=A
@endFrame
D=M-D
A=D
D=M
@retAddress
M=D
// reposition return value for the caller
@SP
M=M-1
@SP
A=M
D=M
@ARG
A=M
M=D
// reposition SP
@ARG
D=M+1
@SP
M=D
// recover segments
// recover THAT
@endFrame
D=M-1
A=D
D=M
@THAT
M=D
// recover THIS
@2
D=A
@endFrame
D=M-D
A=D
D=M
@THIS
M=D
// recover ARG
@3
D=A
@endFrame
D=M-D
A=D
D=M
@ARG
M=D
// recover LCL
@4
D=A
@endFrame
D=M-D
A=D
D=M
@LCL
M=D
// actual return
@retAddress
A=M
0;JMP
// function Math.multiply 3
(Math.multiply)
//push zeroes
@3
D=A
@nargs
M=D
(PUSH19)
@nargs
D=M
@NOTPUSH19
D;JEQ
D=0
@SP
A=M
M=D
@SP
M=M+1
@nargs
M=M-1
@PUSH19
0; JMP
(NOTPUSH19)
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop local 1
@1
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop local 2
@2
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// label command
(Math.multiply$WHILE1_0)
// push local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 16
@16
D=A
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@LESS20
D;JLT
@NOTLESS20
0;JMP
(LESS20)
D=-1
@CONTINUE20
0;JMP
(NOTLESS20)
D=0
@CONTINUE20
0;JMP
(CONTINUE20)
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// if-goto command
@SP
M=M-1
@SP
A=M
D=M
@Math.multiply$WHILE2_0
D; JNE
// push argument 1
@1
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Math.bitSet 2
//push return address
@Math.multiply$ret.0
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@7
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Math.bitSet
0;JMP
// continue after call
(Math.multiply$ret.0)
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// if-goto command
@SP
M=M-1
@SP
A=M
D=M
@Math.multiply$IF1_1
D; JNE
// push local 1
@1
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 2
@2
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// pop local 1
@1
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// goto command
@Math.multiply$IF2_1
0; JMP
// label command
(Math.multiply$IF1_1)
// label command
(Math.multiply$IF2_1)
// push local 2
@2
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 2
@2
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// pop local 2
@2
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// pop local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// goto command
@Math.multiply$WHILE1_0
0; JMP
// label command
(Math.multiply$WHILE2_0)
// push local 1
@1
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// return
// save LCL in end frame variable endFrame
@LCL
D=M
@endFrame
M=D
// save return address in variable retAddress
@5
D=A
@endFrame
D=M-D
A=D
D=M
@retAddress
M=D
// reposition return value for the caller
@SP
M=M-1
@SP
A=M
D=M
@ARG
A=M
M=D
// reposition SP
@ARG
D=M+1
@SP
M=D
// recover segments
// recover THAT
@endFrame
D=M-1
A=D
D=M
@THAT
M=D
// recover THIS
@2
D=A
@endFrame
D=M-D
A=D
D=M
@THIS
M=D
// recover ARG
@3
D=A
@endFrame
D=M-D
A=D
D=M
@ARG
M=D
// recover LCL
@4
D=A
@endFrame
D=M-D
A=D
D=M
@LCL
M=D
// actual return
@retAddress
A=M
0;JMP
// function Math.abs_divide 1
(Math.abs_divide)
//push zeroes
@1
D=A
@nargs
M=D
(PUSH21)
@nargs
D=M
@NOTPUSH21
D;JEQ
D=0
@SP
A=M
M=D
@SP
M=M+1
@nargs
M=M-1
@PUSH21
0; JMP
(NOTPUSH21)
// push argument 1
@1
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// gt
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@GREATER22
D;JGT
@NOTGREATER22
0;JMP
(GREATER22)
D=-1
@CONTINUE22
0;JMP
(NOTGREATER22)
D=0
@CONTINUE22
0;JMP
(CONTINUE22)
@SP
A=M
M=D
@SP
M=M+1
// push argument 1
@1
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@LESS23
D;JLT
@NOTLESS23
0;JMP
(LESS23)
D=-1
@CONTINUE23
0;JMP
(NOTLESS23)
D=0
@CONTINUE23
0;JMP
(CONTINUE23)
@SP
A=M
M=D
@SP
M=M+1
// or
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D|M
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// if-goto command
@SP
M=M-1
@SP
A=M
D=M
@Math.abs_divide$IF1_0
D; JNE
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// return
// save LCL in end frame variable endFrame
@LCL
D=M
@endFrame
M=D
// save return address in variable retAddress
@5
D=A
@endFrame
D=M-D
A=D
D=M
@retAddress
M=D
// reposition return value for the caller
@SP
M=M-1
@SP
A=M
D=M
@ARG
A=M
M=D
// reposition SP
@ARG
D=M+1
@SP
M=D
// recover segments
// recover THAT
@endFrame
D=M-1
A=D
D=M
@THAT
M=D
// recover THIS
@2
D=A
@endFrame
D=M-D
A=D
D=M
@THIS
M=D
// recover ARG
@3
D=A
@endFrame
D=M-D
A=D
D=M
@ARG
M=D
// recover LCL
@4
D=A
@endFrame
D=M-D
A=D
D=M
@LCL
M=D
// actual return
@retAddress
A=M
0;JMP
// goto command
@Math.abs_divide$IF2_0
0; JMP
// label command
(Math.abs_divide$IF1_0)
// label command
(Math.abs_divide$IF2_0)
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 2
@2
D=A
@SP
A=M
M=D
@SP
M=M+1
// push argument 1
@1
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Math.multiply 2
//push return address
@Math.abs_divide$ret.0
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@7
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Math.multiply
0;JMP
// continue after call
(Math.abs_divide$ret.0)
// call Math.abs_divide 2
//push return address
@Math.abs_divide$ret.1
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@7
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Math.abs_divide
0;JMP
// continue after call
(Math.abs_divide$ret.1)
// pop local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 2
@2
D=A
@SP
A=M
M=D
@SP
M=M+1
// push local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Math.multiply 2
//push return address
@Math.abs_divide$ret.2
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@7
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Math.multiply
0;JMP
// continue after call
(Math.abs_divide$ret.2)
// push argument 1
@1
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Math.multiply 2
//push return address
@Math.abs_divide$ret.3
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@7
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Math.multiply
0;JMP
// continue after call
(Math.abs_divide$ret.3)
// sub
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@SP
A=M
M=D
@SP
M=M+1
// push argument 1
@1
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@LESS24
D;JLT
@NOTLESS24
0;JMP
(LESS24)
D=-1
@CONTINUE24
0;JMP
(NOTLESS24)
D=0
@CONTINUE24
0;JMP
(CONTINUE24)
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// if-goto command
@SP
M=M-1
@SP
A=M
D=M
@Math.abs_divide$IF1_1
D; JNE
// push constant 2
@2
D=A
@SP
A=M
M=D
@SP
M=M+1
// push local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Math.multiply 2
//push return address
@Math.abs_divide$ret.4
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@7
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Math.multiply
0;JMP
// continue after call
(Math.abs_divide$ret.4)
// return
// save LCL in end frame variable endFrame
@LCL
D=M
@endFrame
M=D
// save return address in variable retAddress
@5
D=A
@endFrame
D=M-D
A=D
D=M
@retAddress
M=D
// reposition return value for the caller
@SP
M=M-1
@SP
A=M
D=M
@ARG
A=M
M=D
// reposition SP
@ARG
D=M+1
@SP
M=D
// recover segments
// recover THAT
@endFrame
D=M-1
A=D
D=M
@THAT
M=D
// recover THIS
@2
D=A
@endFrame
D=M-D
A=D
D=M
@THIS
M=D
// recover ARG
@3
D=A
@endFrame
D=M-D
A=D
D=M
@ARG
M=D
// recover LCL
@4
D=A
@endFrame
D=M-D
A=D
D=M
@LCL
M=D
// actual return
@retAddress
A=M
0;JMP
// goto command
@Math.abs_divide$IF2_1
0; JMP
// label command
(Math.abs_divide$IF1_1)
// push constant 2
@2
D=A
@SP
A=M
M=D
@SP
M=M+1
// push local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Math.multiply 2
//push return address
@Math.abs_divide$ret.5
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@7
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Math.multiply
0;JMP
// continue after call
(Math.abs_divide$ret.5)
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// return
// save LCL in end frame variable endFrame
@LCL
D=M
@endFrame
M=D
// save return address in variable retAddress
@5
D=A
@endFrame
D=M-D
A=D
D=M
@retAddress
M=D
// reposition return value for the caller
@SP
M=M-1
@SP
A=M
D=M
@ARG
A=M
M=D
// reposition SP
@ARG
D=M+1
@SP
M=D
// recover segments
// recover THAT
@endFrame
D=M-1
A=D
D=M
@THAT
M=D
// recover THIS
@2
D=A
@endFrame
D=M-D
A=D
D=M
@THIS
M=D
// recover ARG
@3
D=A
@endFrame
D=M-D
A=D
D=M
@ARG
M=D
// recover LCL
@4
D=A
@endFrame
D=M-D
A=D
D=M
@LCL
M=D
// actual return
@retAddress
A=M
0;JMP
// label command
(Math.abs_divide$IF2_1)
// function Math.divide 3
(Math.divide)
//push zeroes
@3
D=A
@nargs
M=D
(PUSH25)
@nargs
D=M
@NOTPUSH25
D;JEQ
D=0
@SP
A=M
M=D
@SP
M=M+1
@nargs
M=M-1
@PUSH25
0; JMP
(NOTPUSH25)
// push argument 1
@1
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// eq
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@EQUAL26
D;JEQ
@NOTEQUAL26
0;JMP
(EQUAL26)
D=-1
@CONTINUE26
0;JMP
(NOTEQUAL26)
D=0
@CONTINUE26
0;JMP
(CONTINUE26)
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// if-goto command
@SP
M=M-1
@SP
A=M
D=M
@Math.divide$IF1_0
D; JNE
// push constant 3
@3
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Sys.error 1
//push return address
@Math.divide$ret.0
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@6
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Sys.error
0;JMP
// continue after call
(Math.divide$ret.0)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// goto command
@Math.divide$IF2_0
0; JMP
// label command
(Math.divide$IF1_0)
// label command
(Math.divide$IF2_0)
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Math.abs 1
//push return address
@Math.divide$ret.1
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@6
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Math.abs
0;JMP
// continue after call
(Math.divide$ret.1)
// pop local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push argument 1
@1
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Math.abs 1
//push return address
@Math.divide$ret.2
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@6
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Math.abs
0;JMP
// continue after call
(Math.divide$ret.2)
// pop local 1
@1
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 1
@1
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Math.abs_divide 2
//push return address
@Math.divide$ret.3
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@7
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Math.abs_divide
0;JMP
// continue after call
(Math.divide$ret.3)
// pop local 2
@2
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@LESS27
D;JLT
@NOTLESS27
0;JMP
(LESS27)
D=-1
@CONTINUE27
0;JMP
(NOTLESS27)
D=0
@CONTINUE27
0;JMP
(CONTINUE27)
@SP
A=M
M=D
@SP
M=M+1
// push argument 1
@1
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// gt
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@GREATER28
D;JGT
@NOTGREATER28
0;JMP
(GREATER28)
D=-1
@CONTINUE28
0;JMP
(NOTGREATER28)
D=0
@CONTINUE28
0;JMP
(CONTINUE28)
@SP
A=M
M=D
@SP
M=M+1
// and
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D&M
@SP
A=M
M=D
@SP
M=M+1
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// gt
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@GREATER29
D;JGT
@NOTGREATER29
0;JMP
(GREATER29)
D=-1
@CONTINUE29
0;JMP
(NOTGREATER29)
D=0
@CONTINUE29
0;JMP
(CONTINUE29)
@SP
A=M
M=D
@SP
M=M+1
// push argument 1
@1
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@LESS30
D;JLT
@NOTLESS30
0;JMP
(LESS30)
D=-1
@CONTINUE30
0;JMP
(NOTLESS30)
D=0
@CONTINUE30
0;JMP
(CONTINUE30)
@SP
A=M
M=D
@SP
M=M+1
// and
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D&M
@SP
A=M
M=D
@SP
M=M+1
// or
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D|M
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// if-goto command
@SP
M=M-1
@SP
A=M
D=M
@Math.divide$IF1_1
D; JNE
// push local 2
@2
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// neg
@SP
M=M-1
@SP
A=M
D=M
D=-D
@SP
A=M
M=D
@SP
M=M+1
// pop local 2
@2
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// goto command
@Math.divide$IF2_1
0; JMP
// label command
(Math.divide$IF1_1)
// label command
(Math.divide$IF2_1)
// push local 2
@2
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// return
// save LCL in end frame variable endFrame
@LCL
D=M
@endFrame
M=D
// save return address in variable retAddress
@5
D=A
@endFrame
D=M-D
A=D
D=M
@retAddress
M=D
// reposition return value for the caller
@SP
M=M-1
@SP
A=M
D=M
@ARG
A=M
M=D
// reposition SP
@ARG
D=M+1
@SP
M=D
// recover segments
// recover THAT
@endFrame
D=M-1
A=D
D=M
@THAT
M=D
// recover THIS
@2
D=A
@endFrame
D=M-D
A=D
D=M
@THIS
M=D
// recover ARG
@3
D=A
@endFrame
D=M-D
A=D
D=M
@ARG
M=D
// recover LCL
@4
D=A
@endFrame
D=M-D
A=D
D=M
@LCL
M=D
// actual return
@retAddress
A=M
0;JMP
// function Math.sqrt 3
(Math.sqrt)
//push zeroes
@3
D=A
@nargs
M=D
(PUSH31)
@nargs
D=M
@NOTPUSH31
D;JEQ
D=0
@SP
A=M
M=D
@SP
M=M+1
@nargs
M=M-1
@PUSH31
0; JMP
(NOTPUSH31)
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@LESS32
D;JLT
@NOTLESS32
0;JMP
(LESS32)
D=-1
@CONTINUE32
0;JMP
(NOTLESS32)
D=0
@CONTINUE32
0;JMP
(CONTINUE32)
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// if-goto command
@SP
M=M-1
@SP
A=M
D=M
@Math.sqrt$IF1_0
D; JNE
// push constant 4
@4
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Sys.error 1
//push return address
@Math.sqrt$ret.0
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@6
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Sys.error
0;JMP
// continue after call
(Math.sqrt$ret.0)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// goto command
@Math.sqrt$IF2_0
0; JMP
// label command
(Math.sqrt$IF1_0)
// label command
(Math.sqrt$IF2_0)
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push constant 7
@7
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop local 1
@1
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// label command
(Math.sqrt$WHILE1_1)
// push local 1
@1
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@LESS33
D;JLT
@NOTLESS33
0;JMP
(LESS33)
D=-1
@CONTINUE33
0;JMP
(NOTLESS33)
D=0
@CONTINUE33
0;JMP
(CONTINUE33)
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// if-goto command
@SP
M=M-1
@SP
A=M
D=M
@Math.sqrt$WHILE2_1
D; JNE
// push local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push static 0
@Math.0
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 1
@1
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// pop pointer 1
@SP
M=M-1
@SP
A=M
D=M
@R4
M=D
// push that 0
@0
D=A
@address
M=D
@THAT
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// push local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push static 0
@Math.0
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 1
@1
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// pop pointer 1
@SP
M=M-1
@SP
A=M
D=M
@R4
M=D
// push that 0
@0
D=A
@address
M=D
@THAT
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// call Math.multiply 2
//push return address
@Math.sqrt$ret.1
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@7
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Math.multiply
0;JMP
// continue after call
(Math.sqrt$ret.1)
// pop local 2
@2
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push local 2
@2
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// gt
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@GREATER34
D;JGT
@NOTGREATER34
0;JMP
(GREATER34)
D=-1
@CONTINUE34
0;JMP
(NOTGREATER34)
D=0
@CONTINUE34
0;JMP
(CONTINUE34)
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// push local 2
@2
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// gt
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@GREATER35
D;JGT
@NOTGREATER35
0;JMP
(GREATER35)
D=-1
@CONTINUE35
0;JMP
(NOTGREATER35)
D=0
@CONTINUE35
0;JMP
(CONTINUE35)
@SP
A=M
M=D
@SP
M=M+1
// and
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D&M
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// if-goto command
@SP
M=M-1
@SP
A=M
D=M
@Math.sqrt$IF1_2
D; JNE
// push local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push static 0
@Math.0
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 1
@1
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// pop pointer 1
@SP
M=M-1
@SP
A=M
D=M
@R4
M=D
// push that 0
@0
D=A
@address
M=D
@THAT
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// pop local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// goto command
@Math.sqrt$IF2_2
0; JMP
// label command
(Math.sqrt$IF1_2)
// label command
(Math.sqrt$IF2_2)
// push local 1
@1
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// sub
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@SP
A=M
M=D
@SP
M=M+1
// pop local 1
@1
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// goto command
@Math.sqrt$WHILE1_1
0; JMP
// label command
(Math.sqrt$WHILE2_1)
// push local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// return
// save LCL in end frame variable endFrame
@LCL
D=M
@endFrame
M=D
// save return address in variable retAddress
@5
D=A
@endFrame
D=M-D
A=D
D=M
@retAddress
M=D
// reposition return value for the caller
@SP
M=M-1
@SP
A=M
D=M
@ARG
A=M
M=D
// reposition SP
@ARG
D=M+1
@SP
M=D
// recover segments
// recover THAT
@endFrame
D=M-1
A=D
D=M
@THAT
M=D
// recover THIS
@2
D=A
@endFrame
D=M-D
A=D
D=M
@THIS
M=D
// recover ARG
@3
D=A
@endFrame
D=M-D
A=D
D=M
@ARG
M=D
// recover LCL
@4
D=A
@endFrame
D=M-D
A=D
D=M
@LCL
M=D
// actual return
@retAddress
A=M
0;JMP
// function Math.max 0
(Math.max)
//push zeroes
@0
D=A
@nargs
M=D
(PUSH36)
@nargs
D=M
@NOTPUSH36
D;JEQ
D=0
@SP
A=M
M=D
@SP
M=M+1
@nargs
M=M-1
@PUSH36
0; JMP
(NOTPUSH36)
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push argument 1
@1
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// gt
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@GREATER37
D;JGT
@NOTGREATER37
0;JMP
(GREATER37)
D=-1
@CONTINUE37
0;JMP
(NOTGREATER37)
D=0
@CONTINUE37
0;JMP
(CONTINUE37)
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// if-goto command
@SP
M=M-1
@SP
A=M
D=M
@Math.max$IF1_0
D; JNE
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// return
// save LCL in end frame variable endFrame
@LCL
D=M
@endFrame
M=D
// save return address in variable retAddress
@5
D=A
@endFrame
D=M-D
A=D
D=M
@retAddress
M=D
// reposition return value for the caller
@SP
M=M-1
@SP
A=M
D=M
@ARG
A=M
M=D
// reposition SP
@ARG
D=M+1
@SP
M=D
// recover segments
// recover THAT
@endFrame
D=M-1
A=D
D=M
@THAT
M=D
// recover THIS
@2
D=A
@endFrame
D=M-D
A=D
D=M
@THIS
M=D
// recover ARG
@3
D=A
@endFrame
D=M-D
A=D
D=M
@ARG
M=D
// recover LCL
@4
D=A
@endFrame
D=M-D
A=D
D=M
@LCL
M=D
// actual return
@retAddress
A=M
0;JMP
// goto command
@Math.max$IF2_0
0; JMP
// label command
(Math.max$IF1_0)
// label command
(Math.max$IF2_0)
// push argument 1
@1
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// return
// save LCL in end frame variable endFrame
@LCL
D=M
@endFrame
M=D
// save return address in variable retAddress
@5
D=A
@endFrame
D=M-D
A=D
D=M
@retAddress
M=D
// reposition return value for the caller
@SP
M=M-1
@SP
A=M
D=M
@ARG
A=M
M=D
// reposition SP
@ARG
D=M+1
@SP
M=D
// recover segments
// recover THAT
@endFrame
D=M-1
A=D
D=M
@THAT
M=D
// recover THIS
@2
D=A
@endFrame
D=M-D
A=D
D=M
@THIS
M=D
// recover ARG
@3
D=A
@endFrame
D=M-D
A=D
D=M
@ARG
M=D
// recover LCL
@4
D=A
@endFrame
D=M-D
A=D
D=M
@LCL
M=D
// actual return
@retAddress
A=M
0;JMP
// function Math.min 0
(Math.min)
//push zeroes
@0
D=A
@nargs
M=D
(PUSH38)
@nargs
D=M
@NOTPUSH38
D;JEQ
D=0
@SP
A=M
M=D
@SP
M=M+1
@nargs
M=M-1
@PUSH38
0; JMP
(NOTPUSH38)
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push argument 1
@1
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@LESS39
D;JLT
@NOTLESS39
0;JMP
(LESS39)
D=-1
@CONTINUE39
0;JMP
(NOTLESS39)
D=0
@CONTINUE39
0;JMP
(CONTINUE39)
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// if-goto command
@SP
M=M-1
@SP
A=M
D=M
@Math.min$IF1_0
D; JNE
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// return
// save LCL in end frame variable endFrame
@LCL
D=M
@endFrame
M=D
// save return address in variable retAddress
@5
D=A
@endFrame
D=M-D
A=D
D=M
@retAddress
M=D
// reposition return value for the caller
@SP
M=M-1
@SP
A=M
D=M
@ARG
A=M
M=D
// reposition SP
@ARG
D=M+1
@SP
M=D
// recover segments
// recover THAT
@endFrame
D=M-1
A=D
D=M
@THAT
M=D
// recover THIS
@2
D=A
@endFrame
D=M-D
A=D
D=M
@THIS
M=D
// recover ARG
@3
D=A
@endFrame
D=M-D
A=D
D=M
@ARG
M=D
// recover LCL
@4
D=A
@endFrame
D=M-D
A=D
D=M
@LCL
M=D
// actual return
@retAddress
A=M
0;JMP
// goto command
@Math.min$IF2_0
0; JMP
// label command
(Math.min$IF1_0)
// label command
(Math.min$IF2_0)
// push argument 1
@1
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// return
// save LCL in end frame variable endFrame
@LCL
D=M
@endFrame
M=D
// save return address in variable retAddress
@5
D=A
@endFrame
D=M-D
A=D
D=M
@retAddress
M=D
// reposition return value for the caller
@SP
M=M-1
@SP
A=M
D=M
@ARG
A=M
M=D
// reposition SP
@ARG
D=M+1
@SP
M=D
// recover segments
// recover THAT
@endFrame
D=M-1
A=D
D=M
@THAT
M=D
// recover THIS
@2
D=A
@endFrame
D=M-D
A=D
D=M
@THIS
M=D
// recover ARG
@3
D=A
@endFrame
D=M-D
A=D
D=M
@ARG
M=D
// recover LCL
@4
D=A
@endFrame
D=M-D
A=D
D=M
@LCL
M=D
// actual return
@retAddress
A=M
0;JMP
// function Memory.init 0
(Memory.init)
//push zeroes
@0
D=A
@nargs
M=D
(PUSH40)
@nargs
D=M
@NOTPUSH40
D;JEQ
D=0
@SP
A=M
M=D
@SP
M=M+1
@nargs
M=M-1
@PUSH40
0; JMP
(NOTPUSH40)
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop static 0
@SP
M=M-1
@SP
A=M
D=M
@Memory.0
M=D
// push constant 2048
@2048
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop static 3
@SP
M=M-1
@SP
A=M
D=M
@Memory.3
M=D
// push constant 14334
@14334
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop static 4
@SP
M=M-1
@SP
A=M
D=M
@Memory.4
M=D
// push static 3
@Memory.3
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop static 1
@SP
M=M-1
@SP
A=M
D=M
@Memory.1
M=D
// push static 1
@Memory.1
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop static 2
@SP
M=M-1
@SP
A=M
D=M
@Memory.2
M=D
// push static 1
@Memory.1
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// pop pointer 1
@SP
M=M-1
@SP
A=M
D=M
@R4
M=D
// push temp 0
@R5
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop that 0
@0
D=A
@address
M=D
@THAT
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push static 1
@Memory.1
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// push static 4
@Memory.4
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// pop pointer 1
@SP
M=M-1
@SP
A=M
D=M
@R4
M=D
// push temp 0
@R5
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop that 0
@0
D=A
@address
M=D
@THAT
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// return
// save LCL in end frame variable endFrame
@LCL
D=M
@endFrame
M=D
// save return address in variable retAddress
@5
D=A
@endFrame
D=M-D
A=D
D=M
@retAddress
M=D
// reposition return value for the caller
@SP
M=M-1
@SP
A=M
D=M
@ARG
A=M
M=D
// reposition SP
@ARG
D=M+1
@SP
M=D
// recover segments
// recover THAT
@endFrame
D=M-1
A=D
D=M
@THAT
M=D
// recover THIS
@2
D=A
@endFrame
D=M-D
A=D
D=M
@THIS
M=D
// recover ARG
@3
D=A
@endFrame
D=M-D
A=D
D=M
@ARG
M=D
// recover LCL
@4
D=A
@endFrame
D=M-D
A=D
D=M
@LCL
M=D
// actual return
@retAddress
A=M
0;JMP
// function Memory.peek 0
(Memory.peek)
//push zeroes
@0
D=A
@nargs
M=D
(PUSH41)
@nargs
D=M
@NOTPUSH41
D;JEQ
D=0
@SP
A=M
M=D
@SP
M=M+1
@nargs
M=M-1
@PUSH41
0; JMP
(NOTPUSH41)
// push static 0
@Memory.0
D=M
@SP
A=M
M=D
@SP
M=M+1
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// pop pointer 1
@SP
M=M-1
@SP
A=M
D=M
@R4
M=D
// push that 0
@0
D=A
@address
M=D
@THAT
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// return
// save LCL in end frame variable endFrame
@LCL
D=M
@endFrame
M=D
// save return address in variable retAddress
@5
D=A
@endFrame
D=M-D
A=D
D=M
@retAddress
M=D
// reposition return value for the caller
@SP
M=M-1
@SP
A=M
D=M
@ARG
A=M
M=D
// reposition SP
@ARG
D=M+1
@SP
M=D
// recover segments
// recover THAT
@endFrame
D=M-1
A=D
D=M
@THAT
M=D
// recover THIS
@2
D=A
@endFrame
D=M-D
A=D
D=M
@THIS
M=D
// recover ARG
@3
D=A
@endFrame
D=M-D
A=D
D=M
@ARG
M=D
// recover LCL
@4
D=A
@endFrame
D=M-D
A=D
D=M
@LCL
M=D
// actual return
@retAddress
A=M
0;JMP
// function Memory.poke 0
(Memory.poke)
//push zeroes
@0
D=A
@nargs
M=D
(PUSH42)
@nargs
D=M
@NOTPUSH42
D;JEQ
D=0
@SP
A=M
M=D
@SP
M=M+1
@nargs
M=M-1
@PUSH42
0; JMP
(NOTPUSH42)
// push static 0
@Memory.0
D=M
@SP
A=M
M=D
@SP
M=M+1
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// push argument 1
@1
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// pop pointer 1
@SP
M=M-1
@SP
A=M
D=M
@R4
M=D
// push temp 0
@R5
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop that 0
@0
D=A
@address
M=D
@THAT
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// return
// save LCL in end frame variable endFrame
@LCL
D=M
@endFrame
M=D
// save return address in variable retAddress
@5
D=A
@endFrame
D=M-D
A=D
D=M
@retAddress
M=D
// reposition return value for the caller
@SP
M=M-1
@SP
A=M
D=M
@ARG
A=M
M=D
// reposition SP
@ARG
D=M+1
@SP
M=D
// recover segments
// recover THAT
@endFrame
D=M-1
A=D
D=M
@THAT
M=D
// recover THIS
@2
D=A
@endFrame
D=M-D
A=D
D=M
@THIS
M=D
// recover ARG
@3
D=A
@endFrame
D=M-D
A=D
D=M
@ARG
M=D
// recover LCL
@4
D=A
@endFrame
D=M-D
A=D
D=M
@LCL
M=D
// actual return
@retAddress
A=M
0;JMP
// function Memory.isPossible 0
(Memory.isPossible)
//push zeroes
@0
D=A
@nargs
M=D
(PUSH43)
@nargs
D=M
@NOTPUSH43
D;JEQ
D=0
@SP
A=M
M=D
@SP
M=M+1
@nargs
M=M-1
@PUSH43
0; JMP
(NOTPUSH43)
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push argument 1
@1
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// gt
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@GREATER44
D;JGT
@NOTGREATER44
0;JMP
(GREATER44)
D=-1
@CONTINUE44
0;JMP
(NOTGREATER44)
D=0
@CONTINUE44
0;JMP
(CONTINUE44)
@SP
A=M
M=D
@SP
M=M+1
// return
// save LCL in end frame variable endFrame
@LCL
D=M
@endFrame
M=D
// save return address in variable retAddress
@5
D=A
@endFrame
D=M-D
A=D
D=M
@retAddress
M=D
// reposition return value for the caller
@SP
M=M-1
@SP
A=M
D=M
@ARG
A=M
M=D
// reposition SP
@ARG
D=M+1
@SP
M=D
// recover segments
// recover THAT
@endFrame
D=M-1
A=D
D=M
@THAT
M=D
// recover THIS
@2
D=A
@endFrame
D=M-D
A=D
D=M
@THIS
M=D
// recover ARG
@3
D=A
@endFrame
D=M-D
A=D
D=M
@ARG
M=D
// recover LCL
@4
D=A
@endFrame
D=M-D
A=D
D=M
@LCL
M=D
// actual return
@retAddress
A=M
0;JMP
// function Memory.getNext 0
(Memory.getNext)
//push zeroes
@0
D=A
@nargs
M=D
(PUSH45)
@nargs
D=M
@NOTPUSH45
D;JEQ
D=0
@SP
A=M
M=D
@SP
M=M+1
@nargs
M=M-1
@PUSH45
0; JMP
(NOTPUSH45)
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// pop pointer 1
@SP
M=M-1
@SP
A=M
D=M
@R4
M=D
// push that 0
@0
D=A
@address
M=D
@THAT
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// return
// save LCL in end frame variable endFrame
@LCL
D=M
@endFrame
M=D
// save return address in variable retAddress
@5
D=A
@endFrame
D=M-D
A=D
D=M
@retAddress
M=D
// reposition return value for the caller
@SP
M=M-1
@SP
A=M
D=M
@ARG
A=M
M=D
// reposition SP
@ARG
D=M+1
@SP
M=D
// recover segments
// recover THAT
@endFrame
D=M-1
A=D
D=M
@THAT
M=D
// recover THIS
@2
D=A
@endFrame
D=M-D
A=D
D=M
@THIS
M=D
// recover ARG
@3
D=A
@endFrame
D=M-D
A=D
D=M
@ARG
M=D
// recover LCL
@4
D=A
@endFrame
D=M-D
A=D
D=M
@LCL
M=D
// actual return
@retAddress
A=M
0;JMP
// function Memory.getSize 0
(Memory.getSize)
//push zeroes
@0
D=A
@nargs
M=D
(PUSH46)
@nargs
D=M
@NOTPUSH46
D;JEQ
D=0
@SP
A=M
M=D
@SP
M=M+1
@nargs
M=M-1
@PUSH46
0; JMP
(NOTPUSH46)
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// pop pointer 1
@SP
M=M-1
@SP
A=M
D=M
@R4
M=D
// push that 0
@0
D=A
@address
M=D
@THAT
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// return
// save LCL in end frame variable endFrame
@LCL
D=M
@endFrame
M=D
// save return address in variable retAddress
@5
D=A
@endFrame
D=M-D
A=D
D=M
@retAddress
M=D
// reposition return value for the caller
@SP
M=M-1
@SP
A=M
D=M
@ARG
A=M
M=D
// reposition SP
@ARG
D=M+1
@SP
M=D
// recover segments
// recover THAT
@endFrame
D=M-1
A=D
D=M
@THAT
M=D
// recover THIS
@2
D=A
@endFrame
D=M-D
A=D
D=M
@THIS
M=D
// recover ARG
@3
D=A
@endFrame
D=M-D
A=D
D=M
@ARG
M=D
// recover LCL
@4
D=A
@endFrame
D=M-D
A=D
D=M
@LCL
M=D
// actual return
@retAddress
A=M
0;JMP
// function Memory.findFree 4
(Memory.findFree)
//push zeroes
@4
D=A
@nargs
M=D
(PUSH47)
@nargs
D=M
@NOTPUSH47
D;JEQ
D=0
@SP
A=M
M=D
@SP
M=M+1
@nargs
M=M-1
@PUSH47
0; JMP
(NOTPUSH47)
// push static 2
@Memory.2
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop local 1
@1
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push static 4
@Memory.4
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// pop local 2
@2
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// label command
(Memory.findFree$WHILE1_0)
// push local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// eq
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@EQUAL48
D;JEQ
@NOTEQUAL48
0;JMP
(EQUAL48)
D=-1
@CONTINUE48
0;JMP
(NOTEQUAL48)
D=0
@CONTINUE48
0;JMP
(CONTINUE48)
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// if-goto command
@SP
M=M-1
@SP
A=M
D=M
@Memory.findFree$WHILE2_0
D; JNE
// push local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Memory.getSize 1
//push return address
@Memory.findFree$ret.0
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@6
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Memory.getSize
0;JMP
// continue after call
(Memory.findFree$ret.0)
// pop local 3
@3
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push local 3
@3
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Memory.isPossible 2
//push return address
@Memory.findFree$ret.1
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@7
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Memory.isPossible
0;JMP
// continue after call
(Memory.findFree$ret.1)
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// if-goto command
@SP
M=M-1
@SP
A=M
D=M
@Memory.findFree$IF1_1
D; JNE
// push local 3
@3
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 2
@2
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@LESS49
D;JLT
@NOTLESS49
0;JMP
(LESS49)
D=-1
@CONTINUE49
0;JMP
(NOTLESS49)
D=0
@CONTINUE49
0;JMP
(CONTINUE49)
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// if-goto command
@SP
M=M-1
@SP
A=M
D=M
@Memory.findFree$IF1_2
D; JNE
// push local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop local 1
@1
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push local 3
@3
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop local 2
@2
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// goto command
@Memory.findFree$IF2_2
0; JMP
// label command
(Memory.findFree$IF1_2)
// label command
(Memory.findFree$IF2_2)
// goto command
@Memory.findFree$IF2_1
0; JMP
// label command
(Memory.findFree$IF1_1)
// label command
(Memory.findFree$IF2_1)
// push local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Memory.getNext 1
//push return address
@Memory.findFree$ret.2
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@6
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Memory.getNext
0;JMP
// continue after call
(Memory.findFree$ret.2)
// pop local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// goto command
@Memory.findFree$WHILE1_0
0; JMP
// label command
(Memory.findFree$WHILE2_0)
// push local 1
@1
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// return
// save LCL in end frame variable endFrame
@LCL
D=M
@endFrame
M=D
// save return address in variable retAddress
@5
D=A
@endFrame
D=M-D
A=D
D=M
@retAddress
M=D
// reposition return value for the caller
@SP
M=M-1
@SP
A=M
D=M
@ARG
A=M
M=D
// reposition SP
@ARG
D=M+1
@SP
M=D
// recover segments
// recover THAT
@endFrame
D=M-1
A=D
D=M
@THAT
M=D
// recover THIS
@2
D=A
@endFrame
D=M-D
A=D
D=M
@THIS
M=D
// recover ARG
@3
D=A
@endFrame
D=M-D
A=D
D=M
@ARG
M=D
// recover LCL
@4
D=A
@endFrame
D=M-D
A=D
D=M
@LCL
M=D
// actual return
@retAddress
A=M
0;JMP
// function Memory.decreaseFreeBlockSize 0
(Memory.decreaseFreeBlockSize)
//push zeroes
@0
D=A
@nargs
M=D
(PUSH50)
@nargs
D=M
@NOTPUSH50
D;JEQ
D=0
@SP
A=M
M=D
@SP
M=M+1
@nargs
M=M-1
@PUSH50
0; JMP
(NOTPUSH50)
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// push argument 2
@2
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push argument 1
@1
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 2
@2
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// sub
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@SP
A=M
M=D
@SP
M=M+1
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// pop pointer 1
@SP
M=M-1
@SP
A=M
D=M
@R4
M=D
// push temp 0
@R5
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop that 0
@0
D=A
@address
M=D
@THAT
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// return
// save LCL in end frame variable endFrame
@LCL
D=M
@endFrame
M=D
// save return address in variable retAddress
@5
D=A
@endFrame
D=M-D
A=D
D=M
@retAddress
M=D
// reposition return value for the caller
@SP
M=M-1
@SP
A=M
D=M
@ARG
A=M
M=D
// reposition SP
@ARG
D=M+1
@SP
M=D
// recover segments
// recover THAT
@endFrame
D=M-1
A=D
D=M
@THAT
M=D
// recover THIS
@2
D=A
@endFrame
D=M-D
A=D
D=M
@THIS
M=D
// recover ARG
@3
D=A
@endFrame
D=M-D
A=D
D=M
@ARG
M=D
// recover LCL
@4
D=A
@endFrame
D=M-D
A=D
D=M
@LCL
M=D
// actual return
@retAddress
A=M
0;JMP
// function Memory.getAllocatedBlockAddress 0
(Memory.getAllocatedBlockAddress)
//push zeroes
@0
D=A
@nargs
M=D
(PUSH51)
@nargs
D=M
@NOTPUSH51
D;JEQ
D=0
@SP
A=M
M=D
@SP
M=M+1
@nargs
M=M-1
@PUSH51
0; JMP
(NOTPUSH51)
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 2
@2
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// push argument 2
@2
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// push argument 1
@1
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// sub
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@SP
A=M
M=D
@SP
M=M+1
// return
// save LCL in end frame variable endFrame
@LCL
D=M
@endFrame
M=D
// save return address in variable retAddress
@5
D=A
@endFrame
D=M-D
A=D
D=M
@retAddress
M=D
// reposition return value for the caller
@SP
M=M-1
@SP
A=M
D=M
@ARG
A=M
M=D
// reposition SP
@ARG
D=M+1
@SP
M=D
// recover segments
// recover THAT
@endFrame
D=M-1
A=D
D=M
@THAT
M=D
// recover THIS
@2
D=A
@endFrame
D=M-D
A=D
D=M
@THIS
M=D
// recover ARG
@3
D=A
@endFrame
D=M-D
A=D
D=M
@ARG
M=D
// recover LCL
@4
D=A
@endFrame
D=M-D
A=D
D=M
@LCL
M=D
// actual return
@retAddress
A=M
0;JMP
// function Memory.rememberAllocatedSize 0
(Memory.rememberAllocatedSize)
//push zeroes
@0
D=A
@nargs
M=D
(PUSH52)
@nargs
D=M
@NOTPUSH52
D;JEQ
D=0
@SP
A=M
M=D
@SP
M=M+1
@nargs
M=M-1
@PUSH52
0; JMP
(NOTPUSH52)
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// neg
@SP
M=M-1
@SP
A=M
D=M
D=-D
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// push argument 1
@1
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// pop pointer 1
@SP
M=M-1
@SP
A=M
D=M
@R4
M=D
// push temp 0
@R5
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop that 0
@0
D=A
@address
M=D
@THAT
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// return
// save LCL in end frame variable endFrame
@LCL
D=M
@endFrame
M=D
// save return address in variable retAddress
@5
D=A
@endFrame
D=M-D
A=D
D=M
@retAddress
M=D
// reposition return value for the caller
@SP
M=M-1
@SP
A=M
D=M
@ARG
A=M
M=D
// reposition SP
@ARG
D=M+1
@SP
M=D
// recover segments
// recover THAT
@endFrame
D=M-1
A=D
D=M
@THAT
M=D
// recover THIS
@2
D=A
@endFrame
D=M-D
A=D
D=M
@THIS
M=D
// recover ARG
@3
D=A
@endFrame
D=M-D
A=D
D=M
@ARG
M=D
// recover LCL
@4
D=A
@endFrame
D=M-D
A=D
D=M
@LCL
M=D
// actual return
@retAddress
A=M
0;JMP
// function Memory.alloc 2
(Memory.alloc)
//push zeroes
@2
D=A
@nargs
M=D
(PUSH53)
@nargs
D=M
@NOTPUSH53
D;JEQ
D=0
@SP
A=M
M=D
@SP
M=M+1
@nargs
M=M-1
@PUSH53
0; JMP
(NOTPUSH53)
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@LESS54
D;JLT
@NOTLESS54
0;JMP
(LESS54)
D=-1
@CONTINUE54
0;JMP
(NOTLESS54)
D=0
@CONTINUE54
0;JMP
(CONTINUE54)
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// if-goto command
@SP
M=M-1
@SP
A=M
D=M
@Memory.alloc$IF1_0
D; JNE
// push constant 5
@5
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Sys.error 1
//push return address
@Memory.alloc$ret.0
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@6
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Sys.error
0;JMP
// continue after call
(Memory.alloc$ret.0)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// goto command
@Memory.alloc$IF2_0
0; JMP
// label command
(Memory.alloc$IF1_0)
// label command
(Memory.alloc$IF2_0)
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Memory.findFree 1
//push return address
@Memory.alloc$ret.1
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@6
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Memory.findFree
0;JMP
// continue after call
(Memory.alloc$ret.1)
// pop local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// eq
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@EQUAL55
D;JEQ
@NOTEQUAL55
0;JMP
(EQUAL55)
D=-1
@CONTINUE55
0;JMP
(NOTEQUAL55)
D=0
@CONTINUE55
0;JMP
(CONTINUE55)
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// if-goto command
@SP
M=M-1
@SP
A=M
D=M
@Memory.alloc$IF1_1
D; JNE
// call Memory.deFrag 0
//push return address
@Memory.alloc$ret.2
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@5
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Memory.deFrag
0;JMP
// continue after call
(Memory.alloc$ret.2)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Memory.findFree 1
//push return address
@Memory.alloc$ret.3
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@6
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Memory.findFree
0;JMP
// continue after call
(Memory.alloc$ret.3)
// pop local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// eq
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@EQUAL56
D;JEQ
@NOTEQUAL56
0;JMP
(EQUAL56)
D=-1
@CONTINUE56
0;JMP
(NOTEQUAL56)
D=0
@CONTINUE56
0;JMP
(CONTINUE56)
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// if-goto command
@SP
M=M-1
@SP
A=M
D=M
@Memory.alloc$IF1_2
D; JNE
// push constant 6
@6
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Sys.error 1
//push return address
@Memory.alloc$ret.4
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@6
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Sys.error
0;JMP
// continue after call
(Memory.alloc$ret.4)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// goto command
@Memory.alloc$IF2_2
0; JMP
// label command
(Memory.alloc$IF1_2)
// label command
(Memory.alloc$IF2_2)
// goto command
@Memory.alloc$IF2_1
0; JMP
// label command
(Memory.alloc$IF1_1)
// label command
(Memory.alloc$IF2_1)
// push local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Memory.getSize 1
//push return address
@Memory.alloc$ret.5
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@6
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Memory.getSize
0;JMP
// continue after call
(Memory.alloc$ret.5)
// pop local 1
@1
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 1
@1
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Memory.decreaseFreeBlockSize 3
//push return address
@Memory.alloc$ret.6
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@8
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Memory.decreaseFreeBlockSize
0;JMP
// continue after call
(Memory.alloc$ret.6)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 1
@1
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Memory.getAllocatedBlockAddress 3
//push return address
@Memory.alloc$ret.7
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@8
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Memory.getAllocatedBlockAddress
0;JMP
// continue after call
(Memory.alloc$ret.7)
// pop local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Memory.rememberAllocatedSize 2
//push return address
@Memory.alloc$ret.8
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@7
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Memory.rememberAllocatedSize
0;JMP
// continue after call
(Memory.alloc$ret.8)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// return
// save LCL in end frame variable endFrame
@LCL
D=M
@endFrame
M=D
// save return address in variable retAddress
@5
D=A
@endFrame
D=M-D
A=D
D=M
@retAddress
M=D
// reposition return value for the caller
@SP
M=M-1
@SP
A=M
D=M
@ARG
A=M
M=D
// reposition SP
@ARG
D=M+1
@SP
M=D
// recover segments
// recover THAT
@endFrame
D=M-1
A=D
D=M
@THAT
M=D
// recover THIS
@2
D=A
@endFrame
D=M-D
A=D
D=M
@THIS
M=D
// recover ARG
@3
D=A
@endFrame
D=M-D
A=D
D=M
@ARG
M=D
// recover LCL
@4
D=A
@endFrame
D=M-D
A=D
D=M
@LCL
M=D
// actual return
@retAddress
A=M
0;JMP
// function Memory.startFragment 0
(Memory.startFragment)
//push zeroes
@0
D=A
@nargs
M=D
(PUSH57)
@nargs
D=M
@NOTPUSH57
D;JEQ
D=0
@SP
A=M
M=D
@SP
M=M+1
@nargs
M=M-1
@PUSH57
0; JMP
(NOTPUSH57)
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// eq
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@EQUAL58
D;JEQ
@NOTEQUAL58
0;JMP
(EQUAL58)
D=-1
@CONTINUE58
0;JMP
(NOTEQUAL58)
D=0
@CONTINUE58
0;JMP
(CONTINUE58)
@SP
A=M
M=D
@SP
M=M+1
// return
// save LCL in end frame variable endFrame
@LCL
D=M
@endFrame
M=D
// save return address in variable retAddress
@5
D=A
@endFrame
D=M-D
A=D
D=M
@retAddress
M=D
// reposition return value for the caller
@SP
M=M-1
@SP
A=M
D=M
@ARG
A=M
M=D
// reposition SP
@ARG
D=M+1
@SP
M=D
// recover segments
// recover THAT
@endFrame
D=M-1
A=D
D=M
@THAT
M=D
// recover THIS
@2
D=A
@endFrame
D=M-D
A=D
D=M
@THIS
M=D
// recover ARG
@3
D=A
@endFrame
D=M-D
A=D
D=M
@ARG
M=D
// recover LCL
@4
D=A
@endFrame
D=M-D
A=D
D=M
@LCL
M=D
// actual return
@retAddress
A=M
0;JMP
// function Memory.findPrev 2
(Memory.findPrev)
//push zeroes
@2
D=A
@nargs
M=D
(PUSH59)
@nargs
D=M
@NOTPUSH59
D;JEQ
D=0
@SP
A=M
M=D
@SP
M=M+1
@nargs
M=M-1
@PUSH59
0; JMP
(NOTPUSH59)
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push static 2
@Memory.2
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop local 1
@1
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// label command
(Memory.findPrev$WHILE1_0)
// push local 1
@1
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@LESS60
D;JLT
@NOTLESS60
0;JMP
(LESS60)
D=-1
@CONTINUE60
0;JMP
(NOTLESS60)
D=0
@CONTINUE60
0;JMP
(CONTINUE60)
@SP
A=M
M=D
@SP
M=M+1
// push local 1
@1
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// eq
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@EQUAL61
D;JEQ
@NOTEQUAL61
0;JMP
(EQUAL61)
D=-1
@CONTINUE61
0;JMP
(NOTEQUAL61)
D=0
@CONTINUE61
0;JMP
(CONTINUE61)
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// and
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D&M
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// if-goto command
@SP
M=M-1
@SP
A=M
D=M
@Memory.findPrev$WHILE2_0
D; JNE
// push local 1
@1
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push local 1
@1
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Memory.getNext 1
//push return address
@Memory.findPrev$ret.0
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@6
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Memory.getNext
0;JMP
// continue after call
(Memory.findPrev$ret.0)
// pop local 1
@1
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// goto command
@Memory.findPrev$WHILE1_0
0; JMP
// label command
(Memory.findPrev$WHILE2_0)
// push local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// return
// save LCL in end frame variable endFrame
@LCL
D=M
@endFrame
M=D
// save return address in variable retAddress
@5
D=A
@endFrame
D=M-D
A=D
D=M
@retAddress
M=D
// reposition return value for the caller
@SP
M=M-1
@SP
A=M
D=M
@ARG
A=M
M=D
// reposition SP
@ARG
D=M+1
@SP
M=D
// recover segments
// recover THAT
@endFrame
D=M-1
A=D
D=M
@THAT
M=D
// recover THIS
@2
D=A
@endFrame
D=M-D
A=D
D=M
@THIS
M=D
// recover ARG
@3
D=A
@endFrame
D=M-D
A=D
D=M
@ARG
M=D
// recover LCL
@4
D=A
@endFrame
D=M-D
A=D
D=M
@LCL
M=D
// actual return
@retAddress
A=M
0;JMP
// function Memory.deAlloc 3
(Memory.deAlloc)
//push zeroes
@3
D=A
@nargs
M=D
(PUSH62)
@nargs
D=M
@NOTPUSH62
D;JEQ
D=0
@SP
A=M
M=D
@SP
M=M+1
@nargs
M=M-1
@PUSH62
0; JMP
(NOTPUSH62)
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 2
@2
D=A
@SP
A=M
M=D
@SP
M=M+1
// sub
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@SP
A=M
M=D
@SP
M=M+1
// pop local 2
@2
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push local 2
@2
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Memory.findPrev 1
//push return address
@Memory.deAlloc$ret.0
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@6
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Memory.findPrev
0;JMP
// continue after call
(Memory.deAlloc$ret.0)
// pop local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Memory.startFragment 1
//push return address
@Memory.deAlloc$ret.1
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@6
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Memory.startFragment
0;JMP
// continue after call
(Memory.deAlloc$ret.1)
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// if-goto command
@SP
M=M-1
@SP
A=M
D=M
@Memory.deAlloc$IF1_0
D; JNE
// push local 2
@2
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// push static 2
@Memory.2
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// pop pointer 1
@SP
M=M-1
@SP
A=M
D=M
@R4
M=D
// push temp 0
@R5
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop that 0
@0
D=A
@address
M=D
@THAT
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push local 2
@2
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop static 2
@SP
M=M-1
@SP
A=M
D=M
@Memory.2
M=D
// goto command
@Memory.deAlloc$IF2_0
0; JMP
// label command
(Memory.deAlloc$IF1_0)
// push local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Memory.getNext 1
//push return address
@Memory.deAlloc$ret.2
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@6
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Memory.getNext
0;JMP
// continue after call
(Memory.deAlloc$ret.2)
// pop local 1
@1
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// push local 2
@2
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// pop pointer 1
@SP
M=M-1
@SP
A=M
D=M
@R4
M=D
// push temp 0
@R5
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop that 0
@0
D=A
@address
M=D
@THAT
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push local 2
@2
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// push local 1
@1
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// pop pointer 1
@SP
M=M-1
@SP
A=M
D=M
@R4
M=D
// push temp 0
@R5
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop that 0
@0
D=A
@address
M=D
@THAT
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// label command
(Memory.deAlloc$IF2_0)
// call Memory.deFrag 0
//push return address
@Memory.deAlloc$ret.3
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@5
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Memory.deFrag
0;JMP
// continue after call
(Memory.deAlloc$ret.3)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// return
// save LCL in end frame variable endFrame
@LCL
D=M
@endFrame
M=D
// save return address in variable retAddress
@5
D=A
@endFrame
D=M-D
A=D
D=M
@retAddress
M=D
// reposition return value for the caller
@SP
M=M-1
@SP
A=M
D=M
@ARG
A=M
M=D
// reposition SP
@ARG
D=M+1
@SP
M=D
// recover segments
// recover THAT
@endFrame
D=M-1
A=D
D=M
@THAT
M=D
// recover THIS
@2
D=A
@endFrame
D=M-D
A=D
D=M
@THIS
M=D
// recover ARG
@3
D=A
@endFrame
D=M-D
A=D
D=M
@ARG
M=D
// recover LCL
@4
D=A
@endFrame
D=M-D
A=D
D=M
@LCL
M=D
// actual return
@retAddress
A=M
0;JMP
// function Memory.consecutive 1
(Memory.consecutive)
//push zeroes
@1
D=A
@nargs
M=D
(PUSH63)
@nargs
D=M
@NOTPUSH63
D;JEQ
D=0
@SP
A=M
M=D
@SP
M=M+1
@nargs
M=M-1
@PUSH63
0; JMP
(NOTPUSH63)
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// pop pointer 1
@SP
M=M-1
@SP
A=M
D=M
@R4
M=D
// push that 0
@0
D=A
@address
M=D
@THAT
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 2
@2
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// push local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// push argument 1
@1
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// eq
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@EQUAL64
D;JEQ
@NOTEQUAL64
0;JMP
(EQUAL64)
D=-1
@CONTINUE64
0;JMP
(NOTEQUAL64)
D=0
@CONTINUE64
0;JMP
(CONTINUE64)
@SP
A=M
M=D
@SP
M=M+1
// return
// save LCL in end frame variable endFrame
@LCL
D=M
@endFrame
M=D
// save return address in variable retAddress
@5
D=A
@endFrame
D=M-D
A=D
D=M
@retAddress
M=D
// reposition return value for the caller
@SP
M=M-1
@SP
A=M
D=M
@ARG
A=M
M=D
// reposition SP
@ARG
D=M+1
@SP
M=D
// recover segments
// recover THAT
@endFrame
D=M-1
A=D
D=M
@THAT
M=D
// recover THIS
@2
D=A
@endFrame
D=M-D
A=D
D=M
@THIS
M=D
// recover ARG
@3
D=A
@endFrame
D=M-D
A=D
D=M
@ARG
M=D
// recover LCL
@4
D=A
@endFrame
D=M-D
A=D
D=M
@LCL
M=D
// actual return
@retAddress
A=M
0;JMP
// function Memory.merge 0
(Memory.merge)
//push zeroes
@0
D=A
@nargs
M=D
(PUSH65)
@nargs
D=M
@NOTPUSH65
D;JEQ
D=0
@SP
A=M
M=D
@SP
M=M+1
@nargs
M=M-1
@PUSH65
0; JMP
(NOTPUSH65)
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// push argument 1
@1
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// pop pointer 1
@SP
M=M-1
@SP
A=M
D=M
@R4
M=D
// push that 0
@0
D=A
@address
M=D
@THAT
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// pop pointer 1
@SP
M=M-1
@SP
A=M
D=M
@R4
M=D
// push temp 0
@R5
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop that 0
@0
D=A
@address
M=D
@THAT
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// pop pointer 1
@SP
M=M-1
@SP
A=M
D=M
@R4
M=D
// push that 0
@0
D=A
@address
M=D
@THAT
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 2
@2
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// push argument 1
@1
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// pop pointer 1
@SP
M=M-1
@SP
A=M
D=M
@R4
M=D
// push that 0
@0
D=A
@address
M=D
@THAT
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// pop pointer 1
@SP
M=M-1
@SP
A=M
D=M
@R4
M=D
// push temp 0
@R5
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop that 0
@0
D=A
@address
M=D
@THAT
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// return
// save LCL in end frame variable endFrame
@LCL
D=M
@endFrame
M=D
// save return address in variable retAddress
@5
D=A
@endFrame
D=M-D
A=D
D=M
@retAddress
M=D
// reposition return value for the caller
@SP
M=M-1
@SP
A=M
D=M
@ARG
A=M
M=D
// reposition SP
@ARG
D=M+1
@SP
M=D
// recover segments
// recover THAT
@endFrame
D=M-1
A=D
D=M
@THAT
M=D
// recover THIS
@2
D=A
@endFrame
D=M-D
A=D
D=M
@THIS
M=D
// recover ARG
@3
D=A
@endFrame
D=M-D
A=D
D=M
@ARG
M=D
// recover LCL
@4
D=A
@endFrame
D=M-D
A=D
D=M
@LCL
M=D
// actual return
@retAddress
A=M
0;JMP
// function Memory.deFrag 2
(Memory.deFrag)
//push zeroes
@2
D=A
@nargs
M=D
(PUSH66)
@nargs
D=M
@NOTPUSH66
D;JEQ
D=0
@SP
A=M
M=D
@SP
M=M+1
@nargs
M=M-1
@PUSH66
0; JMP
(NOTPUSH66)
// push static 2
@Memory.2
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// pop pointer 1
@SP
M=M-1
@SP
A=M
D=M
@R4
M=D
// push that 0
@0
D=A
@address
M=D
@THAT
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop local 1
@1
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// label command
(Memory.deFrag$WHILE1_0)
// push local 1
@1
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// eq
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@EQUAL67
D;JEQ
@NOTEQUAL67
0;JMP
(EQUAL67)
D=-1
@CONTINUE67
0;JMP
(NOTEQUAL67)
D=0
@CONTINUE67
0;JMP
(CONTINUE67)
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// if-goto command
@SP
M=M-1
@SP
A=M
D=M
@Memory.deFrag$WHILE2_0
D; JNE
// push local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 1
@1
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Memory.consecutive 2
//push return address
@Memory.deFrag$ret.0
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@7
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Memory.consecutive
0;JMP
// continue after call
(Memory.deFrag$ret.0)
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// if-goto command
@SP
M=M-1
@SP
A=M
D=M
@Memory.deFrag$IF1_1
D; JNE
// push local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 1
@1
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Memory.merge 2
//push return address
@Memory.deFrag$ret.1
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@7
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Memory.merge
0;JMP
// continue after call
(Memory.deFrag$ret.1)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// goto command
@Memory.deFrag$IF2_1
0; JMP
// label command
(Memory.deFrag$IF1_1)
// push local 1
@1
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// label command
(Memory.deFrag$IF2_1)
// push local 1
@1
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Memory.getNext 1
//push return address
@Memory.deFrag$ret.2
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@6
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Memory.getNext
0;JMP
// continue after call
(Memory.deFrag$ret.2)
// pop local 1
@1
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// goto command
@Memory.deFrag$WHILE1_0
0; JMP
// label command
(Memory.deFrag$WHILE2_0)
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// return
// save LCL in end frame variable endFrame
@LCL
D=M
@endFrame
M=D
// save return address in variable retAddress
@5
D=A
@endFrame
D=M-D
A=D
D=M
@retAddress
M=D
// reposition return value for the caller
@SP
M=M-1
@SP
A=M
D=M
@ARG
A=M
M=D
// reposition SP
@ARG
D=M+1
@SP
M=D
// recover segments
// recover THAT
@endFrame
D=M-1
A=D
D=M
@THAT
M=D
// recover THIS
@2
D=A
@endFrame
D=M-D
A=D
D=M
@THIS
M=D
// recover ARG
@3
D=A
@endFrame
D=M-D
A=D
D=M
@ARG
M=D
// recover LCL
@4
D=A
@endFrame
D=M-D
A=D
D=M
@LCL
M=D
// actual return
@retAddress
A=M
0;JMP
// function Output.init 0
(Output.init)
//push zeroes
@0
D=A
@nargs
M=D
(PUSH68)
@nargs
D=M
@NOTPUSH68
D;JEQ
D=0
@SP
A=M
M=D
@SP
M=M+1
@nargs
M=M-1
@PUSH68
0; JMP
(NOTPUSH68)
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop static 1
@SP
M=M-1
@SP
A=M
D=M
@Output.1
M=D
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop static 2
@SP
M=M-1
@SP
A=M
D=M
@Output.2
M=D
// call Output.initMap 0
//push return address
@Output.init$ret.0
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@5
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Output.initMap
0;JMP
// continue after call
(Output.init$ret.0)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// return
// save LCL in end frame variable endFrame
@LCL
D=M
@endFrame
M=D
// save return address in variable retAddress
@5
D=A
@endFrame
D=M-D
A=D
D=M
@retAddress
M=D
// reposition return value for the caller
@SP
M=M-1
@SP
A=M
D=M
@ARG
A=M
M=D
// reposition SP
@ARG
D=M+1
@SP
M=D
// recover segments
// recover THAT
@endFrame
D=M-1
A=D
D=M
@THAT
M=D
// recover THIS
@2
D=A
@endFrame
D=M-D
A=D
D=M
@THIS
M=D
// recover ARG
@3
D=A
@endFrame
D=M-D
A=D
D=M
@ARG
M=D
// recover LCL
@4
D=A
@endFrame
D=M-D
A=D
D=M
@LCL
M=D
// actual return
@retAddress
A=M
0;JMP
// function Output.initMap 1
(Output.initMap)
//push zeroes
@1
D=A
@nargs
M=D
(PUSH69)
@nargs
D=M
@NOTPUSH69
D;JEQ
D=0
@SP
A=M
M=D
@SP
M=M+1
@nargs
M=M-1
@PUSH69
0; JMP
(NOTPUSH69)
// push constant 127
@127
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Array.new 1
//push return address
@Output.initMap$ret.0
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@6
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Array.new
0;JMP
// continue after call
(Output.initMap$ret.0)
// pop static 0
@SP
M=M-1
@SP
A=M
D=M
@Output.0
M=D
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 63
@63
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 63
@63
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 63
@63
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 63
@63
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 63
@63
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 63
@63
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 63
@63
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 63
@63
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 63
@63
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
//push return address
@Output.initMap$ret.1
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@17
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Output.create
0;JMP
// continue after call
(Output.initMap$ret.1)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push constant 32
@32
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
//push return address
@Output.initMap$ret.2
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@17
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Output.create
0;JMP
// continue after call
(Output.initMap$ret.2)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push constant 33
@33
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
//push return address
@Output.initMap$ret.3
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@17
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Output.create
0;JMP
// continue after call
(Output.initMap$ret.3)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push constant 34
@34
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 54
@54
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 54
@54
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 20
@20
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
//push return address
@Output.initMap$ret.4
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@17
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Output.create
0;JMP
// continue after call
(Output.initMap$ret.4)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push constant 35
@35
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 18
@18
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 18
@18
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 63
@63
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 18
@18
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 18
@18
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 63
@63
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 18
@18
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 18
@18
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
//push return address
@Output.initMap$ret.5
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@17
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Output.create
0;JMP
// continue after call
(Output.initMap$ret.5)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push constant 36
@36
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 3
@3
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 48
@48
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
//push return address
@Output.initMap$ret.6
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@17
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Output.create
0;JMP
// continue after call
(Output.initMap$ret.6)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push constant 37
@37
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 35
@35
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 24
@24
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 6
@6
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 49
@49
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
//push return address
@Output.initMap$ret.7
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@17
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Output.create
0;JMP
// continue after call
(Output.initMap$ret.7)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push constant 38
@38
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 54
@54
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 27
@27
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 27
@27
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 27
@27
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 54
@54
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
//push return address
@Output.initMap$ret.8
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@17
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Output.create
0;JMP
// continue after call
(Output.initMap$ret.8)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push constant 39
@39
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 6
@6
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
//push return address
@Output.initMap$ret.9
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@17
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Output.create
0;JMP
// continue after call
(Output.initMap$ret.9)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push constant 40
@40
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 24
@24
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 6
@6
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 6
@6
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 6
@6
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 6
@6
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 6
@6
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 24
@24
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
//push return address
@Output.initMap$ret.10
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@17
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Output.create
0;JMP
// continue after call
(Output.initMap$ret.10)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push constant 41
@41
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 6
@6
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 24
@24
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 24
@24
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 24
@24
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 24
@24
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 24
@24
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 6
@6
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
//push return address
@Output.initMap$ret.11
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@17
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Output.create
0;JMP
// continue after call
(Output.initMap$ret.11)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push constant 42
@42
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 63
@63
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
//push return address
@Output.initMap$ret.12
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@17
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Output.create
0;JMP
// continue after call
(Output.initMap$ret.12)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push constant 43
@43
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 63
@63
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
//push return address
@Output.initMap$ret.13
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@17
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Output.create
0;JMP
// continue after call
(Output.initMap$ret.13)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push constant 44
@44
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 6
@6
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
//push return address
@Output.initMap$ret.14
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@17
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Output.create
0;JMP
// continue after call
(Output.initMap$ret.14)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push constant 45
@45
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 63
@63
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
//push return address
@Output.initMap$ret.15
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@17
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Output.create
0;JMP
// continue after call
(Output.initMap$ret.15)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push constant 46
@46
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
//push return address
@Output.initMap$ret.16
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@17
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Output.create
0;JMP
// continue after call
(Output.initMap$ret.16)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push constant 47
@47
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 32
@32
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 48
@48
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 24
@24
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 6
@6
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 3
@3
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
//push return address
@Output.initMap$ret.17
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@17
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Output.create
0;JMP
// continue after call
(Output.initMap$ret.17)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push constant 48
@48
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
//push return address
@Output.initMap$ret.18
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@17
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Output.create
0;JMP
// continue after call
(Output.initMap$ret.18)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push constant 49
@49
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 14
@14
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 15
@15
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 63
@63
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
//push return address
@Output.initMap$ret.19
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@17
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Output.create
0;JMP
// continue after call
(Output.initMap$ret.19)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push constant 50
@50
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 48
@48
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 24
@24
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 6
@6
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 3
@3
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 63
@63
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
//push return address
@Output.initMap$ret.20
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@17
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Output.create
0;JMP
// continue after call
(Output.initMap$ret.20)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 48
@48
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 48
@48
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 28
@28
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 48
@48
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 48
@48
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
//push return address
@Output.initMap$ret.21
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@17
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Output.create
0;JMP
// continue after call
(Output.initMap$ret.21)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push constant 52
@52
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 16
@16
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 24
@24
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 28
@28
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 26
@26
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 25
@25
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 63
@63
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 24
@24
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 24
@24
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 60
@60
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
//push return address
@Output.initMap$ret.22
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@17
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Output.create
0;JMP
// continue after call
(Output.initMap$ret.22)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push constant 53
@53
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 63
@63
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 3
@3
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 3
@3
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 31
@31
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 48
@48
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 48
@48
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 48
@48
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
//push return address
@Output.initMap$ret.23
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@17
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Output.create
0;JMP
// continue after call
(Output.initMap$ret.23)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push constant 54
@54
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 28
@28
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 6
@6
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 3
@3
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 3
@3
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 31
@31
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
//push return address
@Output.initMap$ret.24
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@17
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Output.create
0;JMP
// continue after call
(Output.initMap$ret.24)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push constant 55
@55
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 63
@63
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 49
@49
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 48
@48
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 48
@48
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 24
@24
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
//push return address
@Output.initMap$ret.25
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@17
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Output.create
0;JMP
// continue after call
(Output.initMap$ret.25)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push constant 56
@56
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
//push return address
@Output.initMap$ret.26
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@17
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Output.create
0;JMP
// continue after call
(Output.initMap$ret.26)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push constant 57
@57
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 62
@62
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 48
@48
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 48
@48
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 24
@24
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 14
@14
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
//push return address
@Output.initMap$ret.27
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@17
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Output.create
0;JMP
// continue after call
(Output.initMap$ret.27)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push constant 58
@58
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
//push return address
@Output.initMap$ret.28
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@17
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Output.create
0;JMP
// continue after call
(Output.initMap$ret.28)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push constant 59
@59
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 6
@6
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
//push return address
@Output.initMap$ret.29
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@17
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Output.create
0;JMP
// continue after call
(Output.initMap$ret.29)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push constant 60
@60
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 24
@24
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 6
@6
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 3
@3
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 6
@6
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 24
@24
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
//push return address
@Output.initMap$ret.30
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@17
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Output.create
0;JMP
// continue after call
(Output.initMap$ret.30)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push constant 61
@61
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 63
@63
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 63
@63
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
//push return address
@Output.initMap$ret.31
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@17
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Output.create
0;JMP
// continue after call
(Output.initMap$ret.31)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push constant 62
@62
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 3
@3
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 6
@6
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 24
@24
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 6
@6
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 3
@3
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
//push return address
@Output.initMap$ret.32
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@17
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Output.create
0;JMP
// continue after call
(Output.initMap$ret.32)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push constant 64
@64
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 59
@59
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 59
@59
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 59
@59
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 27
@27
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 3
@3
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
//push return address
@Output.initMap$ret.33
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@17
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Output.create
0;JMP
// continue after call
(Output.initMap$ret.33)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push constant 63
@63
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 24
@24
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
//push return address
@Output.initMap$ret.34
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@17
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Output.create
0;JMP
// continue after call
(Output.initMap$ret.34)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push constant 65
@65
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 14
@14
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 63
@63
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
//push return address
@Output.initMap$ret.35
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@17
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Output.create
0;JMP
// continue after call
(Output.initMap$ret.35)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push constant 66
@66
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 31
@31
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 31
@31
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 31
@31
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
//push return address
@Output.initMap$ret.36
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@17
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Output.create
0;JMP
// continue after call
(Output.initMap$ret.36)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push constant 67
@67
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 28
@28
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 54
@54
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 35
@35
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 3
@3
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 3
@3
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 3
@3
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 35
@35
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 54
@54
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 28
@28
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
//push return address
@Output.initMap$ret.37
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@17
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Output.create
0;JMP
// continue after call
(Output.initMap$ret.37)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push constant 68
@68
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 15
@15
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 27
@27
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 27
@27
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 15
@15
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
//push return address
@Output.initMap$ret.38
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@17
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Output.create
0;JMP
// continue after call
(Output.initMap$ret.38)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push constant 69
@69
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 63
@63
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 35
@35
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 11
@11
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 15
@15
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 11
@11
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 35
@35
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 63
@63
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
//push return address
@Output.initMap$ret.39
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@17
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Output.create
0;JMP
// continue after call
(Output.initMap$ret.39)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push constant 70
@70
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 63
@63
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 35
@35
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 11
@11
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 15
@15
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 11
@11
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 3
@3
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 3
@3
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 3
@3
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
//push return address
@Output.initMap$ret.40
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@17
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Output.create
0;JMP
// continue after call
(Output.initMap$ret.40)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push constant 71
@71
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 28
@28
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 54
@54
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 35
@35
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 3
@3
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 59
@59
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 54
@54
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 44
@44
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
//push return address
@Output.initMap$ret.41
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@17
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Output.create
0;JMP
// continue after call
(Output.initMap$ret.41)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push constant 72
@72
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 63
@63
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
//push return address
@Output.initMap$ret.42
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@17
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Output.create
0;JMP
// continue after call
(Output.initMap$ret.42)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push constant 73
@73
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
//push return address
@Output.initMap$ret.43
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@17
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Output.create
0;JMP
// continue after call
(Output.initMap$ret.43)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push constant 74
@74
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 60
@60
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 24
@24
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 24
@24
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 24
@24
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 24
@24
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 24
@24
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 27
@27
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 27
@27
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 14
@14
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
//push return address
@Output.initMap$ret.44
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@17
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Output.create
0;JMP
// continue after call
(Output.initMap$ret.44)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push constant 75
@75
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 27
@27
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 15
@15
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 27
@27
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
//push return address
@Output.initMap$ret.45
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@17
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Output.create
0;JMP
// continue after call
(Output.initMap$ret.45)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push constant 76
@76
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 3
@3
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 3
@3
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 3
@3
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 3
@3
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 3
@3
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 3
@3
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 35
@35
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 63
@63
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
//push return address
@Output.initMap$ret.46
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@17
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Output.create
0;JMP
// continue after call
(Output.initMap$ret.46)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push constant 77
@77
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 33
@33
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 63
@63
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 63
@63
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
//push return address
@Output.initMap$ret.47
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@17
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Output.create
0;JMP
// continue after call
(Output.initMap$ret.47)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push constant 78
@78
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 55
@55
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 55
@55
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 63
@63
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 59
@59
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 59
@59
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
//push return address
@Output.initMap$ret.48
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@17
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Output.create
0;JMP
// continue after call
(Output.initMap$ret.48)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push constant 79
@79
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
//push return address
@Output.initMap$ret.49
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@17
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Output.create
0;JMP
// continue after call
(Output.initMap$ret.49)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push constant 80
@80
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 31
@31
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 31
@31
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 3
@3
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 3
@3
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 3
@3
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 3
@3
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
//push return address
@Output.initMap$ret.50
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@17
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Output.create
0;JMP
// continue after call
(Output.initMap$ret.50)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push constant 81
@81
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 63
@63
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 59
@59
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 48
@48
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
//push return address
@Output.initMap$ret.51
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@17
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Output.create
0;JMP
// continue after call
(Output.initMap$ret.51)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push constant 82
@82
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 31
@31
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 31
@31
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 27
@27
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
//push return address
@Output.initMap$ret.52
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@17
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Output.create
0;JMP
// continue after call
(Output.initMap$ret.52)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push constant 83
@83
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 6
@6
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 28
@28
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 48
@48
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
//push return address
@Output.initMap$ret.53
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@17
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Output.create
0;JMP
// continue after call
(Output.initMap$ret.53)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push constant 84
@84
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 63
@63
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 63
@63
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 45
@45
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
//push return address
@Output.initMap$ret.54
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@17
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Output.create
0;JMP
// continue after call
(Output.initMap$ret.54)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push constant 85
@85
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
//push return address
@Output.initMap$ret.55
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@17
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Output.create
0;JMP
// continue after call
(Output.initMap$ret.55)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push constant 86
@86
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
//push return address
@Output.initMap$ret.56
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@17
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Output.create
0;JMP
// continue after call
(Output.initMap$ret.56)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push constant 87
@87
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 63
@63
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 63
@63
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 63
@63
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 18
@18
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
//push return address
@Output.initMap$ret.57
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@17
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Output.create
0;JMP
// continue after call
(Output.initMap$ret.57)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push constant 88
@88
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
//push return address
@Output.initMap$ret.58
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@17
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Output.create
0;JMP
// continue after call
(Output.initMap$ret.58)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push constant 89
@89
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
//push return address
@Output.initMap$ret.59
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@17
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Output.create
0;JMP
// continue after call
(Output.initMap$ret.59)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push constant 90
@90
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 63
@63
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 49
@49
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 24
@24
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 6
@6
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 35
@35
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 63
@63
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
//push return address
@Output.initMap$ret.60
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@17
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Output.create
0;JMP
// continue after call
(Output.initMap$ret.60)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push constant 91
@91
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 6
@6
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 6
@6
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 6
@6
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 6
@6
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 6
@6
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 6
@6
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 6
@6
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
//push return address
@Output.initMap$ret.61
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@17
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Output.create
0;JMP
// continue after call
(Output.initMap$ret.61)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push constant 92
@92
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 3
@3
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 6
@6
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 24
@24
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 48
@48
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 32
@32
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
//push return address
@Output.initMap$ret.62
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@17
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Output.create
0;JMP
// continue after call
(Output.initMap$ret.62)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push constant 93
@93
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 24
@24
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 24
@24
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 24
@24
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 24
@24
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 24
@24
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 24
@24
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 24
@24
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
//push return address
@Output.initMap$ret.63
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@17
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Output.create
0;JMP
// continue after call
(Output.initMap$ret.63)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push constant 94
@94
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 8
@8
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 28
@28
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 54
@54
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
//push return address
@Output.initMap$ret.64
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@17
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Output.create
0;JMP
// continue after call
(Output.initMap$ret.64)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push constant 95
@95
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 63
@63
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
//push return address
@Output.initMap$ret.65
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@17
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Output.create
0;JMP
// continue after call
(Output.initMap$ret.65)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push constant 96
@96
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 6
@6
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 24
@24
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
//push return address
@Output.initMap$ret.66
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@17
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Output.create
0;JMP
// continue after call
(Output.initMap$ret.66)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push constant 97
@97
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 14
@14
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 24
@24
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 27
@27
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 27
@27
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 54
@54
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
//push return address
@Output.initMap$ret.67
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@17
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Output.create
0;JMP
// continue after call
(Output.initMap$ret.67)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push constant 98
@98
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 3
@3
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 3
@3
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 3
@3
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 15
@15
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 27
@27
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
//push return address
@Output.initMap$ret.68
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@17
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Output.create
0;JMP
// continue after call
(Output.initMap$ret.68)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push constant 99
@99
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 3
@3
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 3
@3
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
//push return address
@Output.initMap$ret.69
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@17
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Output.create
0;JMP
// continue after call
(Output.initMap$ret.69)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push constant 100
@100
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 48
@48
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 48
@48
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 48
@48
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 60
@60
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 54
@54
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
//push return address
@Output.initMap$ret.70
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@17
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Output.create
0;JMP
// continue after call
(Output.initMap$ret.70)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push constant 101
@101
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 63
@63
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 3
@3
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
//push return address
@Output.initMap$ret.71
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@17
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Output.create
0;JMP
// continue after call
(Output.initMap$ret.71)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push constant 102
@102
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 28
@28
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 54
@54
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 38
@38
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 6
@6
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 15
@15
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 6
@6
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 6
@6
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 6
@6
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 15
@15
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
//push return address
@Output.initMap$ret.72
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@17
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Output.create
0;JMP
// continue after call
(Output.initMap$ret.72)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push constant 103
@103
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 62
@62
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 48
@48
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
//push return address
@Output.initMap$ret.73
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@17
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Output.create
0;JMP
// continue after call
(Output.initMap$ret.73)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push constant 104
@104
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 3
@3
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 3
@3
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 3
@3
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 27
@27
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 55
@55
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
//push return address
@Output.initMap$ret.74
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@17
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Output.create
0;JMP
// continue after call
(Output.initMap$ret.74)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push constant 105
@105
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 14
@14
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
//push return address
@Output.initMap$ret.75
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@17
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Output.create
0;JMP
// continue after call
(Output.initMap$ret.75)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push constant 106
@106
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 48
@48
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 48
@48
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 56
@56
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 48
@48
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 48
@48
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 48
@48
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 48
@48
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
//push return address
@Output.initMap$ret.76
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@17
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Output.create
0;JMP
// continue after call
(Output.initMap$ret.76)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push constant 107
@107
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 3
@3
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 3
@3
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 3
@3
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 27
@27
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 15
@15
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 15
@15
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 27
@27
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
//push return address
@Output.initMap$ret.77
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@17
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Output.create
0;JMP
// continue after call
(Output.initMap$ret.77)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push constant 108
@108
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 14
@14
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
//push return address
@Output.initMap$ret.78
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@17
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Output.create
0;JMP
// continue after call
(Output.initMap$ret.78)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push constant 109
@109
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 29
@29
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 63
@63
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 43
@43
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 43
@43
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 43
@43
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 43
@43
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
//push return address
@Output.initMap$ret.79
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@17
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Output.create
0;JMP
// continue after call
(Output.initMap$ret.79)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push constant 110
@110
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 29
@29
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
//push return address
@Output.initMap$ret.80
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@17
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Output.create
0;JMP
// continue after call
(Output.initMap$ret.80)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push constant 111
@111
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
//push return address
@Output.initMap$ret.81
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@17
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Output.create
0;JMP
// continue after call
(Output.initMap$ret.81)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push constant 112
@112
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 31
@31
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 3
@3
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 3
@3
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
//push return address
@Output.initMap$ret.82
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@17
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Output.create
0;JMP
// continue after call
(Output.initMap$ret.82)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push constant 113
@113
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 62
@62
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 48
@48
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 48
@48
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
//push return address
@Output.initMap$ret.83
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@17
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Output.create
0;JMP
// continue after call
(Output.initMap$ret.83)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push constant 114
@114
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 29
@29
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 55
@55
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 3
@3
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 3
@3
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 7
@7
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
//push return address
@Output.initMap$ret.84
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@17
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Output.create
0;JMP
// continue after call
(Output.initMap$ret.84)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push constant 115
@115
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 6
@6
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 24
@24
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
//push return address
@Output.initMap$ret.85
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@17
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Output.create
0;JMP
// continue after call
(Output.initMap$ret.85)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push constant 116
@116
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 4
@4
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 6
@6
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 6
@6
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 15
@15
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 6
@6
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 6
@6
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 6
@6
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 54
@54
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 28
@28
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
//push return address
@Output.initMap$ret.86
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@17
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Output.create
0;JMP
// continue after call
(Output.initMap$ret.86)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push constant 117
@117
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 27
@27
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 27
@27
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 27
@27
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 27
@27
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 27
@27
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 54
@54
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
//push return address
@Output.initMap$ret.87
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@17
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Output.create
0;JMP
// continue after call
(Output.initMap$ret.87)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push constant 118
@118
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
//push return address
@Output.initMap$ret.88
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@17
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Output.create
0;JMP
// continue after call
(Output.initMap$ret.88)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push constant 119
@119
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 63
@63
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 63
@63
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 18
@18
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
//push return address
@Output.initMap$ret.89
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@17
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Output.create
0;JMP
// continue after call
(Output.initMap$ret.89)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push constant 120
@120
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
//push return address
@Output.initMap$ret.90
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@17
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Output.create
0;JMP
// continue after call
(Output.initMap$ret.90)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push constant 121
@121
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 62
@62
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 48
@48
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 24
@24
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 15
@15
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
//push return address
@Output.initMap$ret.91
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@17
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Output.create
0;JMP
// continue after call
(Output.initMap$ret.91)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push constant 122
@122
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 63
@63
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 27
@27
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 6
@6
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 63
@63
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
//push return address
@Output.initMap$ret.92
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@17
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Output.create
0;JMP
// continue after call
(Output.initMap$ret.92)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push constant 123
@123
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 56
@56
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 7
@7
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 56
@56
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
//push return address
@Output.initMap$ret.93
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@17
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Output.create
0;JMP
// continue after call
(Output.initMap$ret.93)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push constant 124
@124
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
//push return address
@Output.initMap$ret.94
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@17
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Output.create
0;JMP
// continue after call
(Output.initMap$ret.94)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push constant 125
@125
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 7
@7
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 56
@56
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 7
@7
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
//push return address
@Output.initMap$ret.95
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@17
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Output.create
0;JMP
// continue after call
(Output.initMap$ret.95)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push constant 126
@126
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 38
@38
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 45
@45
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 25
@25
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
//push return address
@Output.initMap$ret.96
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@17
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Output.create
0;JMP
// continue after call
(Output.initMap$ret.96)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// return
// save LCL in end frame variable endFrame
@LCL
D=M
@endFrame
M=D
// save return address in variable retAddress
@5
D=A
@endFrame
D=M-D
A=D
D=M
@retAddress
M=D
// reposition return value for the caller
@SP
M=M-1
@SP
A=M
D=M
@ARG
A=M
M=D
// reposition SP
@ARG
D=M+1
@SP
M=D
// recover segments
// recover THAT
@endFrame
D=M-1
A=D
D=M
@THAT
M=D
// recover THIS
@2
D=A
@endFrame
D=M-D
A=D
D=M
@THIS
M=D
// recover ARG
@3
D=A
@endFrame
D=M-D
A=D
D=M
@ARG
M=D
// recover LCL
@4
D=A
@endFrame
D=M-D
A=D
D=M
@LCL
M=D
// actual return
@retAddress
A=M
0;JMP
// function Output.create 1
(Output.create)
//push zeroes
@1
D=A
@nargs
M=D
(PUSH70)
@nargs
D=M
@NOTPUSH70
D;JEQ
D=0
@SP
A=M
M=D
@SP
M=M+1
@nargs
M=M-1
@PUSH70
0; JMP
(NOTPUSH70)
// push constant 11
@11
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Array.new 1
//push return address
@Output.create$ret.0
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@6
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Array.new
0;JMP
// continue after call
(Output.create$ret.0)
// pop local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push static 0
@Output.0
D=M
@SP
A=M
M=D
@SP
M=M+1
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// push local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// pop pointer 1
@SP
M=M-1
@SP
A=M
D=M
@R4
M=D
// push temp 0
@R5
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop that 0
@0
D=A
@address
M=D
@THAT
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// push argument 1
@1
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// pop pointer 1
@SP
M=M-1
@SP
A=M
D=M
@R4
M=D
// push temp 0
@R5
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop that 0
@0
D=A
@address
M=D
@THAT
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// push argument 2
@2
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// pop pointer 1
@SP
M=M-1
@SP
A=M
D=M
@R4
M=D
// push temp 0
@R5
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop that 0
@0
D=A
@address
M=D
@THAT
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 2
@2
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// push argument 3
@3
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// pop pointer 1
@SP
M=M-1
@SP
A=M
D=M
@R4
M=D
// push temp 0
@R5
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop that 0
@0
D=A
@address
M=D
@THAT
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 3
@3
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// push argument 4
@4
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// pop pointer 1
@SP
M=M-1
@SP
A=M
D=M
@R4
M=D
// push temp 0
@R5
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop that 0
@0
D=A
@address
M=D
@THAT
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 4
@4
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// push argument 5
@5
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// pop pointer 1
@SP
M=M-1
@SP
A=M
D=M
@R4
M=D
// push temp 0
@R5
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop that 0
@0
D=A
@address
M=D
@THAT
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 5
@5
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// push argument 6
@6
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// pop pointer 1
@SP
M=M-1
@SP
A=M
D=M
@R4
M=D
// push temp 0
@R5
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop that 0
@0
D=A
@address
M=D
@THAT
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 6
@6
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// push argument 7
@7
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// pop pointer 1
@SP
M=M-1
@SP
A=M
D=M
@R4
M=D
// push temp 0
@R5
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop that 0
@0
D=A
@address
M=D
@THAT
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 7
@7
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// push argument 8
@8
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// pop pointer 1
@SP
M=M-1
@SP
A=M
D=M
@R4
M=D
// push temp 0
@R5
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop that 0
@0
D=A
@address
M=D
@THAT
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 8
@8
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// push argument 9
@9
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// pop pointer 1
@SP
M=M-1
@SP
A=M
D=M
@R4
M=D
// push temp 0
@R5
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop that 0
@0
D=A
@address
M=D
@THAT
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 9
@9
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// push argument 10
@10
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// pop pointer 1
@SP
M=M-1
@SP
A=M
D=M
@R4
M=D
// push temp 0
@R5
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop that 0
@0
D=A
@address
M=D
@THAT
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 10
@10
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// push argument 11
@11
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// pop pointer 1
@SP
M=M-1
@SP
A=M
D=M
@R4
M=D
// push temp 0
@R5
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop that 0
@0
D=A
@address
M=D
@THAT
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// return
// save LCL in end frame variable endFrame
@LCL
D=M
@endFrame
M=D
// save return address in variable retAddress
@5
D=A
@endFrame
D=M-D
A=D
D=M
@retAddress
M=D
// reposition return value for the caller
@SP
M=M-1
@SP
A=M
D=M
@ARG
A=M
M=D
// reposition SP
@ARG
D=M+1
@SP
M=D
// recover segments
// recover THAT
@endFrame
D=M-1
A=D
D=M
@THAT
M=D
// recover THIS
@2
D=A
@endFrame
D=M-D
A=D
D=M
@THIS
M=D
// recover ARG
@3
D=A
@endFrame
D=M-D
A=D
D=M
@ARG
M=D
// recover LCL
@4
D=A
@endFrame
D=M-D
A=D
D=M
@LCL
M=D
// actual return
@retAddress
A=M
0;JMP
// function Output.getMap 0
(Output.getMap)
//push zeroes
@0
D=A
@nargs
M=D
(PUSH71)
@nargs
D=M
@NOTPUSH71
D;JEQ
D=0
@SP
A=M
M=D
@SP
M=M+1
@nargs
M=M-1
@PUSH71
0; JMP
(NOTPUSH71)
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 32
@32
D=A
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@LESS72
D;JLT
@NOTLESS72
0;JMP
(LESS72)
D=-1
@CONTINUE72
0;JMP
(NOTLESS72)
D=0
@CONTINUE72
0;JMP
(CONTINUE72)
@SP
A=M
M=D
@SP
M=M+1
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 126
@126
D=A
@SP
A=M
M=D
@SP
M=M+1
// gt
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@GREATER73
D;JGT
@NOTGREATER73
0;JMP
(GREATER73)
D=-1
@CONTINUE73
0;JMP
(NOTGREATER73)
D=0
@CONTINUE73
0;JMP
(CONTINUE73)
@SP
A=M
M=D
@SP
M=M+1
// or
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D|M
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// if-goto command
@SP
M=M-1
@SP
A=M
D=M
@Output.getMap$IF1_0
D; JNE
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// goto command
@Output.getMap$IF2_0
0; JMP
// label command
(Output.getMap$IF1_0)
// label command
(Output.getMap$IF2_0)
// push static 0
@Output.0
D=M
@SP
A=M
M=D
@SP
M=M+1
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// pop pointer 1
@SP
M=M-1
@SP
A=M
D=M
@R4
M=D
// push that 0
@0
D=A
@address
M=D
@THAT
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// return
// save LCL in end frame variable endFrame
@LCL
D=M
@endFrame
M=D
// save return address in variable retAddress
@5
D=A
@endFrame
D=M-D
A=D
D=M
@retAddress
M=D
// reposition return value for the caller
@SP
M=M-1
@SP
A=M
D=M
@ARG
A=M
M=D
// reposition SP
@ARG
D=M+1
@SP
M=D
// recover segments
// recover THAT
@endFrame
D=M-1
A=D
D=M
@THAT
M=D
// recover THIS
@2
D=A
@endFrame
D=M-D
A=D
D=M
@THIS
M=D
// recover ARG
@3
D=A
@endFrame
D=M-D
A=D
D=M
@ARG
M=D
// recover LCL
@4
D=A
@endFrame
D=M-D
A=D
D=M
@LCL
M=D
// actual return
@retAddress
A=M
0;JMP
// function Output.erase 0
(Output.erase)
//push zeroes
@0
D=A
@nargs
M=D
(PUSH74)
@nargs
D=M
@NOTPUSH74
D;JEQ
D=0
@SP
A=M
M=D
@SP
M=M+1
@nargs
M=M-1
@PUSH74
0; JMP
(NOTPUSH74)
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Screen.setColor 1
//push return address
@Output.erase$ret.0
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@6
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Screen.setColor
0;JMP
// continue after call
(Output.erase$ret.0)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push constant 32
@32
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.getMap 1
//push return address
@Output.erase$ret.1
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@6
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Output.getMap
0;JMP
// continue after call
(Output.erase$ret.1)
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.display 2
//push return address
@Output.erase$ret.2
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@7
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Output.display
0;JMP
// continue after call
(Output.erase$ret.2)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// neg
@SP
M=M-1
@SP
A=M
D=M
D=-D
@SP
A=M
M=D
@SP
M=M+1
// call Screen.setColor 1
//push return address
@Output.erase$ret.3
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@6
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Screen.setColor
0;JMP
// continue after call
(Output.erase$ret.3)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// return
// save LCL in end frame variable endFrame
@LCL
D=M
@endFrame
M=D
// save return address in variable retAddress
@5
D=A
@endFrame
D=M-D
A=D
D=M
@retAddress
M=D
// reposition return value for the caller
@SP
M=M-1
@SP
A=M
D=M
@ARG
A=M
M=D
// reposition SP
@ARG
D=M+1
@SP
M=D
// recover segments
// recover THAT
@endFrame
D=M-1
A=D
D=M
@THAT
M=D
// recover THIS
@2
D=A
@endFrame
D=M-D
A=D
D=M
@THIS
M=D
// recover ARG
@3
D=A
@endFrame
D=M-D
A=D
D=M
@ARG
M=D
// recover LCL
@4
D=A
@endFrame
D=M-D
A=D
D=M
@LCL
M=D
// actual return
@retAddress
A=M
0;JMP
// function Output.moveCursor 0
(Output.moveCursor)
//push zeroes
@0
D=A
@nargs
M=D
(PUSH75)
@nargs
D=M
@NOTPUSH75
D;JEQ
D=0
@SP
A=M
M=D
@SP
M=M+1
@nargs
M=M-1
@PUSH75
0; JMP
(NOTPUSH75)
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@LESS76
D;JLT
@NOTLESS76
0;JMP
(LESS76)
D=-1
@CONTINUE76
0;JMP
(NOTLESS76)
D=0
@CONTINUE76
0;JMP
(CONTINUE76)
@SP
A=M
M=D
@SP
M=M+1
// push argument 1
@1
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@LESS77
D;JLT
@NOTLESS77
0;JMP
(LESS77)
D=-1
@CONTINUE77
0;JMP
(NOTLESS77)
D=0
@CONTINUE77
0;JMP
(CONTINUE77)
@SP
A=M
M=D
@SP
M=M+1
// or
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D|M
@SP
A=M
M=D
@SP
M=M+1
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 22
@22
D=A
@SP
A=M
M=D
@SP
M=M+1
// gt
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@GREATER78
D;JGT
@NOTGREATER78
0;JMP
(GREATER78)
D=-1
@CONTINUE78
0;JMP
(NOTGREATER78)
D=0
@CONTINUE78
0;JMP
(CONTINUE78)
@SP
A=M
M=D
@SP
M=M+1
// or
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D|M
@SP
A=M
M=D
@SP
M=M+1
// push argument 1
@1
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 63
@63
D=A
@SP
A=M
M=D
@SP
M=M+1
// gt
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@GREATER79
D;JGT
@NOTGREATER79
0;JMP
(GREATER79)
D=-1
@CONTINUE79
0;JMP
(NOTGREATER79)
D=0
@CONTINUE79
0;JMP
(CONTINUE79)
@SP
A=M
M=D
@SP
M=M+1
// or
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D|M
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// if-goto command
@SP
M=M-1
@SP
A=M
D=M
@Output.moveCursor$IF1_0
D; JNE
// push constant 20
@20
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Sys.error 1
//push return address
@Output.moveCursor$ret.0
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@6
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Sys.error
0;JMP
// continue after call
(Output.moveCursor$ret.0)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// goto command
@Output.moveCursor$IF2_0
0; JMP
// label command
(Output.moveCursor$IF1_0)
// label command
(Output.moveCursor$IF2_0)
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop static 1
@SP
M=M-1
@SP
A=M
D=M
@Output.1
M=D
// push argument 1
@1
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop static 2
@SP
M=M-1
@SP
A=M
D=M
@Output.2
M=D
// call Output.erase 0
//push return address
@Output.moveCursor$ret.1
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@5
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Output.erase
0;JMP
// continue after call
(Output.moveCursor$ret.1)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// return
// save LCL in end frame variable endFrame
@LCL
D=M
@endFrame
M=D
// save return address in variable retAddress
@5
D=A
@endFrame
D=M-D
A=D
D=M
@retAddress
M=D
// reposition return value for the caller
@SP
M=M-1
@SP
A=M
D=M
@ARG
A=M
M=D
// reposition SP
@ARG
D=M+1
@SP
M=D
// recover segments
// recover THAT
@endFrame
D=M-1
A=D
D=M
@THAT
M=D
// recover THIS
@2
D=A
@endFrame
D=M-D
A=D
D=M
@THIS
M=D
// recover ARG
@3
D=A
@endFrame
D=M-D
A=D
D=M
@ARG
M=D
// recover LCL
@4
D=A
@endFrame
D=M-D
A=D
D=M
@LCL
M=D
// actual return
@retAddress
A=M
0;JMP
// function Output.displayLineInside 5
(Output.displayLineInside)
//push zeroes
@5
D=A
@nargs
M=D
(PUSH80)
@nargs
D=M
@NOTPUSH80
D;JEQ
D=0
@SP
A=M
M=D
@SP
M=M+1
@nargs
M=M-1
@PUSH80
0; JMP
(NOTPUSH80)
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push argument 1
@1
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// pop pointer 1
@SP
M=M-1
@SP
A=M
D=M
@R4
M=D
// push that 0
@0
D=A
@address
M=D
@THAT
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop local 1
@1
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// label command
(Output.displayLineInside$WHILE1_0)
// push local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 8
@8
D=A
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@LESS81
D;JLT
@NOTLESS81
0;JMP
(LESS81)
D=-1
@CONTINUE81
0;JMP
(NOTLESS81)
D=0
@CONTINUE81
0;JMP
(CONTINUE81)
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// if-goto command
@SP
M=M-1
@SP
A=M
D=M
@Output.displayLineInside$WHILE2_0
D; JNE
// push local 1
@1
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 1
@1
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 2
@2
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Math.divide 2
//push return address
@Output.displayLineInside$ret.0
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@7
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Math.divide
0;JMP
// continue after call
(Output.displayLineInside$ret.0)
// push constant 2
@2
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Math.multiply 2
//push return address
@Output.displayLineInside$ret.1
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@7
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Math.multiply
0;JMP
// continue after call
(Output.displayLineInside$ret.1)
// sub
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@SP
A=M
M=D
@SP
M=M+1
// pop local 2
@2
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push local 2
@2
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push argument 2
@2
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// eq
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@EQUAL82
D;JEQ
@NOTEQUAL82
0;JMP
(EQUAL82)
D=-1
@CONTINUE82
0;JMP
(NOTEQUAL82)
D=0
@CONTINUE82
0;JMP
(CONTINUE82)
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// if-goto command
@SP
M=M-1
@SP
A=M
D=M
@Output.displayLineInside$IF1_1
D; JNE
// push static 1
@Output.1
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 11
@11
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Math.multiply 2
//push return address
@Output.displayLineInside$ret.2
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@7
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Math.multiply
0;JMP
// continue after call
(Output.displayLineInside$ret.2)
// push argument 1
@1
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// pop local 4
@4
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push static 2
@Output.2
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 8
@8
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Math.multiply 2
//push return address
@Output.displayLineInside$ret.3
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@7
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Math.multiply
0;JMP
// continue after call
(Output.displayLineInside$ret.3)
// push local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// pop local 3
@3
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push local 3
@3
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 4
@4
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Screen.drawPixel 2
//push return address
@Output.displayLineInside$ret.4
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@7
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Screen.drawPixel
0;JMP
// continue after call
(Output.displayLineInside$ret.4)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// goto command
@Output.displayLineInside$IF2_1
0; JMP
// label command
(Output.displayLineInside$IF1_1)
// label command
(Output.displayLineInside$IF2_1)
// push local 1
@1
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 2
@2
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Math.divide 2
//push return address
@Output.displayLineInside$ret.5
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@7
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Math.divide
0;JMP
// continue after call
(Output.displayLineInside$ret.5)
// pop local 1
@1
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// pop local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// goto command
@Output.displayLineInside$WHILE1_0
0; JMP
// label command
(Output.displayLineInside$WHILE2_0)
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// return
// save LCL in end frame variable endFrame
@LCL
D=M
@endFrame
M=D
// save return address in variable retAddress
@5
D=A
@endFrame
D=M-D
A=D
D=M
@retAddress
M=D
// reposition return value for the caller
@SP
M=M-1
@SP
A=M
D=M
@ARG
A=M
M=D
// reposition SP
@ARG
D=M+1
@SP
M=D
// recover segments
// recover THAT
@endFrame
D=M-1
A=D
D=M
@THAT
M=D
// recover THIS
@2
D=A
@endFrame
D=M-D
A=D
D=M
@THIS
M=D
// recover ARG
@3
D=A
@endFrame
D=M-D
A=D
D=M
@ARG
M=D
// recover LCL
@4
D=A
@endFrame
D=M-D
A=D
D=M
@LCL
M=D
// actual return
@retAddress
A=M
0;JMP
// function Output.display 1
(Output.display)
//push zeroes
@1
D=A
@nargs
M=D
(PUSH83)
@nargs
D=M
@NOTPUSH83
D;JEQ
D=0
@SP
A=M
M=D
@SP
M=M+1
@nargs
M=M-1
@PUSH83
0; JMP
(NOTPUSH83)
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// label command
(Output.display$WHILE1_0)
// push local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 11
@11
D=A
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@LESS84
D;JLT
@NOTLESS84
0;JMP
(LESS84)
D=-1
@CONTINUE84
0;JMP
(NOTLESS84)
D=0
@CONTINUE84
0;JMP
(CONTINUE84)
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// if-goto command
@SP
M=M-1
@SP
A=M
D=M
@Output.display$WHILE2_0
D; JNE
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push argument 1
@1
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Output.displayLineInside 3
//push return address
@Output.display$ret.0
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@8
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Output.displayLineInside
0;JMP
// continue after call
(Output.display$ret.0)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// pop local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// goto command
@Output.display$WHILE1_0
0; JMP
// label command
(Output.display$WHILE2_0)
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// return
// save LCL in end frame variable endFrame
@LCL
D=M
@endFrame
M=D
// save return address in variable retAddress
@5
D=A
@endFrame
D=M-D
A=D
D=M
@retAddress
M=D
// reposition return value for the caller
@SP
M=M-1
@SP
A=M
D=M
@ARG
A=M
M=D
// reposition SP
@ARG
D=M+1
@SP
M=D
// recover segments
// recover THAT
@endFrame
D=M-1
A=D
D=M
@THAT
M=D
// recover THIS
@2
D=A
@endFrame
D=M-D
A=D
D=M
@THIS
M=D
// recover ARG
@3
D=A
@endFrame
D=M-D
A=D
D=M
@ARG
M=D
// recover LCL
@4
D=A
@endFrame
D=M-D
A=D
D=M
@LCL
M=D
// actual return
@retAddress
A=M
0;JMP
// function Output.shiftCursorRight 0
(Output.shiftCursorRight)
//push zeroes
@0
D=A
@nargs
M=D
(PUSH85)
@nargs
D=M
@NOTPUSH85
D;JEQ
D=0
@SP
A=M
M=D
@SP
M=M+1
@nargs
M=M-1
@PUSH85
0; JMP
(NOTPUSH85)
// push static 2
@Output.2
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 63
@63
D=A
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@LESS86
D;JLT
@NOTLESS86
0;JMP
(LESS86)
D=-1
@CONTINUE86
0;JMP
(NOTLESS86)
D=0
@CONTINUE86
0;JMP
(CONTINUE86)
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// if-goto command
@SP
M=M-1
@SP
A=M
D=M
@Output.shiftCursorRight$IF1_0
D; JNE
// push static 1
@Output.1
D=M
@SP
A=M
M=D
@SP
M=M+1
// push static 2
@Output.2
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// call Output.moveCursor 2
//push return address
@Output.shiftCursorRight$ret.0
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@7
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Output.moveCursor
0;JMP
// continue after call
(Output.shiftCursorRight$ret.0)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// goto command
@Output.shiftCursorRight$IF2_0
0; JMP
// label command
(Output.shiftCursorRight$IF1_0)
// call Output.println 0
//push return address
@Output.shiftCursorRight$ret.1
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@5
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Output.println
0;JMP
// continue after call
(Output.shiftCursorRight$ret.1)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// label command
(Output.shiftCursorRight$IF2_0)
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// return
// save LCL in end frame variable endFrame
@LCL
D=M
@endFrame
M=D
// save return address in variable retAddress
@5
D=A
@endFrame
D=M-D
A=D
D=M
@retAddress
M=D
// reposition return value for the caller
@SP
M=M-1
@SP
A=M
D=M
@ARG
A=M
M=D
// reposition SP
@ARG
D=M+1
@SP
M=D
// recover segments
// recover THAT
@endFrame
D=M-1
A=D
D=M
@THAT
M=D
// recover THIS
@2
D=A
@endFrame
D=M-D
A=D
D=M
@THIS
M=D
// recover ARG
@3
D=A
@endFrame
D=M-D
A=D
D=M
@ARG
M=D
// recover LCL
@4
D=A
@endFrame
D=M-D
A=D
D=M
@LCL
M=D
// actual return
@retAddress
A=M
0;JMP
// function Output.printChar 1
(Output.printChar)
//push zeroes
@1
D=A
@nargs
M=D
(PUSH87)
@nargs
D=M
@NOTPUSH87
D;JEQ
D=0
@SP
A=M
M=D
@SP
M=M+1
@nargs
M=M-1
@PUSH87
0; JMP
(NOTPUSH87)
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Output.getMap 1
//push return address
@Output.printChar$ret.0
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@6
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Output.getMap
0;JMP
// continue after call
(Output.printChar$ret.0)
// pop local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.display 2
//push return address
@Output.printChar$ret.1
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@7
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Output.display
0;JMP
// continue after call
(Output.printChar$ret.1)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// call Output.shiftCursorRight 0
//push return address
@Output.printChar$ret.2
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@5
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Output.shiftCursorRight
0;JMP
// continue after call
(Output.printChar$ret.2)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// return
// save LCL in end frame variable endFrame
@LCL
D=M
@endFrame
M=D
// save return address in variable retAddress
@5
D=A
@endFrame
D=M-D
A=D
D=M
@retAddress
M=D
// reposition return value for the caller
@SP
M=M-1
@SP
A=M
D=M
@ARG
A=M
M=D
// reposition SP
@ARG
D=M+1
@SP
M=D
// recover segments
// recover THAT
@endFrame
D=M-1
A=D
D=M
@THAT
M=D
// recover THIS
@2
D=A
@endFrame
D=M-D
A=D
D=M
@THIS
M=D
// recover ARG
@3
D=A
@endFrame
D=M-D
A=D
D=M
@ARG
M=D
// recover LCL
@4
D=A
@endFrame
D=M-D
A=D
D=M
@LCL
M=D
// actual return
@retAddress
A=M
0;JMP
// function Output.printString 1
(Output.printString)
//push zeroes
@1
D=A
@nargs
M=D
(PUSH88)
@nargs
D=M
@NOTPUSH88
D;JEQ
D=0
@SP
A=M
M=D
@SP
M=M+1
@nargs
M=M-1
@PUSH88
0; JMP
(NOTPUSH88)
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// label command
(Output.printString$WHILE1_0)
// push local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// call String.length 1
//push return address
@Output.printString$ret.0
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@6
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@String.length
0;JMP
// continue after call
(Output.printString$ret.0)
// lt
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@LESS89
D;JLT
@NOTLESS89
0;JMP
(LESS89)
D=-1
@CONTINUE89
0;JMP
(NOTLESS89)
D=0
@CONTINUE89
0;JMP
(CONTINUE89)
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// if-goto command
@SP
M=M-1
@SP
A=M
D=M
@Output.printString$WHILE2_0
D; JNE
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// call String.charAt 2
//push return address
@Output.printString$ret.1
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@7
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@String.charAt
0;JMP
// continue after call
(Output.printString$ret.1)
// call Output.printChar 1
//push return address
@Output.printString$ret.2
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@6
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Output.printChar
0;JMP
// continue after call
(Output.printString$ret.2)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// pop local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// goto command
@Output.printString$WHILE1_0
0; JMP
// label command
(Output.printString$WHILE2_0)
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// return
// save LCL in end frame variable endFrame
@LCL
D=M
@endFrame
M=D
// save return address in variable retAddress
@5
D=A
@endFrame
D=M-D
A=D
D=M
@retAddress
M=D
// reposition return value for the caller
@SP
M=M-1
@SP
A=M
D=M
@ARG
A=M
M=D
// reposition SP
@ARG
D=M+1
@SP
M=D
// recover segments
// recover THAT
@endFrame
D=M-1
A=D
D=M
@THAT
M=D
// recover THIS
@2
D=A
@endFrame
D=M-D
A=D
D=M
@THIS
M=D
// recover ARG
@3
D=A
@endFrame
D=M-D
A=D
D=M
@ARG
M=D
// recover LCL
@4
D=A
@endFrame
D=M-D
A=D
D=M
@LCL
M=D
// actual return
@retAddress
A=M
0;JMP
// function Output.fillDigitArray 2
(Output.fillDigitArray)
//push zeroes
@2
D=A
@nargs
M=D
(PUSH90)
@nargs
D=M
@NOTPUSH90
D;JEQ
D=0
@SP
A=M
M=D
@SP
M=M+1
@nargs
M=M-1
@PUSH90
0; JMP
(NOTPUSH90)
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// label command
(Output.fillDigitArray$WHILE1_0)
// push local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 5
@5
D=A
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@LESS91
D;JLT
@NOTLESS91
0;JMP
(LESS91)
D=-1
@CONTINUE91
0;JMP
(NOTLESS91)
D=0
@CONTINUE91
0;JMP
(CONTINUE91)
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// if-goto command
@SP
M=M-1
@SP
A=M
D=M
@Output.fillDigitArray$WHILE2_0
D; JNE
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// pop pointer 1
@SP
M=M-1
@SP
A=M
D=M
@R4
M=D
// push temp 0
@R5
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop that 0
@0
D=A
@address
M=D
@THAT
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// pop local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// goto command
@Output.fillDigitArray$WHILE1_0
0; JMP
// label command
(Output.fillDigitArray$WHILE2_0)
// push constant 4
@4
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// label command
(Output.fillDigitArray$WHILE1_2)
// push argument 1
@1
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// eq
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@EQUAL92
D;JEQ
@NOTEQUAL92
0;JMP
(EQUAL92)
D=-1
@CONTINUE92
0;JMP
(NOTEQUAL92)
D=0
@CONTINUE92
0;JMP
(CONTINUE92)
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// if-goto command
@SP
M=M-1
@SP
A=M
D=M
@Output.fillDigitArray$WHILE2_2
D; JNE
// push argument 1
@1
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push argument 1
@1
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 10
@10
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Math.divide 2
//push return address
@Output.fillDigitArray$ret.0
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@7
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Math.divide
0;JMP
// continue after call
(Output.fillDigitArray$ret.0)
// push constant 10
@10
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Math.multiply 2
//push return address
@Output.fillDigitArray$ret.1
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@7
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Math.multiply
0;JMP
// continue after call
(Output.fillDigitArray$ret.1)
// sub
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@SP
A=M
M=D
@SP
M=M+1
// pop local 1
@1
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// push local 1
@1
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// pop pointer 1
@SP
M=M-1
@SP
A=M
D=M
@R4
M=D
// push temp 0
@R5
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop that 0
@0
D=A
@address
M=D
@THAT
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push argument 1
@1
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 10
@10
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Math.divide 2
//push return address
@Output.fillDigitArray$ret.2
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@7
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Math.divide
0;JMP
// continue after call
(Output.fillDigitArray$ret.2)
// pop argument 1
@1
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// sub
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@SP
A=M
M=D
@SP
M=M+1
// pop local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// goto command
@Output.fillDigitArray$WHILE1_2
0; JMP
// label command
(Output.fillDigitArray$WHILE2_2)
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// return
// save LCL in end frame variable endFrame
@LCL
D=M
@endFrame
M=D
// save return address in variable retAddress
@5
D=A
@endFrame
D=M-D
A=D
D=M
@retAddress
M=D
// reposition return value for the caller
@SP
M=M-1
@SP
A=M
D=M
@ARG
A=M
M=D
// reposition SP
@ARG
D=M+1
@SP
M=D
// recover segments
// recover THAT
@endFrame
D=M-1
A=D
D=M
@THAT
M=D
// recover THIS
@2
D=A
@endFrame
D=M-D
A=D
D=M
@THIS
M=D
// recover ARG
@3
D=A
@endFrame
D=M-D
A=D
D=M
@ARG
M=D
// recover LCL
@4
D=A
@endFrame
D=M-D
A=D
D=M
@LCL
M=D
// actual return
@retAddress
A=M
0;JMP
// function Output.skipLeadingZeroes 1
(Output.skipLeadingZeroes)
//push zeroes
@1
D=A
@nargs
M=D
(PUSH93)
@nargs
D=M
@NOTPUSH93
D;JEQ
D=0
@SP
A=M
M=D
@SP
M=M+1
@nargs
M=M-1
@PUSH93
0; JMP
(NOTPUSH93)
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// label command
(Output.skipLeadingZeroes$WHILE1_0)
// push local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 5
@5
D=A
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@LESS94
D;JLT
@NOTLESS94
0;JMP
(LESS94)
D=-1
@CONTINUE94
0;JMP
(NOTLESS94)
D=0
@CONTINUE94
0;JMP
(CONTINUE94)
@SP
A=M
M=D
@SP
M=M+1
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// pop pointer 1
@SP
M=M-1
@SP
A=M
D=M
@R4
M=D
// push that 0
@0
D=A
@address
M=D
@THAT
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// eq
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@EQUAL95
D;JEQ
@NOTEQUAL95
0;JMP
(EQUAL95)
D=-1
@CONTINUE95
0;JMP
(NOTEQUAL95)
D=0
@CONTINUE95
0;JMP
(CONTINUE95)
@SP
A=M
M=D
@SP
M=M+1
// and
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D&M
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// if-goto command
@SP
M=M-1
@SP
A=M
D=M
@Output.skipLeadingZeroes$WHILE2_0
D; JNE
// push local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// pop local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// goto command
@Output.skipLeadingZeroes$WHILE1_0
0; JMP
// label command
(Output.skipLeadingZeroes$WHILE2_0)
// push local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// return
// save LCL in end frame variable endFrame
@LCL
D=M
@endFrame
M=D
// save return address in variable retAddress
@5
D=A
@endFrame
D=M-D
A=D
D=M
@retAddress
M=D
// reposition return value for the caller
@SP
M=M-1
@SP
A=M
D=M
@ARG
A=M
M=D
// reposition SP
@ARG
D=M+1
@SP
M=D
// recover segments
// recover THAT
@endFrame
D=M-1
A=D
D=M
@THAT
M=D
// recover THIS
@2
D=A
@endFrame
D=M-D
A=D
D=M
@THIS
M=D
// recover ARG
@3
D=A
@endFrame
D=M-D
A=D
D=M
@ARG
M=D
// recover LCL
@4
D=A
@endFrame
D=M-D
A=D
D=M
@LCL
M=D
// actual return
@retAddress
A=M
0;JMP
// function Output.printAbsoluteInt 0
(Output.printAbsoluteInt)
//push zeroes
@0
D=A
@nargs
M=D
(PUSH96)
@nargs
D=M
@NOTPUSH96
D;JEQ
D=0
@SP
A=M
M=D
@SP
M=M+1
@nargs
M=M-1
@PUSH96
0; JMP
(NOTPUSH96)
// push argument 1
@1
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 5
@5
D=A
@SP
A=M
M=D
@SP
M=M+1
// eq
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@EQUAL97
D;JEQ
@NOTEQUAL97
0;JMP
(EQUAL97)
D=-1
@CONTINUE97
0;JMP
(NOTEQUAL97)
D=0
@CONTINUE97
0;JMP
(CONTINUE97)
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// if-goto command
@SP
M=M-1
@SP
A=M
D=M
@Output.printAbsoluteInt$IF1_0
D; JNE
// push constant 48
@48
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.printChar 1
//push return address
@Output.printAbsoluteInt$ret.0
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@6
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Output.printChar
0;JMP
// continue after call
(Output.printAbsoluteInt$ret.0)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// goto command
@Output.printAbsoluteInt$IF2_0
0; JMP
// label command
(Output.printAbsoluteInt$IF1_0)
// label command
(Output.printAbsoluteInt$WHILE1_1)
// push argument 1
@1
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 5
@5
D=A
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@LESS98
D;JLT
@NOTLESS98
0;JMP
(LESS98)
D=-1
@CONTINUE98
0;JMP
(NOTLESS98)
D=0
@CONTINUE98
0;JMP
(CONTINUE98)
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// if-goto command
@SP
M=M-1
@SP
A=M
D=M
@Output.printAbsoluteInt$WHILE2_1
D; JNE
// push constant 48
@48
D=A
@SP
A=M
M=D
@SP
M=M+1
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push argument 1
@1
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// pop pointer 1
@SP
M=M-1
@SP
A=M
D=M
@R4
M=D
// push that 0
@0
D=A
@address
M=D
@THAT
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// call Output.printChar 1
//push return address
@Output.printAbsoluteInt$ret.1
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@6
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Output.printChar
0;JMP
// continue after call
(Output.printAbsoluteInt$ret.1)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push argument 1
@1
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// pop argument 1
@1
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// goto command
@Output.printAbsoluteInt$WHILE1_1
0; JMP
// label command
(Output.printAbsoluteInt$WHILE2_1)
// label command
(Output.printAbsoluteInt$IF2_0)
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// return
// save LCL in end frame variable endFrame
@LCL
D=M
@endFrame
M=D
// save return address in variable retAddress
@5
D=A
@endFrame
D=M-D
A=D
D=M
@retAddress
M=D
// reposition return value for the caller
@SP
M=M-1
@SP
A=M
D=M
@ARG
A=M
M=D
// reposition SP
@ARG
D=M+1
@SP
M=D
// recover segments
// recover THAT
@endFrame
D=M-1
A=D
D=M
@THAT
M=D
// recover THIS
@2
D=A
@endFrame
D=M-D
A=D
D=M
@THIS
M=D
// recover ARG
@3
D=A
@endFrame
D=M-D
A=D
D=M
@ARG
M=D
// recover LCL
@4
D=A
@endFrame
D=M-D
A=D
D=M
@LCL
M=D
// actual return
@retAddress
A=M
0;JMP
// function Output.printInt 3
(Output.printInt)
//push zeroes
@3
D=A
@nargs
M=D
(PUSH99)
@nargs
D=M
@NOTPUSH99
D;JEQ
D=0
@SP
A=M
M=D
@SP
M=M+1
@nargs
M=M-1
@PUSH99
0; JMP
(NOTPUSH99)
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@LESS100
D;JLT
@NOTLESS100
0;JMP
(LESS100)
D=-1
@CONTINUE100
0;JMP
(NOTLESS100)
D=0
@CONTINUE100
0;JMP
(CONTINUE100)
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// if-goto command
@SP
M=M-1
@SP
A=M
D=M
@Output.printInt$IF1_0
D; JNE
// push constant 45
@45
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.printChar 1
//push return address
@Output.printInt$ret.0
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@6
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Output.printChar
0;JMP
// continue after call
(Output.printInt$ret.0)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// goto command
@Output.printInt$IF2_0
0; JMP
// label command
(Output.printInt$IF1_0)
// label command
(Output.printInt$IF2_0)
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Math.abs 1
//push return address
@Output.printInt$ret.1
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@6
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Math.abs
0;JMP
// continue after call
(Output.printInt$ret.1)
// pop local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push constant 5
@5
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Array.new 1
//push return address
@Output.printInt$ret.2
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@6
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Array.new
0;JMP
// continue after call
(Output.printInt$ret.2)
// pop local 2
@2
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push local 2
@2
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Output.fillDigitArray 2
//push return address
@Output.printInt$ret.3
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@7
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Output.fillDigitArray
0;JMP
// continue after call
(Output.printInt$ret.3)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push local 2
@2
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Output.skipLeadingZeroes 1
//push return address
@Output.printInt$ret.4
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@6
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Output.skipLeadingZeroes
0;JMP
// continue after call
(Output.printInt$ret.4)
// pop local 1
@1
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push local 2
@2
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 1
@1
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Output.printAbsoluteInt 2
//push return address
@Output.printInt$ret.5
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@7
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Output.printAbsoluteInt
0;JMP
// continue after call
(Output.printInt$ret.5)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// return
// save LCL in end frame variable endFrame
@LCL
D=M
@endFrame
M=D
// save return address in variable retAddress
@5
D=A
@endFrame
D=M-D
A=D
D=M
@retAddress
M=D
// reposition return value for the caller
@SP
M=M-1
@SP
A=M
D=M
@ARG
A=M
M=D
// reposition SP
@ARG
D=M+1
@SP
M=D
// recover segments
// recover THAT
@endFrame
D=M-1
A=D
D=M
@THAT
M=D
// recover THIS
@2
D=A
@endFrame
D=M-D
A=D
D=M
@THIS
M=D
// recover ARG
@3
D=A
@endFrame
D=M-D
A=D
D=M
@ARG
M=D
// recover LCL
@4
D=A
@endFrame
D=M-D
A=D
D=M
@LCL
M=D
// actual return
@retAddress
A=M
0;JMP
// function Output.println 0
(Output.println)
//push zeroes
@0
D=A
@nargs
M=D
(PUSH101)
@nargs
D=M
@NOTPUSH101
D;JEQ
D=0
@SP
A=M
M=D
@SP
M=M+1
@nargs
M=M-1
@PUSH101
0; JMP
(NOTPUSH101)
// push static 1
@Output.1
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 22
@22
D=A
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@LESS102
D;JLT
@NOTLESS102
0;JMP
(LESS102)
D=-1
@CONTINUE102
0;JMP
(NOTLESS102)
D=0
@CONTINUE102
0;JMP
(CONTINUE102)
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// if-goto command
@SP
M=M-1
@SP
A=M
D=M
@Output.println$IF1_0
D; JNE
// push static 1
@Output.1
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.moveCursor 2
//push return address
@Output.println$ret.0
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@7
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Output.moveCursor
0;JMP
// continue after call
(Output.println$ret.0)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// goto command
@Output.println$IF2_0
0; JMP
// label command
(Output.println$IF1_0)
// label command
(Output.println$IF2_0)
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// return
// save LCL in end frame variable endFrame
@LCL
D=M
@endFrame
M=D
// save return address in variable retAddress
@5
D=A
@endFrame
D=M-D
A=D
D=M
@retAddress
M=D
// reposition return value for the caller
@SP
M=M-1
@SP
A=M
D=M
@ARG
A=M
M=D
// reposition SP
@ARG
D=M+1
@SP
M=D
// recover segments
// recover THAT
@endFrame
D=M-1
A=D
D=M
@THAT
M=D
// recover THIS
@2
D=A
@endFrame
D=M-D
A=D
D=M
@THIS
M=D
// recover ARG
@3
D=A
@endFrame
D=M-D
A=D
D=M
@ARG
M=D
// recover LCL
@4
D=A
@endFrame
D=M-D
A=D
D=M
@LCL
M=D
// actual return
@retAddress
A=M
0;JMP
// function Output.backSpace 0
(Output.backSpace)
//push zeroes
@0
D=A
@nargs
M=D
(PUSH103)
@nargs
D=M
@NOTPUSH103
D;JEQ
D=0
@SP
A=M
M=D
@SP
M=M+1
@nargs
M=M-1
@PUSH103
0; JMP
(NOTPUSH103)
// push static 2
@Output.2
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// gt
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@GREATER104
D;JGT
@NOTGREATER104
0;JMP
(GREATER104)
D=-1
@CONTINUE104
0;JMP
(NOTGREATER104)
D=0
@CONTINUE104
0;JMP
(CONTINUE104)
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// if-goto command
@SP
M=M-1
@SP
A=M
D=M
@Output.backSpace$IF1_0
D; JNE
// push static 1
@Output.1
D=M
@SP
A=M
M=D
@SP
M=M+1
// push static 2
@Output.2
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// sub
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@SP
A=M
M=D
@SP
M=M+1
// call Output.moveCursor 2
//push return address
@Output.backSpace$ret.0
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@7
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Output.moveCursor
0;JMP
// continue after call
(Output.backSpace$ret.0)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// goto command
@Output.backSpace$IF2_0
0; JMP
// label command
(Output.backSpace$IF1_0)
// push static 1
@Output.1
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// gt
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@GREATER105
D;JGT
@NOTGREATER105
0;JMP
(GREATER105)
D=-1
@CONTINUE105
0;JMP
(NOTGREATER105)
D=0
@CONTINUE105
0;JMP
(CONTINUE105)
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// if-goto command
@SP
M=M-1
@SP
A=M
D=M
@Output.backSpace$IF1_1
D; JNE
// push static 1
@Output.1
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// sub
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@SP
A=M
M=D
@SP
M=M+1
// push constant 63
@63
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.moveCursor 2
//push return address
@Output.backSpace$ret.1
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@7
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Output.moveCursor
0;JMP
// continue after call
(Output.backSpace$ret.1)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// goto command
@Output.backSpace$IF2_1
0; JMP
// label command
(Output.backSpace$IF1_1)
// push static 1
@Output.1
D=M
@SP
A=M
M=D
@SP
M=M+1
// push static 2
@Output.2
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Output.moveCursor 2
//push return address
@Output.backSpace$ret.2
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@7
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Output.moveCursor
0;JMP
// continue after call
(Output.backSpace$ret.2)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// label command
(Output.backSpace$IF2_1)
// label command
(Output.backSpace$IF2_0)
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// return
// save LCL in end frame variable endFrame
@LCL
D=M
@endFrame
M=D
// save return address in variable retAddress
@5
D=A
@endFrame
D=M-D
A=D
D=M
@retAddress
M=D
// reposition return value for the caller
@SP
M=M-1
@SP
A=M
D=M
@ARG
A=M
M=D
// reposition SP
@ARG
D=M+1
@SP
M=D
// recover segments
// recover THAT
@endFrame
D=M-1
A=D
D=M
@THAT
M=D
// recover THIS
@2
D=A
@endFrame
D=M-D
A=D
D=M
@THIS
M=D
// recover ARG
@3
D=A
@endFrame
D=M-D
A=D
D=M
@ARG
M=D
// recover LCL
@4
D=A
@endFrame
D=M-D
A=D
D=M
@LCL
M=D
// actual return
@retAddress
A=M
0;JMP
// function String.new 0
(String.new)
//push zeroes
@0
D=A
@nargs
M=D
(PUSH106)
@nargs
D=M
@NOTPUSH106
D;JEQ
D=0
@SP
A=M
M=D
@SP
M=M+1
@nargs
M=M-1
@PUSH106
0; JMP
(NOTPUSH106)
// push constant 3
@3
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Memory.alloc 1
//push return address
@String.new$ret.0
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@6
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Memory.alloc
0;JMP
// continue after call
(String.new$ret.0)
// pop pointer 0
@SP
M=M-1
@SP
A=M
D=M
@R3
M=D
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@LESS107
D;JLT
@NOTLESS107
0;JMP
(LESS107)
D=-1
@CONTINUE107
0;JMP
(NOTLESS107)
D=0
@CONTINUE107
0;JMP
(CONTINUE107)
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// if-goto command
@SP
M=M-1
@SP
A=M
D=M
@String.new$IF1_0
D; JNE
// push constant 14
@14
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Sys.error 1
//push return address
@String.new$ret.1
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@6
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Sys.error
0;JMP
// continue after call
(String.new$ret.1)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// goto command
@String.new$IF2_0
0; JMP
// label command
(String.new$IF1_0)
// label command
(String.new$IF2_0)
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// eq
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@EQUAL108
D;JEQ
@NOTEQUAL108
0;JMP
(EQUAL108)
D=-1
@CONTINUE108
0;JMP
(NOTEQUAL108)
D=0
@CONTINUE108
0;JMP
(CONTINUE108)
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// if-goto command
@SP
M=M-1
@SP
A=M
D=M
@String.new$IF1_1
D; JNE
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// pop argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// goto command
@String.new$IF2_1
0; JMP
// label command
(String.new$IF1_1)
// label command
(String.new$IF2_1)
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop this 2
@2
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Array.new 1
//push return address
@String.new$ret.2
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@6
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Array.new
0;JMP
// continue after call
(String.new$ret.2)
// pop this 0
@0
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop this 1
@1
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push pointer 0
@R3
D=M
@SP
A=M
M=D
@SP
M=M+1
// return
// save LCL in end frame variable endFrame
@LCL
D=M
@endFrame
M=D
// save return address in variable retAddress
@5
D=A
@endFrame
D=M-D
A=D
D=M
@retAddress
M=D
// reposition return value for the caller
@SP
M=M-1
@SP
A=M
D=M
@ARG
A=M
M=D
// reposition SP
@ARG
D=M+1
@SP
M=D
// recover segments
// recover THAT
@endFrame
D=M-1
A=D
D=M
@THAT
M=D
// recover THIS
@2
D=A
@endFrame
D=M-D
A=D
D=M
@THIS
M=D
// recover ARG
@3
D=A
@endFrame
D=M-D
A=D
D=M
@ARG
M=D
// recover LCL
@4
D=A
@endFrame
D=M-D
A=D
D=M
@LCL
M=D
// actual return
@retAddress
A=M
0;JMP
// function String.dispose 0
(String.dispose)
//push zeroes
@0
D=A
@nargs
M=D
(PUSH109)
@nargs
D=M
@NOTPUSH109
D;JEQ
D=0
@SP
A=M
M=D
@SP
M=M+1
@nargs
M=M-1
@PUSH109
0; JMP
(NOTPUSH109)
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop pointer 0
@SP
M=M-1
@SP
A=M
D=M
@R3
M=D
// push this 0
@0
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Array.dispose 1
//push return address
@String.dispose$ret.0
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@6
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Array.dispose
0;JMP
// continue after call
(String.dispose$ret.0)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push pointer 0
@R3
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Memory.deAlloc 1
//push return address
@String.dispose$ret.1
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@6
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Memory.deAlloc
0;JMP
// continue after call
(String.dispose$ret.1)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// return
// save LCL in end frame variable endFrame
@LCL
D=M
@endFrame
M=D
// save return address in variable retAddress
@5
D=A
@endFrame
D=M-D
A=D
D=M
@retAddress
M=D
// reposition return value for the caller
@SP
M=M-1
@SP
A=M
D=M
@ARG
A=M
M=D
// reposition SP
@ARG
D=M+1
@SP
M=D
// recover segments
// recover THAT
@endFrame
D=M-1
A=D
D=M
@THAT
M=D
// recover THIS
@2
D=A
@endFrame
D=M-D
A=D
D=M
@THIS
M=D
// recover ARG
@3
D=A
@endFrame
D=M-D
A=D
D=M
@ARG
M=D
// recover LCL
@4
D=A
@endFrame
D=M-D
A=D
D=M
@LCL
M=D
// actual return
@retAddress
A=M
0;JMP
// function String.length 0
(String.length)
//push zeroes
@0
D=A
@nargs
M=D
(PUSH110)
@nargs
D=M
@NOTPUSH110
D;JEQ
D=0
@SP
A=M
M=D
@SP
M=M+1
@nargs
M=M-1
@PUSH110
0; JMP
(NOTPUSH110)
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop pointer 0
@SP
M=M-1
@SP
A=M
D=M
@R3
M=D
// push this 1
@1
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// return
// save LCL in end frame variable endFrame
@LCL
D=M
@endFrame
M=D
// save return address in variable retAddress
@5
D=A
@endFrame
D=M-D
A=D
D=M
@retAddress
M=D
// reposition return value for the caller
@SP
M=M-1
@SP
A=M
D=M
@ARG
A=M
M=D
// reposition SP
@ARG
D=M+1
@SP
M=D
// recover segments
// recover THAT
@endFrame
D=M-1
A=D
D=M
@THAT
M=D
// recover THIS
@2
D=A
@endFrame
D=M-D
A=D
D=M
@THIS
M=D
// recover ARG
@3
D=A
@endFrame
D=M-D
A=D
D=M
@ARG
M=D
// recover LCL
@4
D=A
@endFrame
D=M-D
A=D
D=M
@LCL
M=D
// actual return
@retAddress
A=M
0;JMP
// function String.charAt 0
(String.charAt)
//push zeroes
@0
D=A
@nargs
M=D
(PUSH111)
@nargs
D=M
@NOTPUSH111
D;JEQ
D=0
@SP
A=M
M=D
@SP
M=M+1
@nargs
M=M-1
@PUSH111
0; JMP
(NOTPUSH111)
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop pointer 0
@SP
M=M-1
@SP
A=M
D=M
@R3
M=D
// push argument 1
@1
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@LESS112
D;JLT
@NOTLESS112
0;JMP
(LESS112)
D=-1
@CONTINUE112
0;JMP
(NOTLESS112)
D=0
@CONTINUE112
0;JMP
(CONTINUE112)
@SP
A=M
M=D
@SP
M=M+1
// push argument 1
@1
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// push this 1
@1
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// gt
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@GREATER113
D;JGT
@NOTGREATER113
0;JMP
(GREATER113)
D=-1
@CONTINUE113
0;JMP
(NOTGREATER113)
D=0
@CONTINUE113
0;JMP
(CONTINUE113)
@SP
A=M
M=D
@SP
M=M+1
// or
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D|M
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// if-goto command
@SP
M=M-1
@SP
A=M
D=M
@String.charAt$IF1_0
D; JNE
// push constant 15
@15
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Sys.error 1
//push return address
@String.charAt$ret.0
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@6
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Sys.error
0;JMP
// continue after call
(String.charAt$ret.0)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// goto command
@String.charAt$IF2_0
0; JMP
// label command
(String.charAt$IF1_0)
// label command
(String.charAt$IF2_0)
// push this 0
@0
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push argument 1
@1
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// pop pointer 1
@SP
M=M-1
@SP
A=M
D=M
@R4
M=D
// push that 0
@0
D=A
@address
M=D
@THAT
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// return
// save LCL in end frame variable endFrame
@LCL
D=M
@endFrame
M=D
// save return address in variable retAddress
@5
D=A
@endFrame
D=M-D
A=D
D=M
@retAddress
M=D
// reposition return value for the caller
@SP
M=M-1
@SP
A=M
D=M
@ARG
A=M
M=D
// reposition SP
@ARG
D=M+1
@SP
M=D
// recover segments
// recover THAT
@endFrame
D=M-1
A=D
D=M
@THAT
M=D
// recover THIS
@2
D=A
@endFrame
D=M-D
A=D
D=M
@THIS
M=D
// recover ARG
@3
D=A
@endFrame
D=M-D
A=D
D=M
@ARG
M=D
// recover LCL
@4
D=A
@endFrame
D=M-D
A=D
D=M
@LCL
M=D
// actual return
@retAddress
A=M
0;JMP
// function String.setCharAt 0
(String.setCharAt)
//push zeroes
@0
D=A
@nargs
M=D
(PUSH114)
@nargs
D=M
@NOTPUSH114
D;JEQ
D=0
@SP
A=M
M=D
@SP
M=M+1
@nargs
M=M-1
@PUSH114
0; JMP
(NOTPUSH114)
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop pointer 0
@SP
M=M-1
@SP
A=M
D=M
@R3
M=D
// push argument 1
@1
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@LESS115
D;JLT
@NOTLESS115
0;JMP
(LESS115)
D=-1
@CONTINUE115
0;JMP
(NOTLESS115)
D=0
@CONTINUE115
0;JMP
(CONTINUE115)
@SP
A=M
M=D
@SP
M=M+1
// push argument 1
@1
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// push this 1
@1
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// gt
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@GREATER116
D;JGT
@NOTGREATER116
0;JMP
(GREATER116)
D=-1
@CONTINUE116
0;JMP
(NOTGREATER116)
D=0
@CONTINUE116
0;JMP
(CONTINUE116)
@SP
A=M
M=D
@SP
M=M+1
// or
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D|M
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// if-goto command
@SP
M=M-1
@SP
A=M
D=M
@String.setCharAt$IF1_0
D; JNE
// push constant 16
@16
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Sys.error 1
//push return address
@String.setCharAt$ret.0
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@6
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Sys.error
0;JMP
// continue after call
(String.setCharAt$ret.0)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// goto command
@String.setCharAt$IF2_0
0; JMP
// label command
(String.setCharAt$IF1_0)
// label command
(String.setCharAt$IF2_0)
// push this 0
@0
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push argument 1
@1
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// push argument 2
@2
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// pop pointer 1
@SP
M=M-1
@SP
A=M
D=M
@R4
M=D
// push temp 0
@R5
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop that 0
@0
D=A
@address
M=D
@THAT
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// return
// save LCL in end frame variable endFrame
@LCL
D=M
@endFrame
M=D
// save return address in variable retAddress
@5
D=A
@endFrame
D=M-D
A=D
D=M
@retAddress
M=D
// reposition return value for the caller
@SP
M=M-1
@SP
A=M
D=M
@ARG
A=M
M=D
// reposition SP
@ARG
D=M+1
@SP
M=D
// recover segments
// recover THAT
@endFrame
D=M-1
A=D
D=M
@THAT
M=D
// recover THIS
@2
D=A
@endFrame
D=M-D
A=D
D=M
@THIS
M=D
// recover ARG
@3
D=A
@endFrame
D=M-D
A=D
D=M
@ARG
M=D
// recover LCL
@4
D=A
@endFrame
D=M-D
A=D
D=M
@LCL
M=D
// actual return
@retAddress
A=M
0;JMP
// function String.appendChar 0
(String.appendChar)
//push zeroes
@0
D=A
@nargs
M=D
(PUSH117)
@nargs
D=M
@NOTPUSH117
D;JEQ
D=0
@SP
A=M
M=D
@SP
M=M+1
@nargs
M=M-1
@PUSH117
0; JMP
(NOTPUSH117)
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop pointer 0
@SP
M=M-1
@SP
A=M
D=M
@R3
M=D
// push this 1
@1
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push this 2
@2
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// eq
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@EQUAL118
D;JEQ
@NOTEQUAL118
0;JMP
(EQUAL118)
D=-1
@CONTINUE118
0;JMP
(NOTEQUAL118)
D=0
@CONTINUE118
0;JMP
(CONTINUE118)
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// if-goto command
@SP
M=M-1
@SP
A=M
D=M
@String.appendChar$IF1_0
D; JNE
// push constant 17
@17
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Sys.error 1
//push return address
@String.appendChar$ret.0
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@6
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Sys.error
0;JMP
// continue after call
(String.appendChar$ret.0)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// goto command
@String.appendChar$IF2_0
0; JMP
// label command
(String.appendChar$IF1_0)
// label command
(String.appendChar$IF2_0)
// push this 0
@0
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push this 1
@1
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// push argument 1
@1
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// pop pointer 1
@SP
M=M-1
@SP
A=M
D=M
@R4
M=D
// push temp 0
@R5
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop that 0
@0
D=A
@address
M=D
@THAT
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push this 1
@1
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// pop this 1
@1
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push pointer 0
@R3
D=M
@SP
A=M
M=D
@SP
M=M+1
// return
// save LCL in end frame variable endFrame
@LCL
D=M
@endFrame
M=D
// save return address in variable retAddress
@5
D=A
@endFrame
D=M-D
A=D
D=M
@retAddress
M=D
// reposition return value for the caller
@SP
M=M-1
@SP
A=M
D=M
@ARG
A=M
M=D
// reposition SP
@ARG
D=M+1
@SP
M=D
// recover segments
// recover THAT
@endFrame
D=M-1
A=D
D=M
@THAT
M=D
// recover THIS
@2
D=A
@endFrame
D=M-D
A=D
D=M
@THIS
M=D
// recover ARG
@3
D=A
@endFrame
D=M-D
A=D
D=M
@ARG
M=D
// recover LCL
@4
D=A
@endFrame
D=M-D
A=D
D=M
@LCL
M=D
// actual return
@retAddress
A=M
0;JMP
// function String.eraseLastChar 0
(String.eraseLastChar)
//push zeroes
@0
D=A
@nargs
M=D
(PUSH119)
@nargs
D=M
@NOTPUSH119
D;JEQ
D=0
@SP
A=M
M=D
@SP
M=M+1
@nargs
M=M-1
@PUSH119
0; JMP
(NOTPUSH119)
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop pointer 0
@SP
M=M-1
@SP
A=M
D=M
@R3
M=D
// push this 1
@1
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// eq
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@EQUAL120
D;JEQ
@NOTEQUAL120
0;JMP
(EQUAL120)
D=-1
@CONTINUE120
0;JMP
(NOTEQUAL120)
D=0
@CONTINUE120
0;JMP
(CONTINUE120)
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// if-goto command
@SP
M=M-1
@SP
A=M
D=M
@String.eraseLastChar$IF1_0
D; JNE
// push constant 18
@18
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Sys.error 1
//push return address
@String.eraseLastChar$ret.0
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@6
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Sys.error
0;JMP
// continue after call
(String.eraseLastChar$ret.0)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// goto command
@String.eraseLastChar$IF2_0
0; JMP
// label command
(String.eraseLastChar$IF1_0)
// label command
(String.eraseLastChar$IF2_0)
// push this 1
@1
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// sub
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@SP
A=M
M=D
@SP
M=M+1
// pop this 1
@1
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// return
// save LCL in end frame variable endFrame
@LCL
D=M
@endFrame
M=D
// save return address in variable retAddress
@5
D=A
@endFrame
D=M-D
A=D
D=M
@retAddress
M=D
// reposition return value for the caller
@SP
M=M-1
@SP
A=M
D=M
@ARG
A=M
M=D
// reposition SP
@ARG
D=M+1
@SP
M=D
// recover segments
// recover THAT
@endFrame
D=M-1
A=D
D=M
@THAT
M=D
// recover THIS
@2
D=A
@endFrame
D=M-D
A=D
D=M
@THIS
M=D
// recover ARG
@3
D=A
@endFrame
D=M-D
A=D
D=M
@ARG
M=D
// recover LCL
@4
D=A
@endFrame
D=M-D
A=D
D=M
@LCL
M=D
// actual return
@retAddress
A=M
0;JMP
// function String.isDigit 0
(String.isDigit)
//push zeroes
@0
D=A
@nargs
M=D
(PUSH121)
@nargs
D=M
@NOTPUSH121
D;JEQ
D=0
@SP
A=M
M=D
@SP
M=M+1
@nargs
M=M-1
@PUSH121
0; JMP
(NOTPUSH121)
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 10
@10
D=A
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@LESS122
D;JLT
@NOTLESS122
0;JMP
(LESS122)
D=-1
@CONTINUE122
0;JMP
(NOTLESS122)
D=0
@CONTINUE122
0;JMP
(CONTINUE122)
@SP
A=M
M=D
@SP
M=M+1
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// neg
@SP
M=M-1
@SP
A=M
D=M
D=-D
@SP
A=M
M=D
@SP
M=M+1
// gt
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@GREATER123
D;JGT
@NOTGREATER123
0;JMP
(GREATER123)
D=-1
@CONTINUE123
0;JMP
(NOTGREATER123)
D=0
@CONTINUE123
0;JMP
(CONTINUE123)
@SP
A=M
M=D
@SP
M=M+1
// and
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D&M
@SP
A=M
M=D
@SP
M=M+1
// return
// save LCL in end frame variable endFrame
@LCL
D=M
@endFrame
M=D
// save return address in variable retAddress
@5
D=A
@endFrame
D=M-D
A=D
D=M
@retAddress
M=D
// reposition return value for the caller
@SP
M=M-1
@SP
A=M
D=M
@ARG
A=M
M=D
// reposition SP
@ARG
D=M+1
@SP
M=D
// recover segments
// recover THAT
@endFrame
D=M-1
A=D
D=M
@THAT
M=D
// recover THIS
@2
D=A
@endFrame
D=M-D
A=D
D=M
@THIS
M=D
// recover ARG
@3
D=A
@endFrame
D=M-D
A=D
D=M
@ARG
M=D
// recover LCL
@4
D=A
@endFrame
D=M-D
A=D
D=M
@LCL
M=D
// actual return
@retAddress
A=M
0;JMP
// function String.isMinus 0
(String.isMinus)
//push zeroes
@0
D=A
@nargs
M=D
(PUSH124)
@nargs
D=M
@NOTPUSH124
D;JEQ
D=0
@SP
A=M
M=D
@SP
M=M+1
@nargs
M=M-1
@PUSH124
0; JMP
(NOTPUSH124)
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop pointer 0
@SP
M=M-1
@SP
A=M
D=M
@R3
M=D
// push this 1
@1
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// gt
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@GREATER125
D;JGT
@NOTGREATER125
0;JMP
(GREATER125)
D=-1
@CONTINUE125
0;JMP
(NOTGREATER125)
D=0
@CONTINUE125
0;JMP
(CONTINUE125)
@SP
A=M
M=D
@SP
M=M+1
// push this 0
@0
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// pop pointer 1
@SP
M=M-1
@SP
A=M
D=M
@R4
M=D
// push that 0
@0
D=A
@address
M=D
@THAT
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 45
@45
D=A
@SP
A=M
M=D
@SP
M=M+1
// eq
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@EQUAL126
D;JEQ
@NOTEQUAL126
0;JMP
(EQUAL126)
D=-1
@CONTINUE126
0;JMP
(NOTEQUAL126)
D=0
@CONTINUE126
0;JMP
(CONTINUE126)
@SP
A=M
M=D
@SP
M=M+1
// and
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D&M
@SP
A=M
M=D
@SP
M=M+1
// return
// save LCL in end frame variable endFrame
@LCL
D=M
@endFrame
M=D
// save return address in variable retAddress
@5
D=A
@endFrame
D=M-D
A=D
D=M
@retAddress
M=D
// reposition return value for the caller
@SP
M=M-1
@SP
A=M
D=M
@ARG
A=M
M=D
// reposition SP
@ARG
D=M+1
@SP
M=D
// recover segments
// recover THAT
@endFrame
D=M-1
A=D
D=M
@THAT
M=D
// recover THIS
@2
D=A
@endFrame
D=M-D
A=D
D=M
@THIS
M=D
// recover ARG
@3
D=A
@endFrame
D=M-D
A=D
D=M
@ARG
M=D
// recover LCL
@4
D=A
@endFrame
D=M-D
A=D
D=M
@LCL
M=D
// actual return
@retAddress
A=M
0;JMP
// function String.StringToInt 3
(String.StringToInt)
//push zeroes
@3
D=A
@nargs
M=D
(PUSH127)
@nargs
D=M
@NOTPUSH127
D;JEQ
D=0
@SP
A=M
M=D
@SP
M=M+1
@nargs
M=M-1
@PUSH127
0; JMP
(NOTPUSH127)
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop pointer 0
@SP
M=M-1
@SP
A=M
D=M
@R3
M=D
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop local 1
@1
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop local 2
@2
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push argument 1
@1
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// if-goto command
@SP
M=M-1
@SP
A=M
D=M
@String.StringToInt$IF1_0
D; JNE
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop local 2
@2
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// goto command
@String.StringToInt$IF2_0
0; JMP
// label command
(String.StringToInt$IF1_0)
// label command
(String.StringToInt$IF2_0)
// label command
(String.StringToInt$WHILE1_1)
// push local 1
@1
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// call String.isDigit 1
//push return address
@String.StringToInt$ret.0
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@6
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@String.isDigit
0;JMP
// continue after call
(String.StringToInt$ret.0)
// push local 2
@2
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push this 1
@1
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@LESS128
D;JLT
@NOTLESS128
0;JMP
(LESS128)
D=-1
@CONTINUE128
0;JMP
(NOTLESS128)
D=0
@CONTINUE128
0;JMP
(CONTINUE128)
@SP
A=M
M=D
@SP
M=M+1
// and
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D&M
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// if-goto command
@SP
M=M-1
@SP
A=M
D=M
@String.StringToInt$WHILE2_1
D; JNE
// push this 0
@0
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 2
@2
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// pop pointer 1
@SP
M=M-1
@SP
A=M
D=M
@R4
M=D
// push that 0
@0
D=A
@address
M=D
@THAT
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 48
@48
D=A
@SP
A=M
M=D
@SP
M=M+1
// sub
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@SP
A=M
M=D
@SP
M=M+1
// pop local 1
@1
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 10
@10
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Math.multiply 2
//push return address
@String.StringToInt$ret.1
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@7
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Math.multiply
0;JMP
// continue after call
(String.StringToInt$ret.1)
// push local 1
@1
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// pop local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push local 2
@2
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// pop local 2
@2
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// goto command
@String.StringToInt$WHILE1_1
0; JMP
// label command
(String.StringToInt$WHILE2_1)
// push local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// return
// save LCL in end frame variable endFrame
@LCL
D=M
@endFrame
M=D
// save return address in variable retAddress
@5
D=A
@endFrame
D=M-D
A=D
D=M
@retAddress
M=D
// reposition return value for the caller
@SP
M=M-1
@SP
A=M
D=M
@ARG
A=M
M=D
// reposition SP
@ARG
D=M+1
@SP
M=D
// recover segments
// recover THAT
@endFrame
D=M-1
A=D
D=M
@THAT
M=D
// recover THIS
@2
D=A
@endFrame
D=M-D
A=D
D=M
@THIS
M=D
// recover ARG
@3
D=A
@endFrame
D=M-D
A=D
D=M
@ARG
M=D
// recover LCL
@4
D=A
@endFrame
D=M-D
A=D
D=M
@LCL
M=D
// actual return
@retAddress
A=M
0;JMP
// function String.intValue 2
(String.intValue)
//push zeroes
@2
D=A
@nargs
M=D
(PUSH129)
@nargs
D=M
@NOTPUSH129
D;JEQ
D=0
@SP
A=M
M=D
@SP
M=M+1
@nargs
M=M-1
@PUSH129
0; JMP
(NOTPUSH129)
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop pointer 0
@SP
M=M-1
@SP
A=M
D=M
@R3
M=D
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop local 1
@1
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push pointer 0
@R3
D=M
@SP
A=M
M=D
@SP
M=M+1
// call String.isMinus 1
//push return address
@String.intValue$ret.0
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@6
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@String.isMinus
0;JMP
// continue after call
(String.intValue$ret.0)
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// if-goto command
@SP
M=M-1
@SP
A=M
D=M
@String.intValue$IF1_0
D; JNE
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// neg
@SP
M=M-1
@SP
A=M
D=M
D=-D
@SP
A=M
M=D
@SP
M=M+1
// pop local 1
@1
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// goto command
@String.intValue$IF2_0
0; JMP
// label command
(String.intValue$IF1_0)
// label command
(String.intValue$IF2_0)
// push pointer 0
@R3
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 1
@1
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// call String.StringToInt 2
//push return address
@String.intValue$ret.1
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@7
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@String.StringToInt
0;JMP
// continue after call
(String.intValue$ret.1)
// pop local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push local 1
@1
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// if-goto command
@SP
M=M-1
@SP
A=M
D=M
@String.intValue$IF1_1
D; JNE
// push local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// neg
@SP
M=M-1
@SP
A=M
D=M
D=-D
@SP
A=M
M=D
@SP
M=M+1
// pop local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// goto command
@String.intValue$IF2_1
0; JMP
// label command
(String.intValue$IF1_1)
// label command
(String.intValue$IF2_1)
// push local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// return
// save LCL in end frame variable endFrame
@LCL
D=M
@endFrame
M=D
// save return address in variable retAddress
@5
D=A
@endFrame
D=M-D
A=D
D=M
@retAddress
M=D
// reposition return value for the caller
@SP
M=M-1
@SP
A=M
D=M
@ARG
A=M
M=D
// reposition SP
@ARG
D=M+1
@SP
M=D
// recover segments
// recover THAT
@endFrame
D=M-1
A=D
D=M
@THAT
M=D
// recover THIS
@2
D=A
@endFrame
D=M-D
A=D
D=M
@THIS
M=D
// recover ARG
@3
D=A
@endFrame
D=M-D
A=D
D=M
@ARG
M=D
// recover LCL
@4
D=A
@endFrame
D=M-D
A=D
D=M
@LCL
M=D
// actual return
@retAddress
A=M
0;JMP
// function String.swap 1
(String.swap)
//push zeroes
@1
D=A
@nargs
M=D
(PUSH130)
@nargs
D=M
@NOTPUSH130
D;JEQ
D=0
@SP
A=M
M=D
@SP
M=M+1
@nargs
M=M-1
@PUSH130
0; JMP
(NOTPUSH130)
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop pointer 0
@SP
M=M-1
@SP
A=M
D=M
@R3
M=D
// push this 0
@0
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push argument 1
@1
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// pop pointer 1
@SP
M=M-1
@SP
A=M
D=M
@R4
M=D
// push that 0
@0
D=A
@address
M=D
@THAT
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push this 0
@0
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push argument 1
@1
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// push this 0
@0
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push argument 2
@2
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// pop pointer 1
@SP
M=M-1
@SP
A=M
D=M
@R4
M=D
// push that 0
@0
D=A
@address
M=D
@THAT
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// pop pointer 1
@SP
M=M-1
@SP
A=M
D=M
@R4
M=D
// push temp 0
@R5
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop that 0
@0
D=A
@address
M=D
@THAT
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push this 0
@0
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push argument 2
@2
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// push local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// pop pointer 1
@SP
M=M-1
@SP
A=M
D=M
@R4
M=D
// push temp 0
@R5
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop that 0
@0
D=A
@address
M=D
@THAT
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// return
// save LCL in end frame variable endFrame
@LCL
D=M
@endFrame
M=D
// save return address in variable retAddress
@5
D=A
@endFrame
D=M-D
A=D
D=M
@retAddress
M=D
// reposition return value for the caller
@SP
M=M-1
@SP
A=M
D=M
@ARG
A=M
M=D
// reposition SP
@ARG
D=M+1
@SP
M=D
// recover segments
// recover THAT
@endFrame
D=M-1
A=D
D=M
@THAT
M=D
// recover THIS
@2
D=A
@endFrame
D=M-D
A=D
D=M
@THIS
M=D
// recover ARG
@3
D=A
@endFrame
D=M-D
A=D
D=M
@ARG
M=D
// recover LCL
@4
D=A
@endFrame
D=M-D
A=D
D=M
@LCL
M=D
// actual return
@retAddress
A=M
0;JMP
// function String.reverse 1
(String.reverse)
//push zeroes
@1
D=A
@nargs
M=D
(PUSH131)
@nargs
D=M
@NOTPUSH131
D;JEQ
D=0
@SP
A=M
M=D
@SP
M=M+1
@nargs
M=M-1
@PUSH131
0; JMP
(NOTPUSH131)
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop pointer 0
@SP
M=M-1
@SP
A=M
D=M
@R3
M=D
// push argument 1
@1
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push argument 2
@2
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push argument 1
@1
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// sub
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@SP
A=M
M=D
@SP
M=M+1
// push constant 2
@2
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Math.divide 2
//push return address
@String.reverse$ret.0
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@7
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Math.divide
0;JMP
// continue after call
(String.reverse$ret.0)
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// pop local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// label command
(String.reverse$WHILE1_0)
// push argument 1
@1
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@LESS132
D;JLT
@NOTLESS132
0;JMP
(LESS132)
D=-1
@CONTINUE132
0;JMP
(NOTLESS132)
D=0
@CONTINUE132
0;JMP
(CONTINUE132)
@SP
A=M
M=D
@SP
M=M+1
// push argument 1
@1
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// eq
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@EQUAL133
D;JEQ
@NOTEQUAL133
0;JMP
(EQUAL133)
D=-1
@CONTINUE133
0;JMP
(NOTEQUAL133)
D=0
@CONTINUE133
0;JMP
(CONTINUE133)
@SP
A=M
M=D
@SP
M=M+1
// or
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D|M
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// if-goto command
@SP
M=M-1
@SP
A=M
D=M
@String.reverse$WHILE2_0
D; JNE
// push pointer 0
@R3
D=M
@SP
A=M
M=D
@SP
M=M+1
// push argument 1
@1
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push argument 2
@2
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// call String.swap 3
//push return address
@String.reverse$ret.1
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@8
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@String.swap
0;JMP
// continue after call
(String.reverse$ret.1)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push argument 1
@1
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// pop argument 1
@1
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push argument 2
@2
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// sub
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@SP
A=M
M=D
@SP
M=M+1
// pop argument 2
@2
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// goto command
@String.reverse$WHILE1_0
0; JMP
// label command
(String.reverse$WHILE2_0)
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// return
// save LCL in end frame variable endFrame
@LCL
D=M
@endFrame
M=D
// save return address in variable retAddress
@5
D=A
@endFrame
D=M-D
A=D
D=M
@retAddress
M=D
// reposition return value for the caller
@SP
M=M-1
@SP
A=M
D=M
@ARG
A=M
M=D
// reposition SP
@ARG
D=M+1
@SP
M=D
// recover segments
// recover THAT
@endFrame
D=M-1
A=D
D=M
@THAT
M=D
// recover THIS
@2
D=A
@endFrame
D=M-D
A=D
D=M
@THIS
M=D
// recover ARG
@3
D=A
@endFrame
D=M-D
A=D
D=M
@ARG
M=D
// recover LCL
@4
D=A
@endFrame
D=M-D
A=D
D=M
@LCL
M=D
// actual return
@retAddress
A=M
0;JMP
// function String.convert 1
(String.convert)
//push zeroes
@1
D=A
@nargs
M=D
(PUSH134)
@nargs
D=M
@NOTPUSH134
D;JEQ
D=0
@SP
A=M
M=D
@SP
M=M+1
@nargs
M=M-1
@PUSH134
0; JMP
(NOTPUSH134)
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop pointer 0
@SP
M=M-1
@SP
A=M
D=M
@R3
M=D
// label command
(String.convert$WHILE1_0)
// push argument 1
@1
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// eq
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@EQUAL135
D;JEQ
@NOTEQUAL135
0;JMP
(EQUAL135)
D=-1
@CONTINUE135
0;JMP
(NOTEQUAL135)
D=0
@CONTINUE135
0;JMP
(CONTINUE135)
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// if-goto command
@SP
M=M-1
@SP
A=M
D=M
@String.convert$WHILE2_0
D; JNE
// push argument 1
@1
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push argument 1
@1
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 10
@10
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Math.divide 2
//push return address
@String.convert$ret.0
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@7
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Math.divide
0;JMP
// continue after call
(String.convert$ret.0)
// push constant 10
@10
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Math.multiply 2
//push return address
@String.convert$ret.1
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@7
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Math.multiply
0;JMP
// continue after call
(String.convert$ret.1)
// sub
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@SP
A=M
M=D
@SP
M=M+1
// pop local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push this 2
@2
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push this 1
@1
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@LESS136
D;JLT
@NOTLESS136
0;JMP
(LESS136)
D=-1
@CONTINUE136
0;JMP
(NOTLESS136)
D=0
@CONTINUE136
0;JMP
(CONTINUE136)
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// if-goto command
@SP
M=M-1
@SP
A=M
D=M
@String.convert$IF1_1
D; JNE
// push constant 19
@19
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Sys.error 1
//push return address
@String.convert$ret.2
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@6
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Sys.error
0;JMP
// continue after call
(String.convert$ret.2)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// goto command
@String.convert$IF2_1
0; JMP
// label command
(String.convert$IF1_1)
// label command
(String.convert$IF2_1)
// push pointer 0
@R3
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 48
@48
D=A
@SP
A=M
M=D
@SP
M=M+1
// push local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// call String.appendChar 2
//push return address
@String.convert$ret.3
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@7
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@String.appendChar
0;JMP
// continue after call
(String.convert$ret.3)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push argument 1
@1
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 10
@10
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Math.divide 2
//push return address
@String.convert$ret.4
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@7
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Math.divide
0;JMP
// continue after call
(String.convert$ret.4)
// pop argument 1
@1
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// goto command
@String.convert$WHILE1_0
0; JMP
// label command
(String.convert$WHILE2_0)
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// return
// save LCL in end frame variable endFrame
@LCL
D=M
@endFrame
M=D
// save return address in variable retAddress
@5
D=A
@endFrame
D=M-D
A=D
D=M
@retAddress
M=D
// reposition return value for the caller
@SP
M=M-1
@SP
A=M
D=M
@ARG
A=M
M=D
// reposition SP
@ARG
D=M+1
@SP
M=D
// recover segments
// recover THAT
@endFrame
D=M-1
A=D
D=M
@THAT
M=D
// recover THIS
@2
D=A
@endFrame
D=M-D
A=D
D=M
@THIS
M=D
// recover ARG
@3
D=A
@endFrame
D=M-D
A=D
D=M
@ARG
M=D
// recover LCL
@4
D=A
@endFrame
D=M-D
A=D
D=M
@LCL
M=D
// actual return
@retAddress
A=M
0;JMP
// function String.convertNonZero 2
(String.convertNonZero)
//push zeroes
@2
D=A
@nargs
M=D
(PUSH137)
@nargs
D=M
@NOTPUSH137
D;JEQ
D=0
@SP
A=M
M=D
@SP
M=M+1
@nargs
M=M-1
@PUSH137
0; JMP
(NOTPUSH137)
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop pointer 0
@SP
M=M-1
@SP
A=M
D=M
@R3
M=D
// push argument 1
@1
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@LESS138
D;JLT
@NOTLESS138
0;JMP
(LESS138)
D=-1
@CONTINUE138
0;JMP
(NOTLESS138)
D=0
@CONTINUE138
0;JMP
(CONTINUE138)
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// if-goto command
@SP
M=M-1
@SP
A=M
D=M
@String.convertNonZero$IF1_0
D; JNE
// push this 2
@2
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// eq
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@EQUAL139
D;JEQ
@NOTEQUAL139
0;JMP
(EQUAL139)
D=-1
@CONTINUE139
0;JMP
(NOTEQUAL139)
D=0
@CONTINUE139
0;JMP
(CONTINUE139)
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// if-goto command
@SP
M=M-1
@SP
A=M
D=M
@String.convertNonZero$IF1_1
D; JNE
// push constant 19
@19
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Sys.error 1
//push return address
@String.convertNonZero$ret.0
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@6
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Sys.error
0;JMP
// continue after call
(String.convertNonZero$ret.0)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// goto command
@String.convertNonZero$IF2_1
0; JMP
// label command
(String.convertNonZero$IF1_1)
// label command
(String.convertNonZero$IF2_1)
// push pointer 0
@R3
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 45
@45
D=A
@SP
A=M
M=D
@SP
M=M+1
// call String.appendChar 2
//push return address
@String.convertNonZero$ret.1
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@7
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@String.appendChar
0;JMP
// continue after call
(String.convertNonZero$ret.1)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// goto command
@String.convertNonZero$IF2_0
0; JMP
// label command
(String.convertNonZero$IF1_0)
// label command
(String.convertNonZero$IF2_0)
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push argument 1
@1
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@LESS140
D;JLT
@NOTLESS140
0;JMP
(LESS140)
D=-1
@CONTINUE140
0;JMP
(NOTLESS140)
D=0
@CONTINUE140
0;JMP
(CONTINUE140)
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// if-goto command
@SP
M=M-1
@SP
A=M
D=M
@String.convertNonZero$IF1_2
D; JNE
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// goto command
@String.convertNonZero$IF2_2
0; JMP
// label command
(String.convertNonZero$IF1_2)
// label command
(String.convertNonZero$IF2_2)
// push argument 1
@1
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Math.abs 1
//push return address
@String.convertNonZero$ret.2
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@6
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Math.abs
0;JMP
// continue after call
(String.convertNonZero$ret.2)
// pop argument 1
@1
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push pointer 0
@R3
D=M
@SP
A=M
M=D
@SP
M=M+1
// push argument 1
@1
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// call String.convert 2
//push return address
@String.convertNonZero$ret.3
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@7
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@String.convert
0;JMP
// continue after call
(String.convertNonZero$ret.3)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push this 1
@1
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// sub
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@SP
A=M
M=D
@SP
M=M+1
// pop local 1
@1
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push pointer 0
@R3
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 1
@1
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// call String.reverse 3
//push return address
@String.convertNonZero$ret.4
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@8
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@String.reverse
0;JMP
// continue after call
(String.convertNonZero$ret.4)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// return
// save LCL in end frame variable endFrame
@LCL
D=M
@endFrame
M=D
// save return address in variable retAddress
@5
D=A
@endFrame
D=M-D
A=D
D=M
@retAddress
M=D
// reposition return value for the caller
@SP
M=M-1
@SP
A=M
D=M
@ARG
A=M
M=D
// reposition SP
@ARG
D=M+1
@SP
M=D
// recover segments
// recover THAT
@endFrame
D=M-1
A=D
D=M
@THAT
M=D
// recover THIS
@2
D=A
@endFrame
D=M-D
A=D
D=M
@THIS
M=D
// recover ARG
@3
D=A
@endFrame
D=M-D
A=D
D=M
@ARG
M=D
// recover LCL
@4
D=A
@endFrame
D=M-D
A=D
D=M
@LCL
M=D
// actual return
@retAddress
A=M
0;JMP
// function String.setInt 4
(String.setInt)
//push zeroes
@4
D=A
@nargs
M=D
(PUSH141)
@nargs
D=M
@NOTPUSH141
D;JEQ
D=0
@SP
A=M
M=D
@SP
M=M+1
@nargs
M=M-1
@PUSH141
0; JMP
(NOTPUSH141)
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop pointer 0
@SP
M=M-1
@SP
A=M
D=M
@R3
M=D
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop this 1
@1
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push argument 1
@1
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// eq
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@EQUAL142
D;JEQ
@NOTEQUAL142
0;JMP
(EQUAL142)
D=-1
@CONTINUE142
0;JMP
(NOTEQUAL142)
D=0
@CONTINUE142
0;JMP
(CONTINUE142)
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// if-goto command
@SP
M=M-1
@SP
A=M
D=M
@String.setInt$IF1_0
D; JNE
// push this 2
@2
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// eq
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@EQUAL143
D;JEQ
@NOTEQUAL143
0;JMP
(EQUAL143)
D=-1
@CONTINUE143
0;JMP
(NOTEQUAL143)
D=0
@CONTINUE143
0;JMP
(CONTINUE143)
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// if-goto command
@SP
M=M-1
@SP
A=M
D=M
@String.setInt$IF1_1
D; JNE
// push constant 19
@19
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Sys.error 1
//push return address
@String.setInt$ret.0
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@6
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Sys.error
0;JMP
// continue after call
(String.setInt$ret.0)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// goto command
@String.setInt$IF2_1
0; JMP
// label command
(String.setInt$IF1_1)
// label command
(String.setInt$IF2_1)
// push pointer 0
@R3
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 48
@48
D=A
@SP
A=M
M=D
@SP
M=M+1
// call String.appendChar 2
//push return address
@String.setInt$ret.1
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@7
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@String.appendChar
0;JMP
// continue after call
(String.setInt$ret.1)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// goto command
@String.setInt$IF2_0
0; JMP
// label command
(String.setInt$IF1_0)
// push pointer 0
@R3
D=M
@SP
A=M
M=D
@SP
M=M+1
// push argument 1
@1
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// call String.convertNonZero 2
//push return address
@String.setInt$ret.2
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@7
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@String.convertNonZero
0;JMP
// continue after call
(String.setInt$ret.2)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// label command
(String.setInt$IF2_0)
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// return
// save LCL in end frame variable endFrame
@LCL
D=M
@endFrame
M=D
// save return address in variable retAddress
@5
D=A
@endFrame
D=M-D
A=D
D=M
@retAddress
M=D
// reposition return value for the caller
@SP
M=M-1
@SP
A=M
D=M
@ARG
A=M
M=D
// reposition SP
@ARG
D=M+1
@SP
M=D
// recover segments
// recover THAT
@endFrame
D=M-1
A=D
D=M
@THAT
M=D
// recover THIS
@2
D=A
@endFrame
D=M-D
A=D
D=M
@THIS
M=D
// recover ARG
@3
D=A
@endFrame
D=M-D
A=D
D=M
@ARG
M=D
// recover LCL
@4
D=A
@endFrame
D=M-D
A=D
D=M
@LCL
M=D
// actual return
@retAddress
A=M
0;JMP
// function String.newLine 0
(String.newLine)
//push zeroes
@0
D=A
@nargs
M=D
(PUSH144)
@nargs
D=M
@NOTPUSH144
D;JEQ
D=0
@SP
A=M
M=D
@SP
M=M+1
@nargs
M=M-1
@PUSH144
0; JMP
(NOTPUSH144)
// push constant 128
@128
D=A
@SP
A=M
M=D
@SP
M=M+1
// return
// save LCL in end frame variable endFrame
@LCL
D=M
@endFrame
M=D
// save return address in variable retAddress
@5
D=A
@endFrame
D=M-D
A=D
D=M
@retAddress
M=D
// reposition return value for the caller
@SP
M=M-1
@SP
A=M
D=M
@ARG
A=M
M=D
// reposition SP
@ARG
D=M+1
@SP
M=D
// recover segments
// recover THAT
@endFrame
D=M-1
A=D
D=M
@THAT
M=D
// recover THIS
@2
D=A
@endFrame
D=M-D
A=D
D=M
@THIS
M=D
// recover ARG
@3
D=A
@endFrame
D=M-D
A=D
D=M
@ARG
M=D
// recover LCL
@4
D=A
@endFrame
D=M-D
A=D
D=M
@LCL
M=D
// actual return
@retAddress
A=M
0;JMP
// function String.backSpace 0
(String.backSpace)
//push zeroes
@0
D=A
@nargs
M=D
(PUSH145)
@nargs
D=M
@NOTPUSH145
D;JEQ
D=0
@SP
A=M
M=D
@SP
M=M+1
@nargs
M=M-1
@PUSH145
0; JMP
(NOTPUSH145)
// push constant 129
@129
D=A
@SP
A=M
M=D
@SP
M=M+1
// return
// save LCL in end frame variable endFrame
@LCL
D=M
@endFrame
M=D
// save return address in variable retAddress
@5
D=A
@endFrame
D=M-D
A=D
D=M
@retAddress
M=D
// reposition return value for the caller
@SP
M=M-1
@SP
A=M
D=M
@ARG
A=M
M=D
// reposition SP
@ARG
D=M+1
@SP
M=D
// recover segments
// recover THAT
@endFrame
D=M-1
A=D
D=M
@THAT
M=D
// recover THIS
@2
D=A
@endFrame
D=M-D
A=D
D=M
@THIS
M=D
// recover ARG
@3
D=A
@endFrame
D=M-D
A=D
D=M
@ARG
M=D
// recover LCL
@4
D=A
@endFrame
D=M-D
A=D
D=M
@LCL
M=D
// actual return
@retAddress
A=M
0;JMP
// function String.doubleQuote 0
(String.doubleQuote)
//push zeroes
@0
D=A
@nargs
M=D
(PUSH146)
@nargs
D=M
@NOTPUSH146
D;JEQ
D=0
@SP
A=M
M=D
@SP
M=M+1
@nargs
M=M-1
@PUSH146
0; JMP
(NOTPUSH146)
// push constant 34
@34
D=A
@SP
A=M
M=D
@SP
M=M+1
// return
// save LCL in end frame variable endFrame
@LCL
D=M
@endFrame
M=D
// save return address in variable retAddress
@5
D=A
@endFrame
D=M-D
A=D
D=M
@retAddress
M=D
// reposition return value for the caller
@SP
M=M-1
@SP
A=M
D=M
@ARG
A=M
M=D
// reposition SP
@ARG
D=M+1
@SP
M=D
// recover segments
// recover THAT
@endFrame
D=M-1
A=D
D=M
@THAT
M=D
// recover THIS
@2
D=A
@endFrame
D=M-D
A=D
D=M
@THIS
M=D
// recover ARG
@3
D=A
@endFrame
D=M-D
A=D
D=M
@ARG
M=D
// recover LCL
@4
D=A
@endFrame
D=M-D
A=D
D=M
@LCL
M=D
// actual return
@retAddress
A=M
0;JMP
// function Sys.init 0
(Sys.init)
//push zeroes
@0
D=A
@nargs
M=D
(PUSH147)
@nargs
D=M
@NOTPUSH147
D;JEQ
D=0
@SP
A=M
M=D
@SP
M=M+1
@nargs
M=M-1
@PUSH147
0; JMP
(NOTPUSH147)
// call Memory.init 0
//push return address
@Sys.init$ret.0
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@5
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Memory.init
0;JMP
// continue after call
(Sys.init$ret.0)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// call Math.init 0
//push return address
@Sys.init$ret.1
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@5
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Math.init
0;JMP
// continue after call
(Sys.init$ret.1)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// call Screen.init 0
//push return address
@Sys.init$ret.2
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@5
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Screen.init
0;JMP
// continue after call
(Sys.init$ret.2)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// call Output.init 0
//push return address
@Sys.init$ret.3
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@5
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Output.init
0;JMP
// continue after call
(Sys.init$ret.3)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// call Keyboard.init 0
//push return address
@Sys.init$ret.4
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@5
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Keyboard.init
0;JMP
// continue after call
(Sys.init$ret.4)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// call Main.main 0
//push return address
@Sys.init$ret.5
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@5
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Main.main
0;JMP
// continue after call
(Sys.init$ret.5)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// call Sys.halt 0
//push return address
@Sys.init$ret.6
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@5
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Sys.halt
0;JMP
// continue after call
(Sys.init$ret.6)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// return
// save LCL in end frame variable endFrame
@LCL
D=M
@endFrame
M=D
// save return address in variable retAddress
@5
D=A
@endFrame
D=M-D
A=D
D=M
@retAddress
M=D
// reposition return value for the caller
@SP
M=M-1
@SP
A=M
D=M
@ARG
A=M
M=D
// reposition SP
@ARG
D=M+1
@SP
M=D
// recover segments
// recover THAT
@endFrame
D=M-1
A=D
D=M
@THAT
M=D
// recover THIS
@2
D=A
@endFrame
D=M-D
A=D
D=M
@THIS
M=D
// recover ARG
@3
D=A
@endFrame
D=M-D
A=D
D=M
@ARG
M=D
// recover LCL
@4
D=A
@endFrame
D=M-D
A=D
D=M
@LCL
M=D
// actual return
@retAddress
A=M
0;JMP
// function Sys.halt 0
(Sys.halt)
//push zeroes
@0
D=A
@nargs
M=D
(PUSH148)
@nargs
D=M
@NOTPUSH148
D;JEQ
D=0
@SP
A=M
M=D
@SP
M=M+1
@nargs
M=M-1
@PUSH148
0; JMP
(NOTPUSH148)
// label command
(Sys.halt$WHILE1_0)
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// neg
@SP
M=M-1
@SP
A=M
D=M
D=-D
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// if-goto command
@SP
M=M-1
@SP
A=M
D=M
@Sys.halt$WHILE2_0
D; JNE
// goto command
@Sys.halt$WHILE1_0
0; JMP
// label command
(Sys.halt$WHILE2_0)
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// return
// save LCL in end frame variable endFrame
@LCL
D=M
@endFrame
M=D
// save return address in variable retAddress
@5
D=A
@endFrame
D=M-D
A=D
D=M
@retAddress
M=D
// reposition return value for the caller
@SP
M=M-1
@SP
A=M
D=M
@ARG
A=M
M=D
// reposition SP
@ARG
D=M+1
@SP
M=D
// recover segments
// recover THAT
@endFrame
D=M-1
A=D
D=M
@THAT
M=D
// recover THIS
@2
D=A
@endFrame
D=M-D
A=D
D=M
@THIS
M=D
// recover ARG
@3
D=A
@endFrame
D=M-D
A=D
D=M
@ARG
M=D
// recover LCL
@4
D=A
@endFrame
D=M-D
A=D
D=M
@LCL
M=D
// actual return
@retAddress
A=M
0;JMP
// function Sys.wait 0
(Sys.wait)
//push zeroes
@0
D=A
@nargs
M=D
(PUSH149)
@nargs
D=M
@NOTPUSH149
D;JEQ
D=0
@SP
A=M
M=D
@SP
M=M+1
@nargs
M=M-1
@PUSH149
0; JMP
(NOTPUSH149)
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@LESS150
D;JLT
@NOTLESS150
0;JMP
(LESS150)
D=-1
@CONTINUE150
0;JMP
(NOTLESS150)
D=0
@CONTINUE150
0;JMP
(CONTINUE150)
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// if-goto command
@SP
M=M-1
@SP
A=M
D=M
@Sys.wait$IF1_0
D; JNE
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Sys.error 1
//push return address
@Sys.wait$ret.0
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@6
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Sys.error
0;JMP
// continue after call
(Sys.wait$ret.0)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// goto command
@Sys.wait$IF2_0
0; JMP
// label command
(Sys.wait$IF1_0)
// label command
(Sys.wait$IF2_0)
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// return
// save LCL in end frame variable endFrame
@LCL
D=M
@endFrame
M=D
// save return address in variable retAddress
@5
D=A
@endFrame
D=M-D
A=D
D=M
@retAddress
M=D
// reposition return value for the caller
@SP
M=M-1
@SP
A=M
D=M
@ARG
A=M
M=D
// reposition SP
@ARG
D=M+1
@SP
M=D
// recover segments
// recover THAT
@endFrame
D=M-1
A=D
D=M
@THAT
M=D
// recover THIS
@2
D=A
@endFrame
D=M-D
A=D
D=M
@THIS
M=D
// recover ARG
@3
D=A
@endFrame
D=M-D
A=D
D=M
@ARG
M=D
// recover LCL
@4
D=A
@endFrame
D=M-D
A=D
D=M
@LCL
M=D
// actual return
@retAddress
A=M
0;JMP
// function Sys.delay 1
(Sys.delay)
//push zeroes
@1
D=A
@nargs
M=D
(PUSH151)
@nargs
D=M
@NOTPUSH151
D;JEQ
D=0
@SP
A=M
M=D
@SP
M=M+1
@nargs
M=M-1
@PUSH151
0; JMP
(NOTPUSH151)
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// label command
(Sys.delay$WHILE1_0)
// push local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// eq
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@EQUAL152
D;JEQ
@NOTEQUAL152
0;JMP
(EQUAL152)
D=-1
@CONTINUE152
0;JMP
(NOTEQUAL152)
D=0
@CONTINUE152
0;JMP
(CONTINUE152)
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// if-goto command
@SP
M=M-1
@SP
A=M
D=M
@Sys.delay$WHILE2_0
D; JNE
// push local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// sub
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@SP
A=M
M=D
@SP
M=M+1
// pop local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// goto command
@Sys.delay$WHILE1_0
0; JMP
// label command
(Sys.delay$WHILE2_0)
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// return
// save LCL in end frame variable endFrame
@LCL
D=M
@endFrame
M=D
// save return address in variable retAddress
@5
D=A
@endFrame
D=M-D
A=D
D=M
@retAddress
M=D
// reposition return value for the caller
@SP
M=M-1
@SP
A=M
D=M
@ARG
A=M
M=D
// reposition SP
@ARG
D=M+1
@SP
M=D
// recover segments
// recover THAT
@endFrame
D=M-1
A=D
D=M
@THAT
M=D
// recover THIS
@2
D=A
@endFrame
D=M-D
A=D
D=M
@THIS
M=D
// recover ARG
@3
D=A
@endFrame
D=M-D
A=D
D=M
@ARG
M=D
// recover LCL
@4
D=A
@endFrame
D=M-D
A=D
D=M
@LCL
M=D
// actual return
@retAddress
A=M
0;JMP
// function Sys.error 0
(Sys.error)
//push zeroes
@0
D=A
@nargs
M=D
(PUSH153)
@nargs
D=M
@NOTPUSH153
D;JEQ
D=0
@SP
A=M
M=D
@SP
M=M+1
@nargs
M=M-1
@PUSH153
0; JMP
(NOTPUSH153)
// push constant 3
@3
D=A
@SP
A=M
M=D
@SP
M=M+1
// call String.new 1
//push return address
@Sys.error$ret.0
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@6
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@String.new
0;JMP
// continue after call
(Sys.error$ret.0)
// push constant 69
@69
D=A
@SP
A=M
M=D
@SP
M=M+1
// call String.appendChar 2
//push return address
@Sys.error$ret.1
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@7
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@String.appendChar
0;JMP
// continue after call
(Sys.error$ret.1)
// push constant 82
@82
D=A
@SP
A=M
M=D
@SP
M=M+1
// call String.appendChar 2
//push return address
@Sys.error$ret.2
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@7
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@String.appendChar
0;JMP
// continue after call
(Sys.error$ret.2)
// push constant 82
@82
D=A
@SP
A=M
M=D
@SP
M=M+1
// call String.appendChar 2
//push return address
@Sys.error$ret.3
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@7
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@String.appendChar
0;JMP
// continue after call
(Sys.error$ret.3)
// call Output.printString 1
//push return address
@Sys.error$ret.4
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@6
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Output.printString
0;JMP
// continue after call
(Sys.error$ret.4)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Output.printInt 1
//push return address
@Sys.error$ret.5
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@6
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Output.printInt
0;JMP
// continue after call
(Sys.error$ret.5)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// call Sys.halt 0
//push return address
@Sys.error$ret.6
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@5
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Sys.halt
0;JMP
// continue after call
(Sys.error$ret.6)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// return
// save LCL in end frame variable endFrame
@LCL
D=M
@endFrame
M=D
// save return address in variable retAddress
@5
D=A
@endFrame
D=M-D
A=D
D=M
@retAddress
M=D
// reposition return value for the caller
@SP
M=M-1
@SP
A=M
D=M
@ARG
A=M
M=D
// reposition SP
@ARG
D=M+1
@SP
M=D
// recover segments
// recover THAT
@endFrame
D=M-1
A=D
D=M
@THAT
M=D
// recover THIS
@2
D=A
@endFrame
D=M-D
A=D
D=M
@THIS
M=D
// recover ARG
@3
D=A
@endFrame
D=M-D
A=D
D=M
@ARG
M=D
// recover LCL
@4
D=A
@endFrame
D=M-D
A=D
D=M
@LCL
M=D
// actual return
@retAddress
A=M
0;JMP
// function Ball.new 0
(Ball.new)
//push zeroes
@0
D=A
@nargs
M=D
(PUSH154)
@nargs
D=M
@NOTPUSH154
D;JEQ
D=0
@SP
A=M
M=D
@SP
M=M+1
@nargs
M=M-1
@PUSH154
0; JMP
(NOTPUSH154)
// push constant 15
@15
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Memory.alloc 1
//push return address
@Ball.new$ret.0
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@6
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Memory.alloc
0;JMP
// continue after call
(Ball.new$ret.0)
// pop pointer 0
@SP
M=M-1
@SP
A=M
D=M
@R3
M=D
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop this 0
@0
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push argument 1
@1
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop this 1
@1
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push argument 2
@2
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop this 10
@10
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push argument 3
@3
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 6
@6
D=A
@SP
A=M
M=D
@SP
M=M+1
// sub
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@SP
A=M
M=D
@SP
M=M+1
// pop this 11
@11
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push argument 4
@4
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop this 12
@12
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push argument 5
@5
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 6
@6
D=A
@SP
A=M
M=D
@SP
M=M+1
// sub
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@SP
A=M
M=D
@SP
M=M+1
// pop this 13
@13
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop this 14
@14
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push pointer 0
@R3
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Ball.show 1
//push return address
@Ball.new$ret.1
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@6
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Ball.show
0;JMP
// continue after call
(Ball.new$ret.1)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push pointer 0
@R3
D=M
@SP
A=M
M=D
@SP
M=M+1
// return
// save LCL in end frame variable endFrame
@LCL
D=M
@endFrame
M=D
// save return address in variable retAddress
@5
D=A
@endFrame
D=M-D
A=D
D=M
@retAddress
M=D
// reposition return value for the caller
@SP
M=M-1
@SP
A=M
D=M
@ARG
A=M
M=D
// reposition SP
@ARG
D=M+1
@SP
M=D
// recover segments
// recover THAT
@endFrame
D=M-1
A=D
D=M
@THAT
M=D
// recover THIS
@2
D=A
@endFrame
D=M-D
A=D
D=M
@THIS
M=D
// recover ARG
@3
D=A
@endFrame
D=M-D
A=D
D=M
@ARG
M=D
// recover LCL
@4
D=A
@endFrame
D=M-D
A=D
D=M
@LCL
M=D
// actual return
@retAddress
A=M
0;JMP
// function Ball.dispose 0
(Ball.dispose)
//push zeroes
@0
D=A
@nargs
M=D
(PUSH155)
@nargs
D=M
@NOTPUSH155
D;JEQ
D=0
@SP
A=M
M=D
@SP
M=M+1
@nargs
M=M-1
@PUSH155
0; JMP
(NOTPUSH155)
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop pointer 0
@SP
M=M-1
@SP
A=M
D=M
@R3
M=D
// push pointer 0
@R3
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Memory.deAlloc 1
//push return address
@Ball.dispose$ret.0
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@6
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Memory.deAlloc
0;JMP
// continue after call
(Ball.dispose$ret.0)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// return
// save LCL in end frame variable endFrame
@LCL
D=M
@endFrame
M=D
// save return address in variable retAddress
@5
D=A
@endFrame
D=M-D
A=D
D=M
@retAddress
M=D
// reposition return value for the caller
@SP
M=M-1
@SP
A=M
D=M
@ARG
A=M
M=D
// reposition SP
@ARG
D=M+1
@SP
M=D
// recover segments
// recover THAT
@endFrame
D=M-1
A=D
D=M
@THAT
M=D
// recover THIS
@2
D=A
@endFrame
D=M-D
A=D
D=M
@THIS
M=D
// recover ARG
@3
D=A
@endFrame
D=M-D
A=D
D=M
@ARG
M=D
// recover LCL
@4
D=A
@endFrame
D=M-D
A=D
D=M
@LCL
M=D
// actual return
@retAddress
A=M
0;JMP
// function Ball.show 0
(Ball.show)
//push zeroes
@0
D=A
@nargs
M=D
(PUSH156)
@nargs
D=M
@NOTPUSH156
D;JEQ
D=0
@SP
A=M
M=D
@SP
M=M+1
@nargs
M=M-1
@PUSH156
0; JMP
(NOTPUSH156)
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop pointer 0
@SP
M=M-1
@SP
A=M
D=M
@R3
M=D
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// neg
@SP
M=M-1
@SP
A=M
D=M
D=-D
@SP
A=M
M=D
@SP
M=M+1
// call Screen.setColor 1
//push return address
@Ball.show$ret.0
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@6
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Screen.setColor
0;JMP
// continue after call
(Ball.show$ret.0)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push pointer 0
@R3
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Ball.draw 1
//push return address
@Ball.show$ret.1
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@6
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Ball.draw
0;JMP
// continue after call
(Ball.show$ret.1)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// return
// save LCL in end frame variable endFrame
@LCL
D=M
@endFrame
M=D
// save return address in variable retAddress
@5
D=A
@endFrame
D=M-D
A=D
D=M
@retAddress
M=D
// reposition return value for the caller
@SP
M=M-1
@SP
A=M
D=M
@ARG
A=M
M=D
// reposition SP
@ARG
D=M+1
@SP
M=D
// recover segments
// recover THAT
@endFrame
D=M-1
A=D
D=M
@THAT
M=D
// recover THIS
@2
D=A
@endFrame
D=M-D
A=D
D=M
@THIS
M=D
// recover ARG
@3
D=A
@endFrame
D=M-D
A=D
D=M
@ARG
M=D
// recover LCL
@4
D=A
@endFrame
D=M-D
A=D
D=M
@LCL
M=D
// actual return
@retAddress
A=M
0;JMP
// function Ball.hide 0
(Ball.hide)
//push zeroes
@0
D=A
@nargs
M=D
(PUSH157)
@nargs
D=M
@NOTPUSH157
D;JEQ
D=0
@SP
A=M
M=D
@SP
M=M+1
@nargs
M=M-1
@PUSH157
0; JMP
(NOTPUSH157)
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop pointer 0
@SP
M=M-1
@SP
A=M
D=M
@R3
M=D
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Screen.setColor 1
//push return address
@Ball.hide$ret.0
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@6
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Screen.setColor
0;JMP
// continue after call
(Ball.hide$ret.0)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push pointer 0
@R3
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Ball.draw 1
//push return address
@Ball.hide$ret.1
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@6
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Ball.draw
0;JMP
// continue after call
(Ball.hide$ret.1)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// return
// save LCL in end frame variable endFrame
@LCL
D=M
@endFrame
M=D
// save return address in variable retAddress
@5
D=A
@endFrame
D=M-D
A=D
D=M
@retAddress
M=D
// reposition return value for the caller
@SP
M=M-1
@SP
A=M
D=M
@ARG
A=M
M=D
// reposition SP
@ARG
D=M+1
@SP
M=D
// recover segments
// recover THAT
@endFrame
D=M-1
A=D
D=M
@THAT
M=D
// recover THIS
@2
D=A
@endFrame
D=M-D
A=D
D=M
@THIS
M=D
// recover ARG
@3
D=A
@endFrame
D=M-D
A=D
D=M
@ARG
M=D
// recover LCL
@4
D=A
@endFrame
D=M-D
A=D
D=M
@LCL
M=D
// actual return
@retAddress
A=M
0;JMP
// function Ball.draw 0
(Ball.draw)
//push zeroes
@0
D=A
@nargs
M=D
(PUSH158)
@nargs
D=M
@NOTPUSH158
D;JEQ
D=0
@SP
A=M
M=D
@SP
M=M+1
@nargs
M=M-1
@PUSH158
0; JMP
(NOTPUSH158)
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop pointer 0
@SP
M=M-1
@SP
A=M
D=M
@R3
M=D
// push this 0
@0
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push this 1
@1
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push this 0
@0
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 5
@5
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// push this 1
@1
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 5
@5
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// call Screen.drawRectangle 4
//push return address
@Ball.draw$ret.0
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@9
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Screen.drawRectangle
0;JMP
// continue after call
(Ball.draw$ret.0)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// return
// save LCL in end frame variable endFrame
@LCL
D=M
@endFrame
M=D
// save return address in variable retAddress
@5
D=A
@endFrame
D=M-D
A=D
D=M
@retAddress
M=D
// reposition return value for the caller
@SP
M=M-1
@SP
A=M
D=M
@ARG
A=M
M=D
// reposition SP
@ARG
D=M+1
@SP
M=D
// recover segments
// recover THAT
@endFrame
D=M-1
A=D
D=M
@THAT
M=D
// recover THIS
@2
D=A
@endFrame
D=M-D
A=D
D=M
@THIS
M=D
// recover ARG
@3
D=A
@endFrame
D=M-D
A=D
D=M
@ARG
M=D
// recover LCL
@4
D=A
@endFrame
D=M-D
A=D
D=M
@LCL
M=D
// actual return
@retAddress
A=M
0;JMP
// function Ball.getLeft 0
(Ball.getLeft)
//push zeroes
@0
D=A
@nargs
M=D
(PUSH159)
@nargs
D=M
@NOTPUSH159
D;JEQ
D=0
@SP
A=M
M=D
@SP
M=M+1
@nargs
M=M-1
@PUSH159
0; JMP
(NOTPUSH159)
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop pointer 0
@SP
M=M-1
@SP
A=M
D=M
@R3
M=D
// push this 0
@0
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// return
// save LCL in end frame variable endFrame
@LCL
D=M
@endFrame
M=D
// save return address in variable retAddress
@5
D=A
@endFrame
D=M-D
A=D
D=M
@retAddress
M=D
// reposition return value for the caller
@SP
M=M-1
@SP
A=M
D=M
@ARG
A=M
M=D
// reposition SP
@ARG
D=M+1
@SP
M=D
// recover segments
// recover THAT
@endFrame
D=M-1
A=D
D=M
@THAT
M=D
// recover THIS
@2
D=A
@endFrame
D=M-D
A=D
D=M
@THIS
M=D
// recover ARG
@3
D=A
@endFrame
D=M-D
A=D
D=M
@ARG
M=D
// recover LCL
@4
D=A
@endFrame
D=M-D
A=D
D=M
@LCL
M=D
// actual return
@retAddress
A=M
0;JMP
// function Ball.getRight 0
(Ball.getRight)
//push zeroes
@0
D=A
@nargs
M=D
(PUSH160)
@nargs
D=M
@NOTPUSH160
D;JEQ
D=0
@SP
A=M
M=D
@SP
M=M+1
@nargs
M=M-1
@PUSH160
0; JMP
(NOTPUSH160)
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop pointer 0
@SP
M=M-1
@SP
A=M
D=M
@R3
M=D
// push this 0
@0
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 5
@5
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// return
// save LCL in end frame variable endFrame
@LCL
D=M
@endFrame
M=D
// save return address in variable retAddress
@5
D=A
@endFrame
D=M-D
A=D
D=M
@retAddress
M=D
// reposition return value for the caller
@SP
M=M-1
@SP
A=M
D=M
@ARG
A=M
M=D
// reposition SP
@ARG
D=M+1
@SP
M=D
// recover segments
// recover THAT
@endFrame
D=M-1
A=D
D=M
@THAT
M=D
// recover THIS
@2
D=A
@endFrame
D=M-D
A=D
D=M
@THIS
M=D
// recover ARG
@3
D=A
@endFrame
D=M-D
A=D
D=M
@ARG
M=D
// recover LCL
@4
D=A
@endFrame
D=M-D
A=D
D=M
@LCL
M=D
// actual return
@retAddress
A=M
0;JMP
// function Ball.setDestination 3
(Ball.setDestination)
//push zeroes
@3
D=A
@nargs
M=D
(PUSH161)
@nargs
D=M
@NOTPUSH161
D;JEQ
D=0
@SP
A=M
M=D
@SP
M=M+1
@nargs
M=M-1
@PUSH161
0; JMP
(NOTPUSH161)
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop pointer 0
@SP
M=M-1
@SP
A=M
D=M
@R3
M=D
// push argument 1
@1
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push this 0
@0
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// sub
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@SP
A=M
M=D
@SP
M=M+1
// pop this 2
@2
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push argument 2
@2
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push this 1
@1
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// sub
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@SP
A=M
M=D
@SP
M=M+1
// pop this 3
@3
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push this 2
@2
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Math.abs 1
//push return address
@Ball.setDestination$ret.0
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@6
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Math.abs
0;JMP
// continue after call
(Ball.setDestination$ret.0)
// pop local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push this 3
@3
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Math.abs 1
//push return address
@Ball.setDestination$ret.1
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@6
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Math.abs
0;JMP
// continue after call
(Ball.setDestination$ret.1)
// pop local 1
@1
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 1
@1
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@LESS162
D;JLT
@NOTLESS162
0;JMP
(LESS162)
D=-1
@CONTINUE162
0;JMP
(NOTLESS162)
D=0
@CONTINUE162
0;JMP
(CONTINUE162)
@SP
A=M
M=D
@SP
M=M+1
// pop this 7
@7
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push this 7
@7
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// if-goto command
@SP
M=M-1
@SP
A=M
D=M
@Ball.setDestination$IF1_0
D; JNE
// push local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop local 2
@2
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push local 1
@1
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push local 2
@2
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop local 1
@1
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push this 1
@1
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push argument 2
@2
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@LESS163
D;JLT
@NOTLESS163
0;JMP
(LESS163)
D=-1
@CONTINUE163
0;JMP
(NOTLESS163)
D=0
@CONTINUE163
0;JMP
(CONTINUE163)
@SP
A=M
M=D
@SP
M=M+1
// pop this 8
@8
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push this 0
@0
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push argument 1
@1
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@LESS164
D;JLT
@NOTLESS164
0;JMP
(LESS164)
D=-1
@CONTINUE164
0;JMP
(NOTLESS164)
D=0
@CONTINUE164
0;JMP
(CONTINUE164)
@SP
A=M
M=D
@SP
M=M+1
// pop this 9
@9
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// goto command
@Ball.setDestination$IF2_0
0; JMP
// label command
(Ball.setDestination$IF1_0)
// push this 0
@0
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push argument 1
@1
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@LESS165
D;JLT
@NOTLESS165
0;JMP
(LESS165)
D=-1
@CONTINUE165
0;JMP
(NOTLESS165)
D=0
@CONTINUE165
0;JMP
(CONTINUE165)
@SP
A=M
M=D
@SP
M=M+1
// pop this 8
@8
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push this 1
@1
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push argument 2
@2
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@LESS166
D;JLT
@NOTLESS166
0;JMP
(LESS166)
D=-1
@CONTINUE166
0;JMP
(NOTLESS166)
D=0
@CONTINUE166
0;JMP
(CONTINUE166)
@SP
A=M
M=D
@SP
M=M+1
// pop this 9
@9
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// label command
(Ball.setDestination$IF2_0)
// push constant 2
@2
D=A
@SP
A=M
M=D
@SP
M=M+1
// push local 1
@1
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Math.multiply 2
//push return address
@Ball.setDestination$ret.2
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@7
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Math.multiply
0;JMP
// continue after call
(Ball.setDestination$ret.2)
// push local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// sub
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@SP
A=M
M=D
@SP
M=M+1
// pop this 4
@4
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push constant 2
@2
D=A
@SP
A=M
M=D
@SP
M=M+1
// push local 1
@1
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Math.multiply 2
//push return address
@Ball.setDestination$ret.3
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@7
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Math.multiply
0;JMP
// continue after call
(Ball.setDestination$ret.3)
// pop this 5
@5
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push constant 2
@2
D=A
@SP
A=M
M=D
@SP
M=M+1
// push local 1
@1
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// sub
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@SP
A=M
M=D
@SP
M=M+1
// call Math.multiply 2
//push return address
@Ball.setDestination$ret.4
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@7
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Math.multiply
0;JMP
// continue after call
(Ball.setDestination$ret.4)
// pop this 6
@6
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// return
// save LCL in end frame variable endFrame
@LCL
D=M
@endFrame
M=D
// save return address in variable retAddress
@5
D=A
@endFrame
D=M-D
A=D
D=M
@retAddress
M=D
// reposition return value for the caller
@SP
M=M-1
@SP
A=M
D=M
@ARG
A=M
M=D
// reposition SP
@ARG
D=M+1
@SP
M=D
// recover segments
// recover THAT
@endFrame
D=M-1
A=D
D=M
@THAT
M=D
// recover THIS
@2
D=A
@endFrame
D=M-D
A=D
D=M
@THIS
M=D
// recover ARG
@3
D=A
@endFrame
D=M-D
A=D
D=M
@ARG
M=D
// recover LCL
@4
D=A
@endFrame
D=M-D
A=D
D=M
@LCL
M=D
// actual return
@retAddress
A=M
0;JMP
// function Ball.move 0
(Ball.move)
//push zeroes
@0
D=A
@nargs
M=D
(PUSH167)
@nargs
D=M
@NOTPUSH167
D;JEQ
D=0
@SP
A=M
M=D
@SP
M=M+1
@nargs
M=M-1
@PUSH167
0; JMP
(NOTPUSH167)
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop pointer 0
@SP
M=M-1
@SP
A=M
D=M
@R3
M=D
// push pointer 0
@R3
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Ball.hide 1
//push return address
@Ball.move$ret.0
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@6
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Ball.hide
0;JMP
// continue after call
(Ball.move$ret.0)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push this 4
@4
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@LESS168
D;JLT
@NOTLESS168
0;JMP
(LESS168)
D=-1
@CONTINUE168
0;JMP
(NOTLESS168)
D=0
@CONTINUE168
0;JMP
(CONTINUE168)
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// if-goto command
@SP
M=M-1
@SP
A=M
D=M
@Ball.move$IF1_0
D; JNE
// push this 4
@4
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push this 5
@5
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// pop this 4
@4
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// goto command
@Ball.move$IF2_0
0; JMP
// label command
(Ball.move$IF1_0)
// push this 4
@4
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push this 6
@6
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// pop this 4
@4
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push this 9
@9
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// if-goto command
@SP
M=M-1
@SP
A=M
D=M
@Ball.move$IF1_1
D; JNE
// push this 7
@7
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// if-goto command
@SP
M=M-1
@SP
A=M
D=M
@Ball.move$IF1_2
D; JNE
// push this 0
@0
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 4
@4
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// pop this 0
@0
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// goto command
@Ball.move$IF2_2
0; JMP
// label command
(Ball.move$IF1_2)
// push this 1
@1
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 4
@4
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// pop this 1
@1
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// label command
(Ball.move$IF2_2)
// goto command
@Ball.move$IF2_1
0; JMP
// label command
(Ball.move$IF1_1)
// push this 7
@7
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// if-goto command
@SP
M=M-1
@SP
A=M
D=M
@Ball.move$IF1_3
D; JNE
// push this 0
@0
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 4
@4
D=A
@SP
A=M
M=D
@SP
M=M+1
// sub
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@SP
A=M
M=D
@SP
M=M+1
// pop this 0
@0
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// goto command
@Ball.move$IF2_3
0; JMP
// label command
(Ball.move$IF1_3)
// push this 1
@1
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 4
@4
D=A
@SP
A=M
M=D
@SP
M=M+1
// sub
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@SP
A=M
M=D
@SP
M=M+1
// pop this 1
@1
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// label command
(Ball.move$IF2_3)
// label command
(Ball.move$IF2_1)
// label command
(Ball.move$IF2_0)
// push this 8
@8
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// if-goto command
@SP
M=M-1
@SP
A=M
D=M
@Ball.move$IF1_4
D; JNE
// push this 7
@7
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// if-goto command
@SP
M=M-1
@SP
A=M
D=M
@Ball.move$IF1_5
D; JNE
// push this 1
@1
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 4
@4
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// pop this 1
@1
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// goto command
@Ball.move$IF2_5
0; JMP
// label command
(Ball.move$IF1_5)
// push this 0
@0
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 4
@4
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// pop this 0
@0
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// label command
(Ball.move$IF2_5)
// goto command
@Ball.move$IF2_4
0; JMP
// label command
(Ball.move$IF1_4)
// push this 7
@7
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// if-goto command
@SP
M=M-1
@SP
A=M
D=M
@Ball.move$IF1_6
D; JNE
// push this 1
@1
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 4
@4
D=A
@SP
A=M
M=D
@SP
M=M+1
// sub
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@SP
A=M
M=D
@SP
M=M+1
// pop this 1
@1
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// goto command
@Ball.move$IF2_6
0; JMP
// label command
(Ball.move$IF1_6)
// push this 0
@0
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 4
@4
D=A
@SP
A=M
M=D
@SP
M=M+1
// sub
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@SP
A=M
M=D
@SP
M=M+1
// pop this 0
@0
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// label command
(Ball.move$IF2_6)
// label command
(Ball.move$IF2_4)
// push this 0
@0
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push this 10
@10
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// gt
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@GREATER169
D;JGT
@NOTGREATER169
0;JMP
(GREATER169)
D=-1
@CONTINUE169
0;JMP
(NOTGREATER169)
D=0
@CONTINUE169
0;JMP
(CONTINUE169)
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// if-goto command
@SP
M=M-1
@SP
A=M
D=M
@Ball.move$IF1_7
D; JNE
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop this 14
@14
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push this 10
@10
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop this 0
@0
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// goto command
@Ball.move$IF2_7
0; JMP
// label command
(Ball.move$IF1_7)
// label command
(Ball.move$IF2_7)
// push this 0
@0
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push this 11
@11
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@LESS170
D;JLT
@NOTLESS170
0;JMP
(LESS170)
D=-1
@CONTINUE170
0;JMP
(NOTLESS170)
D=0
@CONTINUE170
0;JMP
(CONTINUE170)
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// if-goto command
@SP
M=M-1
@SP
A=M
D=M
@Ball.move$IF1_8
D; JNE
// push constant 2
@2
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop this 14
@14
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push this 11
@11
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop this 0
@0
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// goto command
@Ball.move$IF2_8
0; JMP
// label command
(Ball.move$IF1_8)
// label command
(Ball.move$IF2_8)
// push this 1
@1
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push this 12
@12
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// gt
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@GREATER171
D;JGT
@NOTGREATER171
0;JMP
(GREATER171)
D=-1
@CONTINUE171
0;JMP
(NOTGREATER171)
D=0
@CONTINUE171
0;JMP
(CONTINUE171)
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// if-goto command
@SP
M=M-1
@SP
A=M
D=M
@Ball.move$IF1_9
D; JNE
// push constant 3
@3
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop this 14
@14
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push this 12
@12
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop this 1
@1
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// goto command
@Ball.move$IF2_9
0; JMP
// label command
(Ball.move$IF1_9)
// label command
(Ball.move$IF2_9)
// push this 1
@1
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push this 13
@13
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@LESS172
D;JLT
@NOTLESS172
0;JMP
(LESS172)
D=-1
@CONTINUE172
0;JMP
(NOTLESS172)
D=0
@CONTINUE172
0;JMP
(CONTINUE172)
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// if-goto command
@SP
M=M-1
@SP
A=M
D=M
@Ball.move$IF1_10
D; JNE
// push constant 4
@4
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop this 14
@14
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push this 13
@13
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop this 1
@1
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// goto command
@Ball.move$IF2_10
0; JMP
// label command
(Ball.move$IF1_10)
// label command
(Ball.move$IF2_10)
// push pointer 0
@R3
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Ball.show 1
//push return address
@Ball.move$ret.1
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@6
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Ball.show
0;JMP
// continue after call
(Ball.move$ret.1)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push this 14
@14
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// return
// save LCL in end frame variable endFrame
@LCL
D=M
@endFrame
M=D
// save return address in variable retAddress
@5
D=A
@endFrame
D=M-D
A=D
D=M
@retAddress
M=D
// reposition return value for the caller
@SP
M=M-1
@SP
A=M
D=M
@ARG
A=M
M=D
// reposition SP
@ARG
D=M+1
@SP
M=D
// recover segments
// recover THAT
@endFrame
D=M-1
A=D
D=M
@THAT
M=D
// recover THIS
@2
D=A
@endFrame
D=M-D
A=D
D=M
@THIS
M=D
// recover ARG
@3
D=A
@endFrame
D=M-D
A=D
D=M
@ARG
M=D
// recover LCL
@4
D=A
@endFrame
D=M-D
A=D
D=M
@LCL
M=D
// actual return
@retAddress
A=M
0;JMP
// function Ball.bounce 5
(Ball.bounce)
//push zeroes
@5
D=A
@nargs
M=D
(PUSH173)
@nargs
D=M
@NOTPUSH173
D;JEQ
D=0
@SP
A=M
M=D
@SP
M=M+1
@nargs
M=M-1
@PUSH173
0; JMP
(NOTPUSH173)
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop pointer 0
@SP
M=M-1
@SP
A=M
D=M
@R3
M=D
// push this 2
@2
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 10
@10
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Math.divide 2
//push return address
@Ball.bounce$ret.0
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@7
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Math.divide
0;JMP
// continue after call
(Ball.bounce$ret.0)
// pop local 2
@2
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push this 3
@3
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 10
@10
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Math.divide 2
//push return address
@Ball.bounce$ret.1
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@7
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Math.divide
0;JMP
// continue after call
(Ball.bounce$ret.1)
// pop local 3
@3
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push argument 1
@1
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// eq
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@EQUAL174
D;JEQ
@NOTEQUAL174
0;JMP
(EQUAL174)
D=-1
@CONTINUE174
0;JMP
(NOTEQUAL174)
D=0
@CONTINUE174
0;JMP
(CONTINUE174)
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// if-goto command
@SP
M=M-1
@SP
A=M
D=M
@Ball.bounce$IF1_0
D; JNE
// push constant 10
@10
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop local 4
@4
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// goto command
@Ball.bounce$IF2_0
0; JMP
// label command
(Ball.bounce$IF1_0)
// push this 2
@2
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@LESS175
D;JLT
@NOTLESS175
0;JMP
(LESS175)
D=-1
@CONTINUE175
0;JMP
(NOTLESS175)
D=0
@CONTINUE175
0;JMP
(CONTINUE175)
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// push argument 1
@1
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// eq
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@EQUAL176
D;JEQ
@NOTEQUAL176
0;JMP
(EQUAL176)
D=-1
@CONTINUE176
0;JMP
(NOTEQUAL176)
D=0
@CONTINUE176
0;JMP
(CONTINUE176)
@SP
A=M
M=D
@SP
M=M+1
// and
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D&M
@SP
A=M
M=D
@SP
M=M+1
// push this 2
@2
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@LESS177
D;JLT
@NOTLESS177
0;JMP
(LESS177)
D=-1
@CONTINUE177
0;JMP
(NOTLESS177)
D=0
@CONTINUE177
0;JMP
(CONTINUE177)
@SP
A=M
M=D
@SP
M=M+1
// push argument 1
@1
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// neg
@SP
M=M-1
@SP
A=M
D=M
D=-D
@SP
A=M
M=D
@SP
M=M+1
// eq
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@EQUAL178
D;JEQ
@NOTEQUAL178
0;JMP
(EQUAL178)
D=-1
@CONTINUE178
0;JMP
(NOTEQUAL178)
D=0
@CONTINUE178
0;JMP
(CONTINUE178)
@SP
A=M
M=D
@SP
M=M+1
// and
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D&M
@SP
A=M
M=D
@SP
M=M+1
// or
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D|M
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// if-goto command
@SP
M=M-1
@SP
A=M
D=M
@Ball.bounce$IF1_1
D; JNE
// push constant 20
@20
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop local 4
@4
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// goto command
@Ball.bounce$IF2_1
0; JMP
// label command
(Ball.bounce$IF1_1)
// push constant 5
@5
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop local 4
@4
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// label command
(Ball.bounce$IF2_1)
// label command
(Ball.bounce$IF2_0)
// push this 14
@14
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// eq
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@EQUAL179
D;JEQ
@NOTEQUAL179
0;JMP
(EQUAL179)
D=-1
@CONTINUE179
0;JMP
(NOTEQUAL179)
D=0
@CONTINUE179
0;JMP
(CONTINUE179)
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// if-goto command
@SP
M=M-1
@SP
A=M
D=M
@Ball.bounce$IF1_2
D; JNE
// push constant 506
@506
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push local 3
@3
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 50
@50
D=A
@SP
A=M
M=D
@SP
M=M+1
// neg
@SP
M=M-1
@SP
A=M
D=M
D=-D
@SP
A=M
M=D
@SP
M=M+1
// call Math.multiply 2
//push return address
@Ball.bounce$ret.2
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@7
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Math.multiply
0;JMP
// continue after call
(Ball.bounce$ret.2)
// push local 2
@2
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Math.divide 2
//push return address
@Ball.bounce$ret.3
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@7
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Math.divide
0;JMP
// continue after call
(Ball.bounce$ret.3)
// pop local 1
@1
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push this 1
@1
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 1
@1
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 4
@4
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Math.multiply 2
//push return address
@Ball.bounce$ret.4
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@7
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Math.multiply
0;JMP
// continue after call
(Ball.bounce$ret.4)
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// pop local 1
@1
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// goto command
@Ball.bounce$IF2_2
0; JMP
// label command
(Ball.bounce$IF1_2)
// push this 14
@14
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 2
@2
D=A
@SP
A=M
M=D
@SP
M=M+1
// eq
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@EQUAL180
D;JEQ
@NOTEQUAL180
0;JMP
(EQUAL180)
D=-1
@CONTINUE180
0;JMP
(NOTEQUAL180)
D=0
@CONTINUE180
0;JMP
(CONTINUE180)
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// if-goto command
@SP
M=M-1
@SP
A=M
D=M
@Ball.bounce$IF1_3
D; JNE
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push local 3
@3
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 50
@50
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Math.multiply 2
//push return address
@Ball.bounce$ret.5
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@7
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Math.multiply
0;JMP
// continue after call
(Ball.bounce$ret.5)
// push local 2
@2
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Math.divide 2
//push return address
@Ball.bounce$ret.6
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@7
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Math.divide
0;JMP
// continue after call
(Ball.bounce$ret.6)
// pop local 1
@1
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push this 1
@1
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 1
@1
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 4
@4
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Math.multiply 2
//push return address
@Ball.bounce$ret.7
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@7
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Math.multiply
0;JMP
// continue after call
(Ball.bounce$ret.7)
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// pop local 1
@1
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// goto command
@Ball.bounce$IF2_3
0; JMP
// label command
(Ball.bounce$IF1_3)
// push this 14
@14
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 3
@3
D=A
@SP
A=M
M=D
@SP
M=M+1
// eq
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@EQUAL181
D;JEQ
@NOTEQUAL181
0;JMP
(EQUAL181)
D=-1
@CONTINUE181
0;JMP
(NOTEQUAL181)
D=0
@CONTINUE181
0;JMP
(CONTINUE181)
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// if-goto command
@SP
M=M-1
@SP
A=M
D=M
@Ball.bounce$IF1_4
D; JNE
// push constant 250
@250
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop local 1
@1
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push local 2
@2
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 25
@25
D=A
@SP
A=M
M=D
@SP
M=M+1
// neg
@SP
M=M-1
@SP
A=M
D=M
D=-D
@SP
A=M
M=D
@SP
M=M+1
// call Math.multiply 2
//push return address
@Ball.bounce$ret.8
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@7
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Math.multiply
0;JMP
// continue after call
(Ball.bounce$ret.8)
// push local 3
@3
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Math.divide 2
//push return address
@Ball.bounce$ret.9
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@7
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Math.divide
0;JMP
// continue after call
(Ball.bounce$ret.9)
// pop local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push this 0
@0
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 4
@4
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Math.multiply 2
//push return address
@Ball.bounce$ret.10
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@7
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Math.multiply
0;JMP
// continue after call
(Ball.bounce$ret.10)
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// pop local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// goto command
@Ball.bounce$IF2_4
0; JMP
// label command
(Ball.bounce$IF1_4)
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop local 1
@1
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push local 2
@2
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 25
@25
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Math.multiply 2
//push return address
@Ball.bounce$ret.11
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@7
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Math.multiply
0;JMP
// continue after call
(Ball.bounce$ret.11)
// push local 3
@3
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Math.divide 2
//push return address
@Ball.bounce$ret.12
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@7
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Math.divide
0;JMP
// continue after call
(Ball.bounce$ret.12)
// pop local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push this 0
@0
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 4
@4
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Math.multiply 2
//push return address
@Ball.bounce$ret.13
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@7
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Math.multiply
0;JMP
// continue after call
(Ball.bounce$ret.13)
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// pop local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// label command
(Ball.bounce$IF2_4)
// label command
(Ball.bounce$IF2_3)
// label command
(Ball.bounce$IF2_2)
// push pointer 0
@R3
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 1
@1
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Ball.setDestination 3
//push return address
@Ball.bounce$ret.14
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@8
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Ball.setDestination
0;JMP
// continue after call
(Ball.bounce$ret.14)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// return
// save LCL in end frame variable endFrame
@LCL
D=M
@endFrame
M=D
// save return address in variable retAddress
@5
D=A
@endFrame
D=M-D
A=D
D=M
@retAddress
M=D
// reposition return value for the caller
@SP
M=M-1
@SP
A=M
D=M
@ARG
A=M
M=D
// reposition SP
@ARG
D=M+1
@SP
M=D
// recover segments
// recover THAT
@endFrame
D=M-1
A=D
D=M
@THAT
M=D
// recover THIS
@2
D=A
@endFrame
D=M-D
A=D
D=M
@THIS
M=D
// recover ARG
@3
D=A
@endFrame
D=M-D
A=D
D=M
@ARG
M=D
// recover LCL
@4
D=A
@endFrame
D=M-D
A=D
D=M
@LCL
M=D
// actual return
@retAddress
A=M
0;JMP
// function Bat.new 0
(Bat.new)
//push zeroes
@0
D=A
@nargs
M=D
(PUSH182)
@nargs
D=M
@NOTPUSH182
D;JEQ
D=0
@SP
A=M
M=D
@SP
M=M+1
@nargs
M=M-1
@PUSH182
0; JMP
(NOTPUSH182)
// push constant 5
@5
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Memory.alloc 1
//push return address
@Bat.new$ret.0
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@6
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Memory.alloc
0;JMP
// continue after call
(Bat.new$ret.0)
// pop pointer 0
@SP
M=M-1
@SP
A=M
D=M
@R3
M=D
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop this 0
@0
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push argument 1
@1
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop this 1
@1
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push argument 2
@2
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop this 2
@2
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push argument 3
@3
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop this 3
@3
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push constant 2
@2
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop this 4
@4
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push pointer 0
@R3
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Bat.show 1
//push return address
@Bat.new$ret.1
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@6
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Bat.show
0;JMP
// continue after call
(Bat.new$ret.1)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push pointer 0
@R3
D=M
@SP
A=M
M=D
@SP
M=M+1
// return
// save LCL in end frame variable endFrame
@LCL
D=M
@endFrame
M=D
// save return address in variable retAddress
@5
D=A
@endFrame
D=M-D
A=D
D=M
@retAddress
M=D
// reposition return value for the caller
@SP
M=M-1
@SP
A=M
D=M
@ARG
A=M
M=D
// reposition SP
@ARG
D=M+1
@SP
M=D
// recover segments
// recover THAT
@endFrame
D=M-1
A=D
D=M
@THAT
M=D
// recover THIS
@2
D=A
@endFrame
D=M-D
A=D
D=M
@THIS
M=D
// recover ARG
@3
D=A
@endFrame
D=M-D
A=D
D=M
@ARG
M=D
// recover LCL
@4
D=A
@endFrame
D=M-D
A=D
D=M
@LCL
M=D
// actual return
@retAddress
A=M
0;JMP
// function Bat.dispose 0
(Bat.dispose)
//push zeroes
@0
D=A
@nargs
M=D
(PUSH183)
@nargs
D=M
@NOTPUSH183
D;JEQ
D=0
@SP
A=M
M=D
@SP
M=M+1
@nargs
M=M-1
@PUSH183
0; JMP
(NOTPUSH183)
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop pointer 0
@SP
M=M-1
@SP
A=M
D=M
@R3
M=D
// push pointer 0
@R3
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Memory.deAlloc 1
//push return address
@Bat.dispose$ret.0
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@6
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Memory.deAlloc
0;JMP
// continue after call
(Bat.dispose$ret.0)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// return
// save LCL in end frame variable endFrame
@LCL
D=M
@endFrame
M=D
// save return address in variable retAddress
@5
D=A
@endFrame
D=M-D
A=D
D=M
@retAddress
M=D
// reposition return value for the caller
@SP
M=M-1
@SP
A=M
D=M
@ARG
A=M
M=D
// reposition SP
@ARG
D=M+1
@SP
M=D
// recover segments
// recover THAT
@endFrame
D=M-1
A=D
D=M
@THAT
M=D
// recover THIS
@2
D=A
@endFrame
D=M-D
A=D
D=M
@THIS
M=D
// recover ARG
@3
D=A
@endFrame
D=M-D
A=D
D=M
@ARG
M=D
// recover LCL
@4
D=A
@endFrame
D=M-D
A=D
D=M
@LCL
M=D
// actual return
@retAddress
A=M
0;JMP
// function Bat.show 0
(Bat.show)
//push zeroes
@0
D=A
@nargs
M=D
(PUSH184)
@nargs
D=M
@NOTPUSH184
D;JEQ
D=0
@SP
A=M
M=D
@SP
M=M+1
@nargs
M=M-1
@PUSH184
0; JMP
(NOTPUSH184)
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop pointer 0
@SP
M=M-1
@SP
A=M
D=M
@R3
M=D
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// neg
@SP
M=M-1
@SP
A=M
D=M
D=-D
@SP
A=M
M=D
@SP
M=M+1
// call Screen.setColor 1
//push return address
@Bat.show$ret.0
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@6
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Screen.setColor
0;JMP
// continue after call
(Bat.show$ret.0)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push pointer 0
@R3
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Bat.draw 1
//push return address
@Bat.show$ret.1
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@6
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Bat.draw
0;JMP
// continue after call
(Bat.show$ret.1)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// return
// save LCL in end frame variable endFrame
@LCL
D=M
@endFrame
M=D
// save return address in variable retAddress
@5
D=A
@endFrame
D=M-D
A=D
D=M
@retAddress
M=D
// reposition return value for the caller
@SP
M=M-1
@SP
A=M
D=M
@ARG
A=M
M=D
// reposition SP
@ARG
D=M+1
@SP
M=D
// recover segments
// recover THAT
@endFrame
D=M-1
A=D
D=M
@THAT
M=D
// recover THIS
@2
D=A
@endFrame
D=M-D
A=D
D=M
@THIS
M=D
// recover ARG
@3
D=A
@endFrame
D=M-D
A=D
D=M
@ARG
M=D
// recover LCL
@4
D=A
@endFrame
D=M-D
A=D
D=M
@LCL
M=D
// actual return
@retAddress
A=M
0;JMP
// function Bat.hide 0
(Bat.hide)
//push zeroes
@0
D=A
@nargs
M=D
(PUSH185)
@nargs
D=M
@NOTPUSH185
D;JEQ
D=0
@SP
A=M
M=D
@SP
M=M+1
@nargs
M=M-1
@PUSH185
0; JMP
(NOTPUSH185)
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop pointer 0
@SP
M=M-1
@SP
A=M
D=M
@R3
M=D
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Screen.setColor 1
//push return address
@Bat.hide$ret.0
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@6
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Screen.setColor
0;JMP
// continue after call
(Bat.hide$ret.0)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push pointer 0
@R3
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Bat.draw 1
//push return address
@Bat.hide$ret.1
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@6
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Bat.draw
0;JMP
// continue after call
(Bat.hide$ret.1)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// return
// save LCL in end frame variable endFrame
@LCL
D=M
@endFrame
M=D
// save return address in variable retAddress
@5
D=A
@endFrame
D=M-D
A=D
D=M
@retAddress
M=D
// reposition return value for the caller
@SP
M=M-1
@SP
A=M
D=M
@ARG
A=M
M=D
// reposition SP
@ARG
D=M+1
@SP
M=D
// recover segments
// recover THAT
@endFrame
D=M-1
A=D
D=M
@THAT
M=D
// recover THIS
@2
D=A
@endFrame
D=M-D
A=D
D=M
@THIS
M=D
// recover ARG
@3
D=A
@endFrame
D=M-D
A=D
D=M
@ARG
M=D
// recover LCL
@4
D=A
@endFrame
D=M-D
A=D
D=M
@LCL
M=D
// actual return
@retAddress
A=M
0;JMP
// function Bat.draw 0
(Bat.draw)
//push zeroes
@0
D=A
@nargs
M=D
(PUSH186)
@nargs
D=M
@NOTPUSH186
D;JEQ
D=0
@SP
A=M
M=D
@SP
M=M+1
@nargs
M=M-1
@PUSH186
0; JMP
(NOTPUSH186)
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop pointer 0
@SP
M=M-1
@SP
A=M
D=M
@R3
M=D
// push this 0
@0
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push this 1
@1
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push this 0
@0
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push this 2
@2
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// push this 1
@1
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push this 3
@3
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// call Screen.drawRectangle 4
//push return address
@Bat.draw$ret.0
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@9
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Screen.drawRectangle
0;JMP
// continue after call
(Bat.draw$ret.0)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// return
// save LCL in end frame variable endFrame
@LCL
D=M
@endFrame
M=D
// save return address in variable retAddress
@5
D=A
@endFrame
D=M-D
A=D
D=M
@retAddress
M=D
// reposition return value for the caller
@SP
M=M-1
@SP
A=M
D=M
@ARG
A=M
M=D
// reposition SP
@ARG
D=M+1
@SP
M=D
// recover segments
// recover THAT
@endFrame
D=M-1
A=D
D=M
@THAT
M=D
// recover THIS
@2
D=A
@endFrame
D=M-D
A=D
D=M
@THIS
M=D
// recover ARG
@3
D=A
@endFrame
D=M-D
A=D
D=M
@ARG
M=D
// recover LCL
@4
D=A
@endFrame
D=M-D
A=D
D=M
@LCL
M=D
// actual return
@retAddress
A=M
0;JMP
// function Bat.setDirection 0
(Bat.setDirection)
//push zeroes
@0
D=A
@nargs
M=D
(PUSH187)
@nargs
D=M
@NOTPUSH187
D;JEQ
D=0
@SP
A=M
M=D
@SP
M=M+1
@nargs
M=M-1
@PUSH187
0; JMP
(NOTPUSH187)
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop pointer 0
@SP
M=M-1
@SP
A=M
D=M
@R3
M=D
// push argument 1
@1
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop this 4
@4
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// return
// save LCL in end frame variable endFrame
@LCL
D=M
@endFrame
M=D
// save return address in variable retAddress
@5
D=A
@endFrame
D=M-D
A=D
D=M
@retAddress
M=D
// reposition return value for the caller
@SP
M=M-1
@SP
A=M
D=M
@ARG
A=M
M=D
// reposition SP
@ARG
D=M+1
@SP
M=D
// recover segments
// recover THAT
@endFrame
D=M-1
A=D
D=M
@THAT
M=D
// recover THIS
@2
D=A
@endFrame
D=M-D
A=D
D=M
@THIS
M=D
// recover ARG
@3
D=A
@endFrame
D=M-D
A=D
D=M
@ARG
M=D
// recover LCL
@4
D=A
@endFrame
D=M-D
A=D
D=M
@LCL
M=D
// actual return
@retAddress
A=M
0;JMP
// function Bat.getLeft 0
(Bat.getLeft)
//push zeroes
@0
D=A
@nargs
M=D
(PUSH188)
@nargs
D=M
@NOTPUSH188
D;JEQ
D=0
@SP
A=M
M=D
@SP
M=M+1
@nargs
M=M-1
@PUSH188
0; JMP
(NOTPUSH188)
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop pointer 0
@SP
M=M-1
@SP
A=M
D=M
@R3
M=D
// push this 0
@0
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// return
// save LCL in end frame variable endFrame
@LCL
D=M
@endFrame
M=D
// save return address in variable retAddress
@5
D=A
@endFrame
D=M-D
A=D
D=M
@retAddress
M=D
// reposition return value for the caller
@SP
M=M-1
@SP
A=M
D=M
@ARG
A=M
M=D
// reposition SP
@ARG
D=M+1
@SP
M=D
// recover segments
// recover THAT
@endFrame
D=M-1
A=D
D=M
@THAT
M=D
// recover THIS
@2
D=A
@endFrame
D=M-D
A=D
D=M
@THIS
M=D
// recover ARG
@3
D=A
@endFrame
D=M-D
A=D
D=M
@ARG
M=D
// recover LCL
@4
D=A
@endFrame
D=M-D
A=D
D=M
@LCL
M=D
// actual return
@retAddress
A=M
0;JMP
// function Bat.getRight 0
(Bat.getRight)
//push zeroes
@0
D=A
@nargs
M=D
(PUSH189)
@nargs
D=M
@NOTPUSH189
D;JEQ
D=0
@SP
A=M
M=D
@SP
M=M+1
@nargs
M=M-1
@PUSH189
0; JMP
(NOTPUSH189)
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop pointer 0
@SP
M=M-1
@SP
A=M
D=M
@R3
M=D
// push this 0
@0
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push this 2
@2
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// return
// save LCL in end frame variable endFrame
@LCL
D=M
@endFrame
M=D
// save return address in variable retAddress
@5
D=A
@endFrame
D=M-D
A=D
D=M
@retAddress
M=D
// reposition return value for the caller
@SP
M=M-1
@SP
A=M
D=M
@ARG
A=M
M=D
// reposition SP
@ARG
D=M+1
@SP
M=D
// recover segments
// recover THAT
@endFrame
D=M-1
A=D
D=M
@THAT
M=D
// recover THIS
@2
D=A
@endFrame
D=M-D
A=D
D=M
@THIS
M=D
// recover ARG
@3
D=A
@endFrame
D=M-D
A=D
D=M
@ARG
M=D
// recover LCL
@4
D=A
@endFrame
D=M-D
A=D
D=M
@LCL
M=D
// actual return
@retAddress
A=M
0;JMP
// function Bat.setWidth 0
(Bat.setWidth)
//push zeroes
@0
D=A
@nargs
M=D
(PUSH190)
@nargs
D=M
@NOTPUSH190
D;JEQ
D=0
@SP
A=M
M=D
@SP
M=M+1
@nargs
M=M-1
@PUSH190
0; JMP
(NOTPUSH190)
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop pointer 0
@SP
M=M-1
@SP
A=M
D=M
@R3
M=D
// push pointer 0
@R3
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Bat.hide 1
//push return address
@Bat.setWidth$ret.0
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@6
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Bat.hide
0;JMP
// continue after call
(Bat.setWidth$ret.0)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push argument 1
@1
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop this 2
@2
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push pointer 0
@R3
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Bat.show 1
//push return address
@Bat.setWidth$ret.1
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@6
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Bat.show
0;JMP
// continue after call
(Bat.setWidth$ret.1)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// return
// save LCL in end frame variable endFrame
@LCL
D=M
@endFrame
M=D
// save return address in variable retAddress
@5
D=A
@endFrame
D=M-D
A=D
D=M
@retAddress
M=D
// reposition return value for the caller
@SP
M=M-1
@SP
A=M
D=M
@ARG
A=M
M=D
// reposition SP
@ARG
D=M+1
@SP
M=D
// recover segments
// recover THAT
@endFrame
D=M-1
A=D
D=M
@THAT
M=D
// recover THIS
@2
D=A
@endFrame
D=M-D
A=D
D=M
@THIS
M=D
// recover ARG
@3
D=A
@endFrame
D=M-D
A=D
D=M
@ARG
M=D
// recover LCL
@4
D=A
@endFrame
D=M-D
A=D
D=M
@LCL
M=D
// actual return
@retAddress
A=M
0;JMP
// function Bat.move 0
(Bat.move)
//push zeroes
@0
D=A
@nargs
M=D
(PUSH191)
@nargs
D=M
@NOTPUSH191
D;JEQ
D=0
@SP
A=M
M=D
@SP
M=M+1
@nargs
M=M-1
@PUSH191
0; JMP
(NOTPUSH191)
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop pointer 0
@SP
M=M-1
@SP
A=M
D=M
@R3
M=D
// push this 4
@4
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// eq
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@EQUAL192
D;JEQ
@NOTEQUAL192
0;JMP
(EQUAL192)
D=-1
@CONTINUE192
0;JMP
(NOTEQUAL192)
D=0
@CONTINUE192
0;JMP
(CONTINUE192)
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// if-goto command
@SP
M=M-1
@SP
A=M
D=M
@Bat.move$IF1_0
D; JNE
// push this 0
@0
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 4
@4
D=A
@SP
A=M
M=D
@SP
M=M+1
// sub
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@SP
A=M
M=D
@SP
M=M+1
// pop this 0
@0
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push this 0
@0
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@LESS193
D;JLT
@NOTLESS193
0;JMP
(LESS193)
D=-1
@CONTINUE193
0;JMP
(NOTLESS193)
D=0
@CONTINUE193
0;JMP
(CONTINUE193)
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// if-goto command
@SP
M=M-1
@SP
A=M
D=M
@Bat.move$IF1_1
D; JNE
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop this 0
@0
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// goto command
@Bat.move$IF2_1
0; JMP
// label command
(Bat.move$IF1_1)
// label command
(Bat.move$IF2_1)
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Screen.setColor 1
//push return address
@Bat.move$ret.0
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@6
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Screen.setColor
0;JMP
// continue after call
(Bat.move$ret.0)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push this 0
@0
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push this 2
@2
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// push this 1
@1
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push this 0
@0
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push this 2
@2
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// push constant 4
@4
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// push this 1
@1
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push this 3
@3
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// call Screen.drawRectangle 4
//push return address
@Bat.move$ret.1
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@9
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Screen.drawRectangle
0;JMP
// continue after call
(Bat.move$ret.1)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// neg
@SP
M=M-1
@SP
A=M
D=M
D=-D
@SP
A=M
M=D
@SP
M=M+1
// call Screen.setColor 1
//push return address
@Bat.move$ret.2
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@6
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Screen.setColor
0;JMP
// continue after call
(Bat.move$ret.2)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push this 0
@0
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push this 1
@1
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push this 0
@0
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 3
@3
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// push this 1
@1
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push this 3
@3
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// call Screen.drawRectangle 4
//push return address
@Bat.move$ret.3
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@9
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Screen.drawRectangle
0;JMP
// continue after call
(Bat.move$ret.3)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// goto command
@Bat.move$IF2_0
0; JMP
// label command
(Bat.move$IF1_0)
// push this 0
@0
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 4
@4
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// pop this 0
@0
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push this 0
@0
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push this 2
@2
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// push constant 511
@511
D=A
@SP
A=M
M=D
@SP
M=M+1
// gt
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@GREATER194
D;JGT
@NOTGREATER194
0;JMP
(GREATER194)
D=-1
@CONTINUE194
0;JMP
(NOTGREATER194)
D=0
@CONTINUE194
0;JMP
(CONTINUE194)
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// if-goto command
@SP
M=M-1
@SP
A=M
D=M
@Bat.move$IF1_2
D; JNE
// push constant 511
@511
D=A
@SP
A=M
M=D
@SP
M=M+1
// push this 2
@2
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// sub
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@SP
A=M
M=D
@SP
M=M+1
// pop this 0
@0
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// goto command
@Bat.move$IF2_2
0; JMP
// label command
(Bat.move$IF1_2)
// label command
(Bat.move$IF2_2)
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Screen.setColor 1
//push return address
@Bat.move$ret.4
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@6
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Screen.setColor
0;JMP
// continue after call
(Bat.move$ret.4)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push this 0
@0
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 4
@4
D=A
@SP
A=M
M=D
@SP
M=M+1
// sub
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@SP
A=M
M=D
@SP
M=M+1
// push this 1
@1
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push this 0
@0
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// sub
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@SP
A=M
M=D
@SP
M=M+1
// push this 1
@1
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push this 3
@3
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// call Screen.drawRectangle 4
//push return address
@Bat.move$ret.5
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@9
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Screen.drawRectangle
0;JMP
// continue after call
(Bat.move$ret.5)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// neg
@SP
M=M-1
@SP
A=M
D=M
D=-D
@SP
A=M
M=D
@SP
M=M+1
// call Screen.setColor 1
//push return address
@Bat.move$ret.6
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@6
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Screen.setColor
0;JMP
// continue after call
(Bat.move$ret.6)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push this 0
@0
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push this 2
@2
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// push constant 3
@3
D=A
@SP
A=M
M=D
@SP
M=M+1
// sub
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@SP
A=M
M=D
@SP
M=M+1
// push this 1
@1
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push this 0
@0
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push this 2
@2
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// push this 1
@1
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push this 3
@3
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// call Screen.drawRectangle 4
//push return address
@Bat.move$ret.7
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@9
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Screen.drawRectangle
0;JMP
// continue after call
(Bat.move$ret.7)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// label command
(Bat.move$IF2_0)
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// return
// save LCL in end frame variable endFrame
@LCL
D=M
@endFrame
M=D
// save return address in variable retAddress
@5
D=A
@endFrame
D=M-D
A=D
D=M
@retAddress
M=D
// reposition return value for the caller
@SP
M=M-1
@SP
A=M
D=M
@ARG
A=M
M=D
// reposition SP
@ARG
D=M+1
@SP
M=D
// recover segments
// recover THAT
@endFrame
D=M-1
A=D
D=M
@THAT
M=D
// recover THIS
@2
D=A
@endFrame
D=M-D
A=D
D=M
@THIS
M=D
// recover ARG
@3
D=A
@endFrame
D=M-D
A=D
D=M
@ARG
M=D
// recover LCL
@4
D=A
@endFrame
D=M-D
A=D
D=M
@LCL
M=D
// actual return
@retAddress
A=M
0;JMP
// function Main.main 1
(Main.main)
//push zeroes
@1
D=A
@nargs
M=D
(PUSH195)
@nargs
D=M
@NOTPUSH195
D;JEQ
D=0
@SP
A=M
M=D
@SP
M=M+1
@nargs
M=M-1
@PUSH195
0; JMP
(NOTPUSH195)
// call PongGame.newInstance 0
//push return address
@Main.main$ret.0
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@5
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@PongGame.newInstance
0;JMP
// continue after call
(Main.main$ret.0)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// call PongGame.getInstance 0
//push return address
@Main.main$ret.1
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@5
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@PongGame.getInstance
0;JMP
// continue after call
(Main.main$ret.1)
// pop local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// call PongGame.run 1
//push return address
@Main.main$ret.2
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@6
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@PongGame.run
0;JMP
// continue after call
(Main.main$ret.2)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// call PongGame.dispose 1
//push return address
@Main.main$ret.3
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@6
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@PongGame.dispose
0;JMP
// continue after call
(Main.main$ret.3)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// return
// save LCL in end frame variable endFrame
@LCL
D=M
@endFrame
M=D
// save return address in variable retAddress
@5
D=A
@endFrame
D=M-D
A=D
D=M
@retAddress
M=D
// reposition return value for the caller
@SP
M=M-1
@SP
A=M
D=M
@ARG
A=M
M=D
// reposition SP
@ARG
D=M+1
@SP
M=D
// recover segments
// recover THAT
@endFrame
D=M-1
A=D
D=M
@THAT
M=D
// recover THIS
@2
D=A
@endFrame
D=M-D
A=D
D=M
@THIS
M=D
// recover ARG
@3
D=A
@endFrame
D=M-D
A=D
D=M
@ARG
M=D
// recover LCL
@4
D=A
@endFrame
D=M-D
A=D
D=M
@LCL
M=D
// actual return
@retAddress
A=M
0;JMP
// function PongGame.new 0
(PongGame.new)
//push zeroes
@0
D=A
@nargs
M=D
(PUSH196)
@nargs
D=M
@NOTPUSH196
D;JEQ
D=0
@SP
A=M
M=D
@SP
M=M+1
@nargs
M=M-1
@PUSH196
0; JMP
(NOTPUSH196)
// push constant 7
@7
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Memory.alloc 1
//push return address
@PongGame.new$ret.0
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@6
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Memory.alloc
0;JMP
// continue after call
(PongGame.new$ret.0)
// pop pointer 0
@SP
M=M-1
@SP
A=M
D=M
@R3
M=D
// call Screen.clearScreen 0
//push return address
@PongGame.new$ret.1
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@5
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Screen.clearScreen
0;JMP
// continue after call
(PongGame.new$ret.1)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push constant 50
@50
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop this 6
@6
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push constant 230
@230
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 229
@229
D=A
@SP
A=M
M=D
@SP
M=M+1
// push this 6
@6
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 7
@7
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Bat.new 4
//push return address
@PongGame.new$ret.2
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@9
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Bat.new
0;JMP
// continue after call
(PongGame.new$ret.2)
// pop this 0
@0
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push constant 253
@253
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 222
@222
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 511
@511
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 229
@229
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Ball.new 6
//push return address
@PongGame.new$ret.3
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@11
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Ball.new
0;JMP
// continue after call
(PongGame.new$ret.3)
// pop this 1
@1
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push this 1
@1
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 400
@400
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Ball.setDestination 3
//push return address
@PongGame.new$ret.4
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@8
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Ball.setDestination
0;JMP
// continue after call
(PongGame.new$ret.4)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 238
@238
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 511
@511
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 240
@240
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Screen.drawRectangle 4
//push return address
@PongGame.new$ret.5
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@9
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Screen.drawRectangle
0;JMP
// continue after call
(PongGame.new$ret.5)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push constant 22
@22
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.moveCursor 2
//push return address
@PongGame.new$ret.6
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@7
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Output.moveCursor
0;JMP
// continue after call
(PongGame.new$ret.6)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push constant 8
@8
D=A
@SP
A=M
M=D
@SP
M=M+1
// call String.new 1
//push return address
@PongGame.new$ret.7
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@6
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@String.new
0;JMP
// continue after call
(PongGame.new$ret.7)
// push constant 83
@83
D=A
@SP
A=M
M=D
@SP
M=M+1
// call String.appendChar 2
//push return address
@PongGame.new$ret.8
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@7
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@String.appendChar
0;JMP
// continue after call
(PongGame.new$ret.8)
// push constant 99
@99
D=A
@SP
A=M
M=D
@SP
M=M+1
// call String.appendChar 2
//push return address
@PongGame.new$ret.9
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@7
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@String.appendChar
0;JMP
// continue after call
(PongGame.new$ret.9)
// push constant 111
@111
D=A
@SP
A=M
M=D
@SP
M=M+1
// call String.appendChar 2
//push return address
@PongGame.new$ret.10
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@7
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@String.appendChar
0;JMP
// continue after call
(PongGame.new$ret.10)
// push constant 114
@114
D=A
@SP
A=M
M=D
@SP
M=M+1
// call String.appendChar 2
//push return address
@PongGame.new$ret.11
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@7
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@String.appendChar
0;JMP
// continue after call
(PongGame.new$ret.11)
// push constant 101
@101
D=A
@SP
A=M
M=D
@SP
M=M+1
// call String.appendChar 2
//push return address
@PongGame.new$ret.12
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@7
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@String.appendChar
0;JMP
// continue after call
(PongGame.new$ret.12)
// push constant 58
@58
D=A
@SP
A=M
M=D
@SP
M=M+1
// call String.appendChar 2
//push return address
@PongGame.new$ret.13
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@7
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@String.appendChar
0;JMP
// continue after call
(PongGame.new$ret.13)
// push constant 32
@32
D=A
@SP
A=M
M=D
@SP
M=M+1
// call String.appendChar 2
//push return address
@PongGame.new$ret.14
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@7
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@String.appendChar
0;JMP
// continue after call
(PongGame.new$ret.14)
// push constant 48
@48
D=A
@SP
A=M
M=D
@SP
M=M+1
// call String.appendChar 2
//push return address
@PongGame.new$ret.15
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@7
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@String.appendChar
0;JMP
// continue after call
(PongGame.new$ret.15)
// call Output.printString 1
//push return address
@PongGame.new$ret.16
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@6
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Output.printString
0;JMP
// continue after call
(PongGame.new$ret.16)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop this 3
@3
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop this 4
@4
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop this 2
@2
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop this 5
@5
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push pointer 0
@R3
D=M
@SP
A=M
M=D
@SP
M=M+1
// return
// save LCL in end frame variable endFrame
@LCL
D=M
@endFrame
M=D
// save return address in variable retAddress
@5
D=A
@endFrame
D=M-D
A=D
D=M
@retAddress
M=D
// reposition return value for the caller
@SP
M=M-1
@SP
A=M
D=M
@ARG
A=M
M=D
// reposition SP
@ARG
D=M+1
@SP
M=D
// recover segments
// recover THAT
@endFrame
D=M-1
A=D
D=M
@THAT
M=D
// recover THIS
@2
D=A
@endFrame
D=M-D
A=D
D=M
@THIS
M=D
// recover ARG
@3
D=A
@endFrame
D=M-D
A=D
D=M
@ARG
M=D
// recover LCL
@4
D=A
@endFrame
D=M-D
A=D
D=M
@LCL
M=D
// actual return
@retAddress
A=M
0;JMP
// function PongGame.dispose 0
(PongGame.dispose)
//push zeroes
@0
D=A
@nargs
M=D
(PUSH197)
@nargs
D=M
@NOTPUSH197
D;JEQ
D=0
@SP
A=M
M=D
@SP
M=M+1
@nargs
M=M-1
@PUSH197
0; JMP
(NOTPUSH197)
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop pointer 0
@SP
M=M-1
@SP
A=M
D=M
@R3
M=D
// push this 0
@0
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Bat.dispose 1
//push return address
@PongGame.dispose$ret.0
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@6
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Bat.dispose
0;JMP
// continue after call
(PongGame.dispose$ret.0)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push this 1
@1
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Ball.dispose 1
//push return address
@PongGame.dispose$ret.1
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@6
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Ball.dispose
0;JMP
// continue after call
(PongGame.dispose$ret.1)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push pointer 0
@R3
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Memory.deAlloc 1
//push return address
@PongGame.dispose$ret.2
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@6
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Memory.deAlloc
0;JMP
// continue after call
(PongGame.dispose$ret.2)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// return
// save LCL in end frame variable endFrame
@LCL
D=M
@endFrame
M=D
// save return address in variable retAddress
@5
D=A
@endFrame
D=M-D
A=D
D=M
@retAddress
M=D
// reposition return value for the caller
@SP
M=M-1
@SP
A=M
D=M
@ARG
A=M
M=D
// reposition SP
@ARG
D=M+1
@SP
M=D
// recover segments
// recover THAT
@endFrame
D=M-1
A=D
D=M
@THAT
M=D
// recover THIS
@2
D=A
@endFrame
D=M-D
A=D
D=M
@THIS
M=D
// recover ARG
@3
D=A
@endFrame
D=M-D
A=D
D=M
@ARG
M=D
// recover LCL
@4
D=A
@endFrame
D=M-D
A=D
D=M
@LCL
M=D
// actual return
@retAddress
A=M
0;JMP
// function PongGame.newInstance 0
(PongGame.newInstance)
//push zeroes
@0
D=A
@nargs
M=D
(PUSH198)
@nargs
D=M
@NOTPUSH198
D;JEQ
D=0
@SP
A=M
M=D
@SP
M=M+1
@nargs
M=M-1
@PUSH198
0; JMP
(NOTPUSH198)
// call PongGame.new 0
//push return address
@PongGame.newInstance$ret.0
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@5
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@PongGame.new
0;JMP
// continue after call
(PongGame.newInstance$ret.0)
// pop static 0
@SP
M=M-1
@SP
A=M
D=M
@PongGame.0
M=D
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// return
// save LCL in end frame variable endFrame
@LCL
D=M
@endFrame
M=D
// save return address in variable retAddress
@5
D=A
@endFrame
D=M-D
A=D
D=M
@retAddress
M=D
// reposition return value for the caller
@SP
M=M-1
@SP
A=M
D=M
@ARG
A=M
M=D
// reposition SP
@ARG
D=M+1
@SP
M=D
// recover segments
// recover THAT
@endFrame
D=M-1
A=D
D=M
@THAT
M=D
// recover THIS
@2
D=A
@endFrame
D=M-D
A=D
D=M
@THIS
M=D
// recover ARG
@3
D=A
@endFrame
D=M-D
A=D
D=M
@ARG
M=D
// recover LCL
@4
D=A
@endFrame
D=M-D
A=D
D=M
@LCL
M=D
// actual return
@retAddress
A=M
0;JMP
// function PongGame.getInstance 0
(PongGame.getInstance)
//push zeroes
@0
D=A
@nargs
M=D
(PUSH199)
@nargs
D=M
@NOTPUSH199
D;JEQ
D=0
@SP
A=M
M=D
@SP
M=M+1
@nargs
M=M-1
@PUSH199
0; JMP
(NOTPUSH199)
// push static 0
@PongGame.0
D=M
@SP
A=M
M=D
@SP
M=M+1
// return
// save LCL in end frame variable endFrame
@LCL
D=M
@endFrame
M=D
// save return address in variable retAddress
@5
D=A
@endFrame
D=M-D
A=D
D=M
@retAddress
M=D
// reposition return value for the caller
@SP
M=M-1
@SP
A=M
D=M
@ARG
A=M
M=D
// reposition SP
@ARG
D=M+1
@SP
M=D
// recover segments
// recover THAT
@endFrame
D=M-1
A=D
D=M
@THAT
M=D
// recover THIS
@2
D=A
@endFrame
D=M-D
A=D
D=M
@THIS
M=D
// recover ARG
@3
D=A
@endFrame
D=M-D
A=D
D=M
@ARG
M=D
// recover LCL
@4
D=A
@endFrame
D=M-D
A=D
D=M
@LCL
M=D
// actual return
@retAddress
A=M
0;JMP
// function PongGame.run 1
(PongGame.run)
//push zeroes
@1
D=A
@nargs
M=D
(PUSH200)
@nargs
D=M
@NOTPUSH200
D;JEQ
D=0
@SP
A=M
M=D
@SP
M=M+1
@nargs
M=M-1
@PUSH200
0; JMP
(NOTPUSH200)
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop pointer 0
@SP
M=M-1
@SP
A=M
D=M
@R3
M=D
// label command
(PongGame.run$WHILE1_0)
// push this 3
@3
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// if-goto command
@SP
M=M-1
@SP
A=M
D=M
@PongGame.run$WHILE2_0
D; JNE
// label command
(PongGame.run$WHILE1_1)
// push local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// eq
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@EQUAL201
D;JEQ
@NOTEQUAL201
0;JMP
(EQUAL201)
D=-1
@CONTINUE201
0;JMP
(NOTEQUAL201)
D=0
@CONTINUE201
0;JMP
(CONTINUE201)
@SP
A=M
M=D
@SP
M=M+1
// push this 3
@3
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// and
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D&M
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// if-goto command
@SP
M=M-1
@SP
A=M
D=M
@PongGame.run$WHILE2_1
D; JNE
// call Keyboard.keyPressed 0
//push return address
@PongGame.run$ret.0
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@5
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Keyboard.keyPressed
0;JMP
// continue after call
(PongGame.run$ret.0)
// pop local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push this 0
@0
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Bat.move 1
//push return address
@PongGame.run$ret.1
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@6
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Bat.move
0;JMP
// continue after call
(PongGame.run$ret.1)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push pointer 0
@R3
D=M
@SP
A=M
M=D
@SP
M=M+1
// call PongGame.moveBall 1
//push return address
@PongGame.run$ret.2
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@6
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@PongGame.moveBall
0;JMP
// continue after call
(PongGame.run$ret.2)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push constant 50
@50
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Sys.wait 1
//push return address
@PongGame.run$ret.3
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@6
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Sys.wait
0;JMP
// continue after call
(PongGame.run$ret.3)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// goto command
@PongGame.run$WHILE1_1
0; JMP
// label command
(PongGame.run$WHILE2_1)
// push local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 130
@130
D=A
@SP
A=M
M=D
@SP
M=M+1
// eq
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@EQUAL202
D;JEQ
@NOTEQUAL202
0;JMP
(EQUAL202)
D=-1
@CONTINUE202
0;JMP
(NOTEQUAL202)
D=0
@CONTINUE202
0;JMP
(CONTINUE202)
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// if-goto command
@SP
M=M-1
@SP
A=M
D=M
@PongGame.run$IF1_3
D; JNE
// push this 0
@0
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Bat.setDirection 2
//push return address
@PongGame.run$ret.4
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@7
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Bat.setDirection
0;JMP
// continue after call
(PongGame.run$ret.4)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// goto command
@PongGame.run$IF2_3
0; JMP
// label command
(PongGame.run$IF1_3)
// push local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 132
@132
D=A
@SP
A=M
M=D
@SP
M=M+1
// eq
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@EQUAL203
D;JEQ
@NOTEQUAL203
0;JMP
(EQUAL203)
D=-1
@CONTINUE203
0;JMP
(NOTEQUAL203)
D=0
@CONTINUE203
0;JMP
(CONTINUE203)
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// if-goto command
@SP
M=M-1
@SP
A=M
D=M
@PongGame.run$IF1_4
D; JNE
// push this 0
@0
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 2
@2
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Bat.setDirection 2
//push return address
@PongGame.run$ret.5
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@7
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Bat.setDirection
0;JMP
// continue after call
(PongGame.run$ret.5)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// goto command
@PongGame.run$IF2_4
0; JMP
// label command
(PongGame.run$IF1_4)
// push local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 140
@140
D=A
@SP
A=M
M=D
@SP
M=M+1
// eq
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@EQUAL204
D;JEQ
@NOTEQUAL204
0;JMP
(EQUAL204)
D=-1
@CONTINUE204
0;JMP
(NOTEQUAL204)
D=0
@CONTINUE204
0;JMP
(CONTINUE204)
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// if-goto command
@SP
M=M-1
@SP
A=M
D=M
@PongGame.run$IF1_5
D; JNE
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// neg
@SP
M=M-1
@SP
A=M
D=M
D=-D
@SP
A=M
M=D
@SP
M=M+1
// pop this 3
@3
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// goto command
@PongGame.run$IF2_5
0; JMP
// label command
(PongGame.run$IF1_5)
// label command
(PongGame.run$IF2_5)
// label command
(PongGame.run$IF2_4)
// label command
(PongGame.run$IF2_3)
// label command
(PongGame.run$WHILE1_6)
// push local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// eq
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@EQUAL205
D;JEQ
@NOTEQUAL205
0;JMP
(EQUAL205)
D=-1
@CONTINUE205
0;JMP
(NOTEQUAL205)
D=0
@CONTINUE205
0;JMP
(CONTINUE205)
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// push this 3
@3
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// and
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D&M
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// if-goto command
@SP
M=M-1
@SP
A=M
D=M
@PongGame.run$WHILE2_6
D; JNE
// call Keyboard.keyPressed 0
//push return address
@PongGame.run$ret.6
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@5
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Keyboard.keyPressed
0;JMP
// continue after call
(PongGame.run$ret.6)
// pop local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push this 0
@0
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Bat.move 1
//push return address
@PongGame.run$ret.7
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@6
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Bat.move
0;JMP
// continue after call
(PongGame.run$ret.7)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push pointer 0
@R3
D=M
@SP
A=M
M=D
@SP
M=M+1
// call PongGame.moveBall 1
//push return address
@PongGame.run$ret.8
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@6
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@PongGame.moveBall
0;JMP
// continue after call
(PongGame.run$ret.8)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push constant 50
@50
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Sys.wait 1
//push return address
@PongGame.run$ret.9
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@6
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Sys.wait
0;JMP
// continue after call
(PongGame.run$ret.9)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// goto command
@PongGame.run$WHILE1_6
0; JMP
// label command
(PongGame.run$WHILE2_6)
// goto command
@PongGame.run$WHILE1_0
0; JMP
// label command
(PongGame.run$WHILE2_0)
// push this 3
@3
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// if-goto command
@SP
M=M-1
@SP
A=M
D=M
@PongGame.run$IF1_9
D; JNE
// push constant 10
@10
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 27
@27
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.moveCursor 2
//push return address
@PongGame.run$ret.10
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@7
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Output.moveCursor
0;JMP
// continue after call
(PongGame.run$ret.10)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push constant 9
@9
D=A
@SP
A=M
M=D
@SP
M=M+1
// call String.new 1
//push return address
@PongGame.run$ret.11
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@6
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@String.new
0;JMP
// continue after call
(PongGame.run$ret.11)
// push constant 71
@71
D=A
@SP
A=M
M=D
@SP
M=M+1
// call String.appendChar 2
//push return address
@PongGame.run$ret.12
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@7
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@String.appendChar
0;JMP
// continue after call
(PongGame.run$ret.12)
// push constant 97
@97
D=A
@SP
A=M
M=D
@SP
M=M+1
// call String.appendChar 2
//push return address
@PongGame.run$ret.13
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@7
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@String.appendChar
0;JMP
// continue after call
(PongGame.run$ret.13)
// push constant 109
@109
D=A
@SP
A=M
M=D
@SP
M=M+1
// call String.appendChar 2
//push return address
@PongGame.run$ret.14
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@7
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@String.appendChar
0;JMP
// continue after call
(PongGame.run$ret.14)
// push constant 101
@101
D=A
@SP
A=M
M=D
@SP
M=M+1
// call String.appendChar 2
//push return address
@PongGame.run$ret.15
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@7
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@String.appendChar
0;JMP
// continue after call
(PongGame.run$ret.15)
// push constant 32
@32
D=A
@SP
A=M
M=D
@SP
M=M+1
// call String.appendChar 2
//push return address
@PongGame.run$ret.16
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@7
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@String.appendChar
0;JMP
// continue after call
(PongGame.run$ret.16)
// push constant 79
@79
D=A
@SP
A=M
M=D
@SP
M=M+1
// call String.appendChar 2
//push return address
@PongGame.run$ret.17
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@7
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@String.appendChar
0;JMP
// continue after call
(PongGame.run$ret.17)
// push constant 118
@118
D=A
@SP
A=M
M=D
@SP
M=M+1
// call String.appendChar 2
//push return address
@PongGame.run$ret.18
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@7
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@String.appendChar
0;JMP
// continue after call
(PongGame.run$ret.18)
// push constant 101
@101
D=A
@SP
A=M
M=D
@SP
M=M+1
// call String.appendChar 2
//push return address
@PongGame.run$ret.19
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@7
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@String.appendChar
0;JMP
// continue after call
(PongGame.run$ret.19)
// push constant 114
@114
D=A
@SP
A=M
M=D
@SP
M=M+1
// call String.appendChar 2
//push return address
@PongGame.run$ret.20
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@7
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@String.appendChar
0;JMP
// continue after call
(PongGame.run$ret.20)
// call Output.printString 1
//push return address
@PongGame.run$ret.21
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@6
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Output.printString
0;JMP
// continue after call
(PongGame.run$ret.21)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// goto command
@PongGame.run$IF2_9
0; JMP
// label command
(PongGame.run$IF1_9)
// label command
(PongGame.run$IF2_9)
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// return
// save LCL in end frame variable endFrame
@LCL
D=M
@endFrame
M=D
// save return address in variable retAddress
@5
D=A
@endFrame
D=M-D
A=D
D=M
@retAddress
M=D
// reposition return value for the caller
@SP
M=M-1
@SP
A=M
D=M
@ARG
A=M
M=D
// reposition SP
@ARG
D=M+1
@SP
M=D
// recover segments
// recover THAT
@endFrame
D=M-1
A=D
D=M
@THAT
M=D
// recover THIS
@2
D=A
@endFrame
D=M-D
A=D
D=M
@THIS
M=D
// recover ARG
@3
D=A
@endFrame
D=M-D
A=D
D=M
@ARG
M=D
// recover LCL
@4
D=A
@endFrame
D=M-D
A=D
D=M
@LCL
M=D
// actual return
@retAddress
A=M
0;JMP
// function PongGame.moveBall 5
(PongGame.moveBall)
//push zeroes
@5
D=A
@nargs
M=D
(PUSH206)
@nargs
D=M
@NOTPUSH206
D;JEQ
D=0
@SP
A=M
M=D
@SP
M=M+1
@nargs
M=M-1
@PUSH206
0; JMP
(NOTPUSH206)
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop pointer 0
@SP
M=M-1
@SP
A=M
D=M
@R3
M=D
// push this 1
@1
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Ball.move 1
//push return address
@PongGame.moveBall$ret.0
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@6
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Ball.move
0;JMP
// continue after call
(PongGame.moveBall$ret.0)
// pop this 2
@2
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push this 2
@2
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// gt
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@GREATER207
D;JGT
@NOTGREATER207
0;JMP
(GREATER207)
D=-1
@CONTINUE207
0;JMP
(NOTGREATER207)
D=0
@CONTINUE207
0;JMP
(CONTINUE207)
@SP
A=M
M=D
@SP
M=M+1
// push this 2
@2
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push this 5
@5
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// eq
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@EQUAL208
D;JEQ
@NOTEQUAL208
0;JMP
(EQUAL208)
D=-1
@CONTINUE208
0;JMP
(NOTEQUAL208)
D=0
@CONTINUE208
0;JMP
(CONTINUE208)
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// and
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D&M
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// if-goto command
@SP
M=M-1
@SP
A=M
D=M
@PongGame.moveBall$IF1_0
D; JNE
// push this 2
@2
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop this 5
@5
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push this 0
@0
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Bat.getLeft 1
//push return address
@PongGame.moveBall$ret.1
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@6
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Bat.getLeft
0;JMP
// continue after call
(PongGame.moveBall$ret.1)
// pop local 1
@1
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push this 0
@0
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Bat.getRight 1
//push return address
@PongGame.moveBall$ret.2
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@6
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Bat.getRight
0;JMP
// continue after call
(PongGame.moveBall$ret.2)
// pop local 2
@2
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push this 1
@1
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Ball.getLeft 1
//push return address
@PongGame.moveBall$ret.3
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@6
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Ball.getLeft
0;JMP
// continue after call
(PongGame.moveBall$ret.3)
// pop local 3
@3
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push this 1
@1
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Ball.getRight 1
//push return address
@PongGame.moveBall$ret.4
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@6
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Ball.getRight
0;JMP
// continue after call
(PongGame.moveBall$ret.4)
// pop local 4
@4
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push this 2
@2
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 4
@4
D=A
@SP
A=M
M=D
@SP
M=M+1
// eq
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@EQUAL209
D;JEQ
@NOTEQUAL209
0;JMP
(EQUAL209)
D=-1
@CONTINUE209
0;JMP
(NOTEQUAL209)
D=0
@CONTINUE209
0;JMP
(CONTINUE209)
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// if-goto command
@SP
M=M-1
@SP
A=M
D=M
@PongGame.moveBall$IF1_1
D; JNE
// push local 1
@1
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 4
@4
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// gt
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@GREATER210
D;JGT
@NOTGREATER210
0;JMP
(GREATER210)
D=-1
@CONTINUE210
0;JMP
(NOTGREATER210)
D=0
@CONTINUE210
0;JMP
(CONTINUE210)
@SP
A=M
M=D
@SP
M=M+1
// push local 2
@2
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 3
@3
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@LESS211
D;JLT
@NOTLESS211
0;JMP
(LESS211)
D=-1
@CONTINUE211
0;JMP
(NOTLESS211)
D=0
@CONTINUE211
0;JMP
(CONTINUE211)
@SP
A=M
M=D
@SP
M=M+1
// or
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D|M
@SP
A=M
M=D
@SP
M=M+1
// pop this 3
@3
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push this 3
@3
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// if-goto command
@SP
M=M-1
@SP
A=M
D=M
@PongGame.moveBall$IF1_2
D; JNE
// push local 4
@4
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 1
@1
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 10
@10
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@LESS212
D;JLT
@NOTLESS212
0;JMP
(LESS212)
D=-1
@CONTINUE212
0;JMP
(NOTLESS212)
D=0
@CONTINUE212
0;JMP
(CONTINUE212)
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// if-goto command
@SP
M=M-1
@SP
A=M
D=M
@PongGame.moveBall$IF1_3
D; JNE
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// neg
@SP
M=M-1
@SP
A=M
D=M
D=-D
@SP
A=M
M=D
@SP
M=M+1
// pop local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// goto command
@PongGame.moveBall$IF2_3
0; JMP
// label command
(PongGame.moveBall$IF1_3)
// push local 3
@3
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 2
@2
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 10
@10
D=A
@SP
A=M
M=D
@SP
M=M+1
// sub
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@SP
A=M
M=D
@SP
M=M+1
// gt
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@GREATER213
D;JGT
@NOTGREATER213
0;JMP
(GREATER213)
D=-1
@CONTINUE213
0;JMP
(NOTGREATER213)
D=0
@CONTINUE213
0;JMP
(CONTINUE213)
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// if-goto command
@SP
M=M-1
@SP
A=M
D=M
@PongGame.moveBall$IF1_4
D; JNE
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// goto command
@PongGame.moveBall$IF2_4
0; JMP
// label command
(PongGame.moveBall$IF1_4)
// label command
(PongGame.moveBall$IF2_4)
// label command
(PongGame.moveBall$IF2_3)
// push this 6
@6
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 2
@2
D=A
@SP
A=M
M=D
@SP
M=M+1
// sub
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@SP
A=M
M=D
@SP
M=M+1
// pop this 6
@6
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push this 0
@0
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push this 6
@6
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Bat.setWidth 2
//push return address
@PongGame.moveBall$ret.5
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@7
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Bat.setWidth
0;JMP
// continue after call
(PongGame.moveBall$ret.5)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push this 4
@4
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// pop this 4
@4
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push constant 22
@22
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 7
@7
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.moveCursor 2
//push return address
@PongGame.moveBall$ret.6
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@7
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Output.moveCursor
0;JMP
// continue after call
(PongGame.moveBall$ret.6)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push this 4
@4
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Output.printInt 1
//push return address
@PongGame.moveBall$ret.7
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@6
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Output.printInt
0;JMP
// continue after call
(PongGame.moveBall$ret.7)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// goto command
@PongGame.moveBall$IF2_2
0; JMP
// label command
(PongGame.moveBall$IF1_2)
// label command
(PongGame.moveBall$IF2_2)
// goto command
@PongGame.moveBall$IF2_1
0; JMP
// label command
(PongGame.moveBall$IF1_1)
// label command
(PongGame.moveBall$IF2_1)
// push this 1
@1
D=A
@address
M=D
@THIS
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Ball.bounce 2
//push return address
@PongGame.moveBall$ret.8
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@7
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Ball.bounce
0;JMP
// continue after call
(PongGame.moveBall$ret.8)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// goto command
@PongGame.moveBall$IF2_0
0; JMP
// label command
(PongGame.moveBall$IF1_0)
// label command
(PongGame.moveBall$IF2_0)
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// return
// save LCL in end frame variable endFrame
@LCL
D=M
@endFrame
M=D
// save return address in variable retAddress
@5
D=A
@endFrame
D=M-D
A=D
D=M
@retAddress
M=D
// reposition return value for the caller
@SP
M=M-1
@SP
A=M
D=M
@ARG
A=M
M=D
// reposition SP
@ARG
D=M+1
@SP
M=D
// recover segments
// recover THAT
@endFrame
D=M-1
A=D
D=M
@THAT
M=D
// recover THIS
@2
D=A
@endFrame
D=M-D
A=D
D=M
@THIS
M=D
// recover ARG
@3
D=A
@endFrame
D=M-D
A=D
D=M
@ARG
M=D
// recover LCL
@4
D=A
@endFrame
D=M-D
A=D
D=M
@LCL
M=D
// actual return
@retAddress
A=M
0;JMP
// function Screen.init 0
(Screen.init)
//push zeroes
@0
D=A
@nargs
M=D
(PUSH214)
@nargs
D=M
@NOTPUSH214
D;JEQ
D=0
@SP
A=M
M=D
@SP
M=M+1
@nargs
M=M-1
@PUSH214
0; JMP
(NOTPUSH214)
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop static 0
@SP
M=M-1
@SP
A=M
D=M
@Screen.0
M=D
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// neg
@SP
M=M-1
@SP
A=M
D=M
D=-D
@SP
A=M
M=D
@SP
M=M+1
// pop static 1
@SP
M=M-1
@SP
A=M
D=M
@Screen.1
M=D
// push constant 16384
@16384
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop static 3
@SP
M=M-1
@SP
A=M
D=M
@Screen.3
M=D
// push constant 24576
@24576
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop static 4
@SP
M=M-1
@SP
A=M
D=M
@Screen.4
M=D
// push static 0
@Screen.0
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop static 2
@SP
M=M-1
@SP
A=M
D=M
@Screen.2
M=D
// call Screen.clearScreen 0
//push return address
@Screen.init$ret.0
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@5
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Screen.clearScreen
0;JMP
// continue after call
(Screen.init$ret.0)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push static 1
@Screen.1
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop static 2
@SP
M=M-1
@SP
A=M
D=M
@Screen.2
M=D
// push constant 16
@16
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Array.new 1
//push return address
@Screen.init$ret.1
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@6
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Array.new
0;JMP
// continue after call
(Screen.init$ret.1)
// pop static 5
@SP
M=M-1
@SP
A=M
D=M
@Screen.5
M=D
// push static 5
@Screen.5
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// pop pointer 1
@SP
M=M-1
@SP
A=M
D=M
@R4
M=D
// push temp 0
@R5
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop that 0
@0
D=A
@address
M=D
@THAT
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push static 5
@Screen.5
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// push constant 2
@2
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// pop pointer 1
@SP
M=M-1
@SP
A=M
D=M
@R4
M=D
// push temp 0
@R5
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop that 0
@0
D=A
@address
M=D
@THAT
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push static 5
@Screen.5
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 2
@2
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// push constant 4
@4
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// pop pointer 1
@SP
M=M-1
@SP
A=M
D=M
@R4
M=D
// push temp 0
@R5
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop that 0
@0
D=A
@address
M=D
@THAT
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push static 5
@Screen.5
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 3
@3
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// push constant 8
@8
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// pop pointer 1
@SP
M=M-1
@SP
A=M
D=M
@R4
M=D
// push temp 0
@R5
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop that 0
@0
D=A
@address
M=D
@THAT
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push static 5
@Screen.5
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 4
@4
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// push constant 16
@16
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// pop pointer 1
@SP
M=M-1
@SP
A=M
D=M
@R4
M=D
// push temp 0
@R5
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop that 0
@0
D=A
@address
M=D
@THAT
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push static 5
@Screen.5
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 5
@5
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// push constant 32
@32
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// pop pointer 1
@SP
M=M-1
@SP
A=M
D=M
@R4
M=D
// push temp 0
@R5
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop that 0
@0
D=A
@address
M=D
@THAT
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push static 5
@Screen.5
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 6
@6
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// push constant 64
@64
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// pop pointer 1
@SP
M=M-1
@SP
A=M
D=M
@R4
M=D
// push temp 0
@R5
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop that 0
@0
D=A
@address
M=D
@THAT
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push static 5
@Screen.5
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 7
@7
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// push constant 128
@128
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// pop pointer 1
@SP
M=M-1
@SP
A=M
D=M
@R4
M=D
// push temp 0
@R5
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop that 0
@0
D=A
@address
M=D
@THAT
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push static 5
@Screen.5
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 8
@8
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// push constant 256
@256
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// pop pointer 1
@SP
M=M-1
@SP
A=M
D=M
@R4
M=D
// push temp 0
@R5
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop that 0
@0
D=A
@address
M=D
@THAT
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push static 5
@Screen.5
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 9
@9
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// push constant 512
@512
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// pop pointer 1
@SP
M=M-1
@SP
A=M
D=M
@R4
M=D
// push temp 0
@R5
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop that 0
@0
D=A
@address
M=D
@THAT
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push static 5
@Screen.5
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 10
@10
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// push constant 1024
@1024
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// pop pointer 1
@SP
M=M-1
@SP
A=M
D=M
@R4
M=D
// push temp 0
@R5
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop that 0
@0
D=A
@address
M=D
@THAT
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push static 5
@Screen.5
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 11
@11
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// push constant 2048
@2048
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// pop pointer 1
@SP
M=M-1
@SP
A=M
D=M
@R4
M=D
// push temp 0
@R5
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop that 0
@0
D=A
@address
M=D
@THAT
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push static 5
@Screen.5
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// push constant 4096
@4096
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// pop pointer 1
@SP
M=M-1
@SP
A=M
D=M
@R4
M=D
// push temp 0
@R5
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop that 0
@0
D=A
@address
M=D
@THAT
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push static 5
@Screen.5
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 13
@13
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// push constant 8192
@8192
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// pop pointer 1
@SP
M=M-1
@SP
A=M
D=M
@R4
M=D
// push temp 0
@R5
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop that 0
@0
D=A
@address
M=D
@THAT
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push static 5
@Screen.5
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 14
@14
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// push constant 16384
@16384
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// pop pointer 1
@SP
M=M-1
@SP
A=M
D=M
@R4
M=D
// push temp 0
@R5
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop that 0
@0
D=A
@address
M=D
@THAT
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push static 5
@Screen.5
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 15
@15
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// push constant 32767
@32767
D=A
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// pop pointer 1
@SP
M=M-1
@SP
A=M
D=M
@R4
M=D
// push temp 0
@R5
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop that 0
@0
D=A
@address
M=D
@THAT
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// return
// save LCL in end frame variable endFrame
@LCL
D=M
@endFrame
M=D
// save return address in variable retAddress
@5
D=A
@endFrame
D=M-D
A=D
D=M
@retAddress
M=D
// reposition return value for the caller
@SP
M=M-1
@SP
A=M
D=M
@ARG
A=M
M=D
// reposition SP
@ARG
D=M+1
@SP
M=D
// recover segments
// recover THAT
@endFrame
D=M-1
A=D
D=M
@THAT
M=D
// recover THIS
@2
D=A
@endFrame
D=M-D
A=D
D=M
@THIS
M=D
// recover ARG
@3
D=A
@endFrame
D=M-D
A=D
D=M
@ARG
M=D
// recover LCL
@4
D=A
@endFrame
D=M-D
A=D
D=M
@LCL
M=D
// actual return
@retAddress
A=M
0;JMP
// function Screen.clearScreen 1
(Screen.clearScreen)
//push zeroes
@1
D=A
@nargs
M=D
(PUSH215)
@nargs
D=M
@NOTPUSH215
D;JEQ
D=0
@SP
A=M
M=D
@SP
M=M+1
@nargs
M=M-1
@PUSH215
0; JMP
(NOTPUSH215)
// push static 3
@Screen.3
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// label command
(Screen.clearScreen$WHILE1_0)
// push local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push static 4
@Screen.4
D=M
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@LESS216
D;JLT
@NOTLESS216
0;JMP
(LESS216)
D=-1
@CONTINUE216
0;JMP
(NOTLESS216)
D=0
@CONTINUE216
0;JMP
(CONTINUE216)
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// if-goto command
@SP
M=M-1
@SP
A=M
D=M
@Screen.clearScreen$WHILE2_0
D; JNE
// push local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push static 0
@Screen.0
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Memory.poke 2
//push return address
@Screen.clearScreen$ret.0
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@7
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Memory.poke
0;JMP
// continue after call
(Screen.clearScreen$ret.0)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// pop local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// goto command
@Screen.clearScreen$WHILE1_0
0; JMP
// label command
(Screen.clearScreen$WHILE2_0)
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// return
// save LCL in end frame variable endFrame
@LCL
D=M
@endFrame
M=D
// save return address in variable retAddress
@5
D=A
@endFrame
D=M-D
A=D
D=M
@retAddress
M=D
// reposition return value for the caller
@SP
M=M-1
@SP
A=M
D=M
@ARG
A=M
M=D
// reposition SP
@ARG
D=M+1
@SP
M=D
// recover segments
// recover THAT
@endFrame
D=M-1
A=D
D=M
@THAT
M=D
// recover THIS
@2
D=A
@endFrame
D=M-D
A=D
D=M
@THIS
M=D
// recover ARG
@3
D=A
@endFrame
D=M-D
A=D
D=M
@ARG
M=D
// recover LCL
@4
D=A
@endFrame
D=M-D
A=D
D=M
@LCL
M=D
// actual return
@retAddress
A=M
0;JMP
// function Screen.setColor 0
(Screen.setColor)
//push zeroes
@0
D=A
@nargs
M=D
(PUSH217)
@nargs
D=M
@NOTPUSH217
D;JEQ
D=0
@SP
A=M
M=D
@SP
M=M+1
@nargs
M=M-1
@PUSH217
0; JMP
(NOTPUSH217)
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop static 2
@SP
M=M-1
@SP
A=M
D=M
@Screen.2
M=D
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// return
// save LCL in end frame variable endFrame
@LCL
D=M
@endFrame
M=D
// save return address in variable retAddress
@5
D=A
@endFrame
D=M-D
A=D
D=M
@retAddress
M=D
// reposition return value for the caller
@SP
M=M-1
@SP
A=M
D=M
@ARG
A=M
M=D
// reposition SP
@ARG
D=M+1
@SP
M=D
// recover segments
// recover THAT
@endFrame
D=M-1
A=D
D=M
@THAT
M=D
// recover THIS
@2
D=A
@endFrame
D=M-D
A=D
D=M
@THIS
M=D
// recover ARG
@3
D=A
@endFrame
D=M-D
A=D
D=M
@ARG
M=D
// recover LCL
@4
D=A
@endFrame
D=M-D
A=D
D=M
@LCL
M=D
// actual return
@retAddress
A=M
0;JMP
// function Screen.setBit 0
(Screen.setBit)
//push zeroes
@0
D=A
@nargs
M=D
(PUSH218)
@nargs
D=M
@NOTPUSH218
D;JEQ
D=0
@SP
A=M
M=D
@SP
M=M+1
@nargs
M=M-1
@PUSH218
0; JMP
(NOTPUSH218)
// push static 2
@Screen.2
D=M
@SP
A=M
M=D
@SP
M=M+1
// push static 1
@Screen.1
D=M
@SP
A=M
M=D
@SP
M=M+1
// eq
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@EQUAL219
D;JEQ
@NOTEQUAL219
0;JMP
(EQUAL219)
D=-1
@CONTINUE219
0;JMP
(NOTEQUAL219)
D=0
@CONTINUE219
0;JMP
(CONTINUE219)
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// if-goto command
@SP
M=M-1
@SP
A=M
D=M
@Screen.setBit$IF1_0
D; JNE
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push static 5
@Screen.5
D=M
@SP
A=M
M=D
@SP
M=M+1
// push argument 1
@1
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// pop pointer 1
@SP
M=M-1
@SP
A=M
D=M
@R4
M=D
// push that 0
@0
D=A
@address
M=D
@THAT
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// or
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D|M
@SP
A=M
M=D
@SP
M=M+1
// return
// save LCL in end frame variable endFrame
@LCL
D=M
@endFrame
M=D
// save return address in variable retAddress
@5
D=A
@endFrame
D=M-D
A=D
D=M
@retAddress
M=D
// reposition return value for the caller
@SP
M=M-1
@SP
A=M
D=M
@ARG
A=M
M=D
// reposition SP
@ARG
D=M+1
@SP
M=D
// recover segments
// recover THAT
@endFrame
D=M-1
A=D
D=M
@THAT
M=D
// recover THIS
@2
D=A
@endFrame
D=M-D
A=D
D=M
@THIS
M=D
// recover ARG
@3
D=A
@endFrame
D=M-D
A=D
D=M
@ARG
M=D
// recover LCL
@4
D=A
@endFrame
D=M-D
A=D
D=M
@LCL
M=D
// actual return
@retAddress
A=M
0;JMP
// goto command
@Screen.setBit$IF2_0
0; JMP
// label command
(Screen.setBit$IF1_0)
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push static 5
@Screen.5
D=M
@SP
A=M
M=D
@SP
M=M+1
// push argument 1
@1
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// pop pointer 1
@SP
M=M-1
@SP
A=M
D=M
@R4
M=D
// push that 0
@0
D=A
@address
M=D
@THAT
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// and
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D&M
@SP
A=M
M=D
@SP
M=M+1
// return
// save LCL in end frame variable endFrame
@LCL
D=M
@endFrame
M=D
// save return address in variable retAddress
@5
D=A
@endFrame
D=M-D
A=D
D=M
@retAddress
M=D
// reposition return value for the caller
@SP
M=M-1
@SP
A=M
D=M
@ARG
A=M
M=D
// reposition SP
@ARG
D=M+1
@SP
M=D
// recover segments
// recover THAT
@endFrame
D=M-1
A=D
D=M
@THAT
M=D
// recover THIS
@2
D=A
@endFrame
D=M-D
A=D
D=M
@THIS
M=D
// recover ARG
@3
D=A
@endFrame
D=M-D
A=D
D=M
@ARG
M=D
// recover LCL
@4
D=A
@endFrame
D=M-D
A=D
D=M
@LCL
M=D
// actual return
@retAddress
A=M
0;JMP
// label command
(Screen.setBit$IF2_0)
// function Screen.drawPixel 3
(Screen.drawPixel)
//push zeroes
@3
D=A
@nargs
M=D
(PUSH220)
@nargs
D=M
@NOTPUSH220
D;JEQ
D=0
@SP
A=M
M=D
@SP
M=M+1
@nargs
M=M-1
@PUSH220
0; JMP
(NOTPUSH220)
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@LESS221
D;JLT
@NOTLESS221
0;JMP
(LESS221)
D=-1
@CONTINUE221
0;JMP
(NOTLESS221)
D=0
@CONTINUE221
0;JMP
(CONTINUE221)
@SP
A=M
M=D
@SP
M=M+1
// push argument 1
@1
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@LESS222
D;JLT
@NOTLESS222
0;JMP
(LESS222)
D=-1
@CONTINUE222
0;JMP
(NOTLESS222)
D=0
@CONTINUE222
0;JMP
(CONTINUE222)
@SP
A=M
M=D
@SP
M=M+1
// or
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D|M
@SP
A=M
M=D
@SP
M=M+1
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 511
@511
D=A
@SP
A=M
M=D
@SP
M=M+1
// gt
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@GREATER223
D;JGT
@NOTGREATER223
0;JMP
(GREATER223)
D=-1
@CONTINUE223
0;JMP
(NOTGREATER223)
D=0
@CONTINUE223
0;JMP
(CONTINUE223)
@SP
A=M
M=D
@SP
M=M+1
// or
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D|M
@SP
A=M
M=D
@SP
M=M+1
// push argument 1
@1
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 255
@255
D=A
@SP
A=M
M=D
@SP
M=M+1
// gt
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@GREATER224
D;JGT
@NOTGREATER224
0;JMP
(GREATER224)
D=-1
@CONTINUE224
0;JMP
(NOTGREATER224)
D=0
@CONTINUE224
0;JMP
(CONTINUE224)
@SP
A=M
M=D
@SP
M=M+1
// or
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D|M
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// if-goto command
@SP
M=M-1
@SP
A=M
D=M
@Screen.drawPixel$IF1_0
D; JNE
// push constant 7
@7
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Sys.error 1
//push return address
@Screen.drawPixel$ret.0
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@6
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Sys.error
0;JMP
// continue after call
(Screen.drawPixel$ret.0)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// goto command
@Screen.drawPixel$IF2_0
0; JMP
// label command
(Screen.drawPixel$IF1_0)
// label command
(Screen.drawPixel$IF2_0)
// push static 3
@Screen.3
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 32
@32
D=A
@SP
A=M
M=D
@SP
M=M+1
// push argument 1
@1
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Math.multiply 2
//push return address
@Screen.drawPixel$ret.1
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@7
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Math.multiply
0;JMP
// continue after call
(Screen.drawPixel$ret.1)
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 16
@16
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Math.divide 2
//push return address
@Screen.drawPixel$ret.2
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@7
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Math.divide
0;JMP
// continue after call
(Screen.drawPixel$ret.2)
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// pop local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 16
@16
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Math.divide 2
//push return address
@Screen.drawPixel$ret.3
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@7
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Math.divide
0;JMP
// continue after call
(Screen.drawPixel$ret.3)
// push constant 16
@16
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Math.multiply 2
//push return address
@Screen.drawPixel$ret.4
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@7
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Math.multiply
0;JMP
// continue after call
(Screen.drawPixel$ret.4)
// sub
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@SP
A=M
M=D
@SP
M=M+1
// pop local 1
@1
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Memory.peek 1
//push return address
@Screen.drawPixel$ret.5
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@6
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Memory.peek
0;JMP
// continue after call
(Screen.drawPixel$ret.5)
// pop local 2
@2
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push local 2
@2
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 1
@1
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Screen.setBit 2
//push return address
@Screen.drawPixel$ret.6
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@7
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Screen.setBit
0;JMP
// continue after call
(Screen.drawPixel$ret.6)
// pop local 2
@2
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 2
@2
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Memory.poke 2
//push return address
@Screen.drawPixel$ret.7
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@7
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Memory.poke
0;JMP
// continue after call
(Screen.drawPixel$ret.7)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// return
// save LCL in end frame variable endFrame
@LCL
D=M
@endFrame
M=D
// save return address in variable retAddress
@5
D=A
@endFrame
D=M-D
A=D
D=M
@retAddress
M=D
// reposition return value for the caller
@SP
M=M-1
@SP
A=M
D=M
@ARG
A=M
M=D
// reposition SP
@ARG
D=M+1
@SP
M=D
// recover segments
// recover THAT
@endFrame
D=M-1
A=D
D=M
@THAT
M=D
// recover THIS
@2
D=A
@endFrame
D=M-D
A=D
D=M
@THIS
M=D
// recover ARG
@3
D=A
@endFrame
D=M-D
A=D
D=M
@ARG
M=D
// recover LCL
@4
D=A
@endFrame
D=M-D
A=D
D=M
@LCL
M=D
// actual return
@retAddress
A=M
0;JMP
// function Screen.drawHorizontal 1
(Screen.drawHorizontal)
//push zeroes
@1
D=A
@nargs
M=D
(PUSH225)
@nargs
D=M
@NOTPUSH225
D;JEQ
D=0
@SP
A=M
M=D
@SP
M=M+1
@nargs
M=M-1
@PUSH225
0; JMP
(NOTPUSH225)
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// label command
(Screen.drawHorizontal$WHILE1_0)
// push local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push argument 1
@1
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@LESS226
D;JLT
@NOTLESS226
0;JMP
(LESS226)
D=-1
@CONTINUE226
0;JMP
(NOTLESS226)
D=0
@CONTINUE226
0;JMP
(CONTINUE226)
@SP
A=M
M=D
@SP
M=M+1
// push local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push argument 1
@1
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// eq
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@EQUAL227
D;JEQ
@NOTEQUAL227
0;JMP
(EQUAL227)
D=-1
@CONTINUE227
0;JMP
(NOTEQUAL227)
D=0
@CONTINUE227
0;JMP
(CONTINUE227)
@SP
A=M
M=D
@SP
M=M+1
// or
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D|M
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// if-goto command
@SP
M=M-1
@SP
A=M
D=M
@Screen.drawHorizontal$WHILE2_0
D; JNE
// push local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push argument 2
@2
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Screen.drawPixel 2
//push return address
@Screen.drawHorizontal$ret.0
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@7
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Screen.drawPixel
0;JMP
// continue after call
(Screen.drawHorizontal$ret.0)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// pop local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// goto command
@Screen.drawHorizontal$WHILE1_0
0; JMP
// label command
(Screen.drawHorizontal$WHILE2_0)
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// return
// save LCL in end frame variable endFrame
@LCL
D=M
@endFrame
M=D
// save return address in variable retAddress
@5
D=A
@endFrame
D=M-D
A=D
D=M
@retAddress
M=D
// reposition return value for the caller
@SP
M=M-1
@SP
A=M
D=M
@ARG
A=M
M=D
// reposition SP
@ARG
D=M+1
@SP
M=D
// recover segments
// recover THAT
@endFrame
D=M-1
A=D
D=M
@THAT
M=D
// recover THIS
@2
D=A
@endFrame
D=M-D
A=D
D=M
@THIS
M=D
// recover ARG
@3
D=A
@endFrame
D=M-D
A=D
D=M
@ARG
M=D
// recover LCL
@4
D=A
@endFrame
D=M-D
A=D
D=M
@LCL
M=D
// actual return
@retAddress
A=M
0;JMP
// function Screen.drawVertical 1
(Screen.drawVertical)
//push zeroes
@1
D=A
@nargs
M=D
(PUSH228)
@nargs
D=M
@NOTPUSH228
D;JEQ
D=0
@SP
A=M
M=D
@SP
M=M+1
@nargs
M=M-1
@PUSH228
0; JMP
(NOTPUSH228)
// push argument 1
@1
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// label command
(Screen.drawVertical$WHILE1_0)
// push local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push argument 2
@2
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@LESS229
D;JLT
@NOTLESS229
0;JMP
(LESS229)
D=-1
@CONTINUE229
0;JMP
(NOTLESS229)
D=0
@CONTINUE229
0;JMP
(CONTINUE229)
@SP
A=M
M=D
@SP
M=M+1
// push local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push argument 2
@2
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// eq
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@EQUAL230
D;JEQ
@NOTEQUAL230
0;JMP
(EQUAL230)
D=-1
@CONTINUE230
0;JMP
(NOTEQUAL230)
D=0
@CONTINUE230
0;JMP
(CONTINUE230)
@SP
A=M
M=D
@SP
M=M+1
// or
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D|M
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// if-goto command
@SP
M=M-1
@SP
A=M
D=M
@Screen.drawVertical$WHILE2_0
D; JNE
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Screen.drawPixel 2
//push return address
@Screen.drawVertical$ret.0
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@7
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Screen.drawPixel
0;JMP
// continue after call
(Screen.drawVertical$ret.0)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// pop local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// goto command
@Screen.drawVertical$WHILE1_0
0; JMP
// label command
(Screen.drawVertical$WHILE2_0)
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// return
// save LCL in end frame variable endFrame
@LCL
D=M
@endFrame
M=D
// save return address in variable retAddress
@5
D=A
@endFrame
D=M-D
A=D
D=M
@retAddress
M=D
// reposition return value for the caller
@SP
M=M-1
@SP
A=M
D=M
@ARG
A=M
M=D
// reposition SP
@ARG
D=M+1
@SP
M=D
// recover segments
// recover THAT
@endFrame
D=M-1
A=D
D=M
@THAT
M=D
// recover THIS
@2
D=A
@endFrame
D=M-D
A=D
D=M
@THIS
M=D
// recover ARG
@3
D=A
@endFrame
D=M-D
A=D
D=M
@ARG
M=D
// recover LCL
@4
D=A
@endFrame
D=M-D
A=D
D=M
@LCL
M=D
// actual return
@retAddress
A=M
0;JMP
// function Screen.drawLinePixel 0
(Screen.drawLinePixel)
//push zeroes
@0
D=A
@nargs
M=D
(PUSH231)
@nargs
D=M
@NOTPUSH231
D;JEQ
D=0
@SP
A=M
M=D
@SP
M=M+1
@nargs
M=M-1
@PUSH231
0; JMP
(NOTPUSH231)
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push argument 2
@2
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@LESS232
D;JLT
@NOTLESS232
0;JMP
(LESS232)
D=-1
@CONTINUE232
0;JMP
(NOTLESS232)
D=0
@CONTINUE232
0;JMP
(CONTINUE232)
@SP
A=M
M=D
@SP
M=M+1
// push argument 1
@1
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push argument 3
@3
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@LESS233
D;JLT
@NOTLESS233
0;JMP
(LESS233)
D=-1
@CONTINUE233
0;JMP
(NOTLESS233)
D=0
@CONTINUE233
0;JMP
(CONTINUE233)
@SP
A=M
M=D
@SP
M=M+1
// and
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D&M
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// if-goto command
@SP
M=M-1
@SP
A=M
D=M
@Screen.drawLinePixel$IF1_0
D; JNE
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push argument 4
@4
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// push argument 1
@1
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push argument 5
@5
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// call Screen.drawPixel 2
//push return address
@Screen.drawLinePixel$ret.0
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@7
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Screen.drawPixel
0;JMP
// continue after call
(Screen.drawLinePixel$ret.0)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// goto command
@Screen.drawLinePixel$IF2_0
0; JMP
// label command
(Screen.drawLinePixel$IF1_0)
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push argument 2
@2
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@LESS234
D;JLT
@NOTLESS234
0;JMP
(LESS234)
D=-1
@CONTINUE234
0;JMP
(NOTLESS234)
D=0
@CONTINUE234
0;JMP
(CONTINUE234)
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// if-goto command
@SP
M=M-1
@SP
A=M
D=M
@Screen.drawLinePixel$IF1_1
D; JNE
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push argument 4
@4
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// push argument 1
@1
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push argument 5
@5
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// sub
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@SP
A=M
M=D
@SP
M=M+1
// call Screen.drawPixel 2
//push return address
@Screen.drawLinePixel$ret.1
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@7
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Screen.drawPixel
0;JMP
// continue after call
(Screen.drawLinePixel$ret.1)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// goto command
@Screen.drawLinePixel$IF2_1
0; JMP
// label command
(Screen.drawLinePixel$IF1_1)
// push argument 1
@1
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push argument 3
@3
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@LESS235
D;JLT
@NOTLESS235
0;JMP
(LESS235)
D=-1
@CONTINUE235
0;JMP
(NOTLESS235)
D=0
@CONTINUE235
0;JMP
(CONTINUE235)
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// if-goto command
@SP
M=M-1
@SP
A=M
D=M
@Screen.drawLinePixel$IF1_2
D; JNE
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push argument 4
@4
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// sub
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@SP
A=M
M=D
@SP
M=M+1
// push argument 1
@1
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push argument 5
@5
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// call Screen.drawPixel 2
//push return address
@Screen.drawLinePixel$ret.2
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@7
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Screen.drawPixel
0;JMP
// continue after call
(Screen.drawLinePixel$ret.2)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// goto command
@Screen.drawLinePixel$IF2_2
0; JMP
// label command
(Screen.drawLinePixel$IF1_2)
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push argument 4
@4
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// sub
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@SP
A=M
M=D
@SP
M=M+1
// push argument 1
@1
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push argument 5
@5
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// sub
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@SP
A=M
M=D
@SP
M=M+1
// call Screen.drawPixel 2
//push return address
@Screen.drawLinePixel$ret.3
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@7
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Screen.drawPixel
0;JMP
// continue after call
(Screen.drawLinePixel$ret.3)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// label command
(Screen.drawLinePixel$IF2_2)
// label command
(Screen.drawLinePixel$IF2_1)
// label command
(Screen.drawLinePixel$IF2_0)
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// return
// save LCL in end frame variable endFrame
@LCL
D=M
@endFrame
M=D
// save return address in variable retAddress
@5
D=A
@endFrame
D=M-D
A=D
D=M
@retAddress
M=D
// reposition return value for the caller
@SP
M=M-1
@SP
A=M
D=M
@ARG
A=M
M=D
// reposition SP
@ARG
D=M+1
@SP
M=D
// recover segments
// recover THAT
@endFrame
D=M-1
A=D
D=M
@THAT
M=D
// recover THIS
@2
D=A
@endFrame
D=M-D
A=D
D=M
@THIS
M=D
// recover ARG
@3
D=A
@endFrame
D=M-D
A=D
D=M
@ARG
M=D
// recover LCL
@4
D=A
@endFrame
D=M-D
A=D
D=M
@LCL
M=D
// actual return
@retAddress
A=M
0;JMP
// function Screen.drawDiagonal 5
(Screen.drawDiagonal)
//push zeroes
@5
D=A
@nargs
M=D
(PUSH236)
@nargs
D=M
@NOTPUSH236
D;JEQ
D=0
@SP
A=M
M=D
@SP
M=M+1
@nargs
M=M-1
@PUSH236
0; JMP
(NOTPUSH236)
// push argument 2
@2
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// sub
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@SP
A=M
M=D
@SP
M=M+1
// call Math.abs 1
//push return address
@Screen.drawDiagonal$ret.0
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@6
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Math.abs
0;JMP
// continue after call
(Screen.drawDiagonal$ret.0)
// pop local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push argument 3
@3
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push argument 1
@1
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// sub
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@SP
A=M
M=D
@SP
M=M+1
// call Math.abs 1
//push return address
@Screen.drawDiagonal$ret.1
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@6
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Math.abs
0;JMP
// continue after call
(Screen.drawDiagonal$ret.1)
// pop local 1
@1
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop local 2
@2
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop local 3
@3
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop local 4
@4
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// label command
(Screen.drawDiagonal$WHILE1_0)
// push local 2
@2
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@LESS237
D;JLT
@NOTLESS237
0;JMP
(LESS237)
D=-1
@CONTINUE237
0;JMP
(NOTLESS237)
D=0
@CONTINUE237
0;JMP
(CONTINUE237)
@SP
A=M
M=D
@SP
M=M+1
// push local 2
@2
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// eq
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@EQUAL238
D;JEQ
@NOTEQUAL238
0;JMP
(EQUAL238)
D=-1
@CONTINUE238
0;JMP
(NOTEQUAL238)
D=0
@CONTINUE238
0;JMP
(CONTINUE238)
@SP
A=M
M=D
@SP
M=M+1
// or
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D|M
@SP
A=M
M=D
@SP
M=M+1
// push local 3
@3
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 1
@1
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@LESS239
D;JLT
@NOTLESS239
0;JMP
(LESS239)
D=-1
@CONTINUE239
0;JMP
(NOTLESS239)
D=0
@CONTINUE239
0;JMP
(CONTINUE239)
@SP
A=M
M=D
@SP
M=M+1
// push local 3
@3
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 1
@1
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// eq
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@EQUAL240
D;JEQ
@NOTEQUAL240
0;JMP
(EQUAL240)
D=-1
@CONTINUE240
0;JMP
(NOTEQUAL240)
D=0
@CONTINUE240
0;JMP
(CONTINUE240)
@SP
A=M
M=D
@SP
M=M+1
// or
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D|M
@SP
A=M
M=D
@SP
M=M+1
// and
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D&M
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// if-goto command
@SP
M=M-1
@SP
A=M
D=M
@Screen.drawDiagonal$WHILE2_0
D; JNE
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push argument 1
@1
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push argument 2
@2
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push argument 3
@3
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 2
@2
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 3
@3
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Screen.drawLinePixel 6
//push return address
@Screen.drawDiagonal$ret.2
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@11
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Screen.drawLinePixel
0;JMP
// continue after call
(Screen.drawDiagonal$ret.2)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push local 2
@2
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 1
@1
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Math.multiply 2
//push return address
@Screen.drawDiagonal$ret.3
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@7
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Math.multiply
0;JMP
// continue after call
(Screen.drawDiagonal$ret.3)
// push local 3
@3
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Math.multiply 2
//push return address
@Screen.drawDiagonal$ret.4
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@7
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Math.multiply
0;JMP
// continue after call
(Screen.drawDiagonal$ret.4)
// sub
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@SP
A=M
M=D
@SP
M=M+1
// pop local 4
@4
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push local 4
@4
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@LESS241
D;JLT
@NOTLESS241
0;JMP
(LESS241)
D=-1
@CONTINUE241
0;JMP
(NOTLESS241)
D=0
@CONTINUE241
0;JMP
(CONTINUE241)
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// if-goto command
@SP
M=M-1
@SP
A=M
D=M
@Screen.drawDiagonal$IF1_1
D; JNE
// push local 2
@2
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// pop local 2
@2
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push local 4
@4
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 1
@1
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// pop local 4
@4
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// goto command
@Screen.drawDiagonal$IF2_1
0; JMP
// label command
(Screen.drawDiagonal$IF1_1)
// push local 3
@3
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// pop local 3
@3
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push local 4
@4
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// sub
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@SP
A=M
M=D
@SP
M=M+1
// pop local 4
@4
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// label command
(Screen.drawDiagonal$IF2_1)
// goto command
@Screen.drawDiagonal$WHILE1_0
0; JMP
// label command
(Screen.drawDiagonal$WHILE2_0)
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// return
// save LCL in end frame variable endFrame
@LCL
D=M
@endFrame
M=D
// save return address in variable retAddress
@5
D=A
@endFrame
D=M-D
A=D
D=M
@retAddress
M=D
// reposition return value for the caller
@SP
M=M-1
@SP
A=M
D=M
@ARG
A=M
M=D
// reposition SP
@ARG
D=M+1
@SP
M=D
// recover segments
// recover THAT
@endFrame
D=M-1
A=D
D=M
@THAT
M=D
// recover THIS
@2
D=A
@endFrame
D=M-D
A=D
D=M
@THIS
M=D
// recover ARG
@3
D=A
@endFrame
D=M-D
A=D
D=M
@ARG
M=D
// recover LCL
@4
D=A
@endFrame
D=M-D
A=D
D=M
@LCL
M=D
// actual return
@retAddress
A=M
0;JMP
// function Screen.drawLine 0
(Screen.drawLine)
//push zeroes
@0
D=A
@nargs
M=D
(PUSH242)
@nargs
D=M
@NOTPUSH242
D;JEQ
D=0
@SP
A=M
M=D
@SP
M=M+1
@nargs
M=M-1
@PUSH242
0; JMP
(NOTPUSH242)
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@LESS243
D;JLT
@NOTLESS243
0;JMP
(LESS243)
D=-1
@CONTINUE243
0;JMP
(NOTLESS243)
D=0
@CONTINUE243
0;JMP
(CONTINUE243)
@SP
A=M
M=D
@SP
M=M+1
// push argument 2
@2
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@LESS244
D;JLT
@NOTLESS244
0;JMP
(LESS244)
D=-1
@CONTINUE244
0;JMP
(NOTLESS244)
D=0
@CONTINUE244
0;JMP
(CONTINUE244)
@SP
A=M
M=D
@SP
M=M+1
// or
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D|M
@SP
A=M
M=D
@SP
M=M+1
// push argument 1
@1
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@LESS245
D;JLT
@NOTLESS245
0;JMP
(LESS245)
D=-1
@CONTINUE245
0;JMP
(NOTLESS245)
D=0
@CONTINUE245
0;JMP
(CONTINUE245)
@SP
A=M
M=D
@SP
M=M+1
// or
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D|M
@SP
A=M
M=D
@SP
M=M+1
// push argument 3
@3
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@LESS246
D;JLT
@NOTLESS246
0;JMP
(LESS246)
D=-1
@CONTINUE246
0;JMP
(NOTLESS246)
D=0
@CONTINUE246
0;JMP
(CONTINUE246)
@SP
A=M
M=D
@SP
M=M+1
// or
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D|M
@SP
A=M
M=D
@SP
M=M+1
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 511
@511
D=A
@SP
A=M
M=D
@SP
M=M+1
// gt
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@GREATER247
D;JGT
@NOTGREATER247
0;JMP
(GREATER247)
D=-1
@CONTINUE247
0;JMP
(NOTGREATER247)
D=0
@CONTINUE247
0;JMP
(CONTINUE247)
@SP
A=M
M=D
@SP
M=M+1
// or
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D|M
@SP
A=M
M=D
@SP
M=M+1
// push argument 2
@2
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 511
@511
D=A
@SP
A=M
M=D
@SP
M=M+1
// gt
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@GREATER248
D;JGT
@NOTGREATER248
0;JMP
(GREATER248)
D=-1
@CONTINUE248
0;JMP
(NOTGREATER248)
D=0
@CONTINUE248
0;JMP
(CONTINUE248)
@SP
A=M
M=D
@SP
M=M+1
// or
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D|M
@SP
A=M
M=D
@SP
M=M+1
// push argument 1
@1
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 255
@255
D=A
@SP
A=M
M=D
@SP
M=M+1
// gt
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@GREATER249
D;JGT
@NOTGREATER249
0;JMP
(GREATER249)
D=-1
@CONTINUE249
0;JMP
(NOTGREATER249)
D=0
@CONTINUE249
0;JMP
(CONTINUE249)
@SP
A=M
M=D
@SP
M=M+1
// or
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D|M
@SP
A=M
M=D
@SP
M=M+1
// push argument 3
@3
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 255
@255
D=A
@SP
A=M
M=D
@SP
M=M+1
// gt
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@GREATER250
D;JGT
@NOTGREATER250
0;JMP
(GREATER250)
D=-1
@CONTINUE250
0;JMP
(NOTGREATER250)
D=0
@CONTINUE250
0;JMP
(CONTINUE250)
@SP
A=M
M=D
@SP
M=M+1
// or
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D|M
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// if-goto command
@SP
M=M-1
@SP
A=M
D=M
@Screen.drawLine$IF1_0
D; JNE
// push constant 8
@8
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Sys.error 1
//push return address
@Screen.drawLine$ret.0
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@6
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Sys.error
0;JMP
// continue after call
(Screen.drawLine$ret.0)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// goto command
@Screen.drawLine$IF2_0
0; JMP
// label command
(Screen.drawLine$IF1_0)
// label command
(Screen.drawLine$IF2_0)
// push argument 1
@1
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push argument 3
@3
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// eq
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@EQUAL251
D;JEQ
@NOTEQUAL251
0;JMP
(EQUAL251)
D=-1
@CONTINUE251
0;JMP
(NOTEQUAL251)
D=0
@CONTINUE251
0;JMP
(CONTINUE251)
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// if-goto command
@SP
M=M-1
@SP
A=M
D=M
@Screen.drawLine$IF1_1
D; JNE
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push argument 2
@2
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Math.min 2
//push return address
@Screen.drawLine$ret.1
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@7
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Math.min
0;JMP
// continue after call
(Screen.drawLine$ret.1)
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push argument 2
@2
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Math.max 2
//push return address
@Screen.drawLine$ret.2
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@7
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Math.max
0;JMP
// continue after call
(Screen.drawLine$ret.2)
// push argument 1
@1
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Screen.drawHorizontal 3
//push return address
@Screen.drawLine$ret.3
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@8
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Screen.drawHorizontal
0;JMP
// continue after call
(Screen.drawLine$ret.3)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// goto command
@Screen.drawLine$IF2_1
0; JMP
// label command
(Screen.drawLine$IF1_1)
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push argument 2
@2
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// eq
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@EQUAL252
D;JEQ
@NOTEQUAL252
0;JMP
(EQUAL252)
D=-1
@CONTINUE252
0;JMP
(NOTEQUAL252)
D=0
@CONTINUE252
0;JMP
(CONTINUE252)
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// if-goto command
@SP
M=M-1
@SP
A=M
D=M
@Screen.drawLine$IF1_2
D; JNE
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push argument 1
@1
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push argument 3
@3
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Math.min 2
//push return address
@Screen.drawLine$ret.4
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@7
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Math.min
0;JMP
// continue after call
(Screen.drawLine$ret.4)
// push argument 1
@1
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push argument 3
@3
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Math.max 2
//push return address
@Screen.drawLine$ret.5
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@7
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Math.max
0;JMP
// continue after call
(Screen.drawLine$ret.5)
// call Screen.drawVertical 3
//push return address
@Screen.drawLine$ret.6
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@8
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Screen.drawVertical
0;JMP
// continue after call
(Screen.drawLine$ret.6)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// goto command
@Screen.drawLine$IF2_2
0; JMP
// label command
(Screen.drawLine$IF1_2)
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push argument 1
@1
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push argument 2
@2
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push argument 3
@3
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Screen.drawDiagonal 4
//push return address
@Screen.drawLine$ret.7
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@9
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Screen.drawDiagonal
0;JMP
// continue after call
(Screen.drawLine$ret.7)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// label command
(Screen.drawLine$IF2_2)
// label command
(Screen.drawLine$IF2_1)
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// return
// save LCL in end frame variable endFrame
@LCL
D=M
@endFrame
M=D
// save return address in variable retAddress
@5
D=A
@endFrame
D=M-D
A=D
D=M
@retAddress
M=D
// reposition return value for the caller
@SP
M=M-1
@SP
A=M
D=M
@ARG
A=M
M=D
// reposition SP
@ARG
D=M+1
@SP
M=D
// recover segments
// recover THAT
@endFrame
D=M-1
A=D
D=M
@THAT
M=D
// recover THIS
@2
D=A
@endFrame
D=M-D
A=D
D=M
@THIS
M=D
// recover ARG
@3
D=A
@endFrame
D=M-D
A=D
D=M
@ARG
M=D
// recover LCL
@4
D=A
@endFrame
D=M-D
A=D
D=M
@LCL
M=D
// actual return
@retAddress
A=M
0;JMP
// function Screen.drawRectangle 3
(Screen.drawRectangle)
//push zeroes
@3
D=A
@nargs
M=D
(PUSH253)
@nargs
D=M
@NOTPUSH253
D;JEQ
D=0
@SP
A=M
M=D
@SP
M=M+1
@nargs
M=M-1
@PUSH253
0; JMP
(NOTPUSH253)
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@LESS254
D;JLT
@NOTLESS254
0;JMP
(LESS254)
D=-1
@CONTINUE254
0;JMP
(NOTLESS254)
D=0
@CONTINUE254
0;JMP
(CONTINUE254)
@SP
A=M
M=D
@SP
M=M+1
// push argument 2
@2
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@LESS255
D;JLT
@NOTLESS255
0;JMP
(LESS255)
D=-1
@CONTINUE255
0;JMP
(NOTLESS255)
D=0
@CONTINUE255
0;JMP
(CONTINUE255)
@SP
A=M
M=D
@SP
M=M+1
// or
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D|M
@SP
A=M
M=D
@SP
M=M+1
// push argument 1
@1
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@LESS256
D;JLT
@NOTLESS256
0;JMP
(LESS256)
D=-1
@CONTINUE256
0;JMP
(NOTLESS256)
D=0
@CONTINUE256
0;JMP
(CONTINUE256)
@SP
A=M
M=D
@SP
M=M+1
// or
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D|M
@SP
A=M
M=D
@SP
M=M+1
// push argument 3
@3
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@LESS257
D;JLT
@NOTLESS257
0;JMP
(LESS257)
D=-1
@CONTINUE257
0;JMP
(NOTLESS257)
D=0
@CONTINUE257
0;JMP
(CONTINUE257)
@SP
A=M
M=D
@SP
M=M+1
// or
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D|M
@SP
A=M
M=D
@SP
M=M+1
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 511
@511
D=A
@SP
A=M
M=D
@SP
M=M+1
// gt
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@GREATER258
D;JGT
@NOTGREATER258
0;JMP
(GREATER258)
D=-1
@CONTINUE258
0;JMP
(NOTGREATER258)
D=0
@CONTINUE258
0;JMP
(CONTINUE258)
@SP
A=M
M=D
@SP
M=M+1
// or
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D|M
@SP
A=M
M=D
@SP
M=M+1
// push argument 2
@2
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 511
@511
D=A
@SP
A=M
M=D
@SP
M=M+1
// gt
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@GREATER259
D;JGT
@NOTGREATER259
0;JMP
(GREATER259)
D=-1
@CONTINUE259
0;JMP
(NOTGREATER259)
D=0
@CONTINUE259
0;JMP
(CONTINUE259)
@SP
A=M
M=D
@SP
M=M+1
// or
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D|M
@SP
A=M
M=D
@SP
M=M+1
// push argument 1
@1
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 255
@255
D=A
@SP
A=M
M=D
@SP
M=M+1
// gt
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@GREATER260
D;JGT
@NOTGREATER260
0;JMP
(GREATER260)
D=-1
@CONTINUE260
0;JMP
(NOTGREATER260)
D=0
@CONTINUE260
0;JMP
(CONTINUE260)
@SP
A=M
M=D
@SP
M=M+1
// or
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D|M
@SP
A=M
M=D
@SP
M=M+1
// push argument 3
@3
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 255
@255
D=A
@SP
A=M
M=D
@SP
M=M+1
// gt
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@GREATER261
D;JGT
@NOTGREATER261
0;JMP
(GREATER261)
D=-1
@CONTINUE261
0;JMP
(NOTGREATER261)
D=0
@CONTINUE261
0;JMP
(CONTINUE261)
@SP
A=M
M=D
@SP
M=M+1
// or
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D|M
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// if-goto command
@SP
M=M-1
@SP
A=M
D=M
@Screen.drawRectangle$IF1_0
D; JNE
// push constant 9
@9
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Sys.error 1
//push return address
@Screen.drawRectangle$ret.0
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@6
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Sys.error
0;JMP
// continue after call
(Screen.drawRectangle$ret.0)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// goto command
@Screen.drawRectangle$IF2_0
0; JMP
// label command
(Screen.drawRectangle$IF1_0)
// label command
(Screen.drawRectangle$IF2_0)
// push argument 1
@1
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push argument 3
@3
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Math.min 2
//push return address
@Screen.drawRectangle$ret.1
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@7
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Math.min
0;JMP
// continue after call
(Screen.drawRectangle$ret.1)
// pop local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push argument 1
@1
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push argument 3
@3
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Math.max 2
//push return address
@Screen.drawRectangle$ret.2
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@7
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Math.max
0;JMP
// continue after call
(Screen.drawRectangle$ret.2)
// pop local 1
@1
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop local 2
@2
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// label command
(Screen.drawRectangle$WHILE1_1)
// push local 2
@2
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 1
@1
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@LESS262
D;JLT
@NOTLESS262
0;JMP
(LESS262)
D=-1
@CONTINUE262
0;JMP
(NOTLESS262)
D=0
@CONTINUE262
0;JMP
(CONTINUE262)
@SP
A=M
M=D
@SP
M=M+1
// push local 2
@2
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 1
@1
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// eq
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@EQUAL263
D;JEQ
@NOTEQUAL263
0;JMP
(EQUAL263)
D=-1
@CONTINUE263
0;JMP
(NOTEQUAL263)
D=0
@CONTINUE263
0;JMP
(CONTINUE263)
@SP
A=M
M=D
@SP
M=M+1
// or
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D|M
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// if-goto command
@SP
M=M-1
@SP
A=M
D=M
@Screen.drawRectangle$WHILE2_1
D; JNE
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push argument 2
@2
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Math.min 2
//push return address
@Screen.drawRectangle$ret.3
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@7
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Math.min
0;JMP
// continue after call
(Screen.drawRectangle$ret.3)
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push argument 2
@2
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Math.max 2
//push return address
@Screen.drawRectangle$ret.4
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@7
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Math.max
0;JMP
// continue after call
(Screen.drawRectangle$ret.4)
// push local 2
@2
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Screen.drawHorizontal 3
//push return address
@Screen.drawRectangle$ret.5
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@8
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Screen.drawHorizontal
0;JMP
// continue after call
(Screen.drawRectangle$ret.5)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push local 2
@2
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// pop local 2
@2
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// goto command
@Screen.drawRectangle$WHILE1_1
0; JMP
// label command
(Screen.drawRectangle$WHILE2_1)
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// return
// save LCL in end frame variable endFrame
@LCL
D=M
@endFrame
M=D
// save return address in variable retAddress
@5
D=A
@endFrame
D=M-D
A=D
D=M
@retAddress
M=D
// reposition return value for the caller
@SP
M=M-1
@SP
A=M
D=M
@ARG
A=M
M=D
// reposition SP
@ARG
D=M+1
@SP
M=D
// recover segments
// recover THAT
@endFrame
D=M-1
A=D
D=M
@THAT
M=D
// recover THIS
@2
D=A
@endFrame
D=M-D
A=D
D=M
@THIS
M=D
// recover ARG
@3
D=A
@endFrame
D=M-D
A=D
D=M
@ARG
M=D
// recover LCL
@4
D=A
@endFrame
D=M-D
A=D
D=M
@LCL
M=D
// actual return
@retAddress
A=M
0;JMP
// function Screen.drawCircle 2
(Screen.drawCircle)
//push zeroes
@2
D=A
@nargs
M=D
(PUSH264)
@nargs
D=M
@NOTPUSH264
D;JEQ
D=0
@SP
A=M
M=D
@SP
M=M+1
@nargs
M=M-1
@PUSH264
0; JMP
(NOTPUSH264)
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@LESS265
D;JLT
@NOTLESS265
0;JMP
(LESS265)
D=-1
@CONTINUE265
0;JMP
(NOTLESS265)
D=0
@CONTINUE265
0;JMP
(CONTINUE265)
@SP
A=M
M=D
@SP
M=M+1
// push argument 1
@1
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@LESS266
D;JLT
@NOTLESS266
0;JMP
(LESS266)
D=-1
@CONTINUE266
0;JMP
(NOTLESS266)
D=0
@CONTINUE266
0;JMP
(CONTINUE266)
@SP
A=M
M=D
@SP
M=M+1
// or
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D|M
@SP
A=M
M=D
@SP
M=M+1
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 511
@511
D=A
@SP
A=M
M=D
@SP
M=M+1
// gt
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@GREATER267
D;JGT
@NOTGREATER267
0;JMP
(GREATER267)
D=-1
@CONTINUE267
0;JMP
(NOTGREATER267)
D=0
@CONTINUE267
0;JMP
(CONTINUE267)
@SP
A=M
M=D
@SP
M=M+1
// or
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D|M
@SP
A=M
M=D
@SP
M=M+1
// push argument 1
@1
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 255
@255
D=A
@SP
A=M
M=D
@SP
M=M+1
// gt
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@GREATER268
D;JGT
@NOTGREATER268
0;JMP
(GREATER268)
D=-1
@CONTINUE268
0;JMP
(NOTGREATER268)
D=0
@CONTINUE268
0;JMP
(CONTINUE268)
@SP
A=M
M=D
@SP
M=M+1
// or
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D|M
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// if-goto command
@SP
M=M-1
@SP
A=M
D=M
@Screen.drawCircle$IF1_0
D; JNE
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Sys.error 1
//push return address
@Screen.drawCircle$ret.0
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@6
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Sys.error
0;JMP
// continue after call
(Screen.drawCircle$ret.0)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// goto command
@Screen.drawCircle$IF2_0
0; JMP
// label command
(Screen.drawCircle$IF1_0)
// label command
(Screen.drawCircle$IF2_0)
// push argument 2
@2
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@LESS269
D;JLT
@NOTLESS269
0;JMP
(LESS269)
D=-1
@CONTINUE269
0;JMP
(NOTLESS269)
D=0
@CONTINUE269
0;JMP
(CONTINUE269)
@SP
A=M
M=D
@SP
M=M+1
// push argument 2
@2
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 181
@181
D=A
@SP
A=M
M=D
@SP
M=M+1
// gt
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@GREATER270
D;JGT
@NOTGREATER270
0;JMP
(GREATER270)
D=-1
@CONTINUE270
0;JMP
(NOTGREATER270)
D=0
@CONTINUE270
0;JMP
(CONTINUE270)
@SP
A=M
M=D
@SP
M=M+1
// or
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D|M
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// if-goto command
@SP
M=M-1
@SP
A=M
D=M
@Screen.drawCircle$IF1_1
D; JNE
// push constant 13
@13
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Sys.error 1
//push return address
@Screen.drawCircle$ret.1
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@6
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Sys.error
0;JMP
// continue after call
(Screen.drawCircle$ret.1)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// goto command
@Screen.drawCircle$IF2_1
0; JMP
// label command
(Screen.drawCircle$IF1_1)
// label command
(Screen.drawCircle$IF2_1)
// push argument 2
@2
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// neg
@SP
M=M-1
@SP
A=M
D=M
D=-D
@SP
A=M
M=D
@SP
M=M+1
// pop local 1
@1
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// label command
(Screen.drawCircle$WHILE1_2)
// push local 1
@1
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push argument 2
@2
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@LESS271
D;JLT
@NOTLESS271
0;JMP
(LESS271)
D=-1
@CONTINUE271
0;JMP
(NOTLESS271)
D=0
@CONTINUE271
0;JMP
(CONTINUE271)
@SP
A=M
M=D
@SP
M=M+1
// push local 1
@1
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push argument 2
@2
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// eq
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@EQUAL272
D;JEQ
@NOTEQUAL272
0;JMP
(EQUAL272)
D=-1
@CONTINUE272
0;JMP
(NOTEQUAL272)
D=0
@CONTINUE272
0;JMP
(CONTINUE272)
@SP
A=M
M=D
@SP
M=M+1
// or
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D|M
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
@SP
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
// if-goto command
@SP
M=M-1
@SP
A=M
D=M
@Screen.drawCircle$WHILE2_2
D; JNE
// push argument 2
@2
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push argument 2
@2
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Math.multiply 2
//push return address
@Screen.drawCircle$ret.2
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@7
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Math.multiply
0;JMP
// continue after call
(Screen.drawCircle$ret.2)
// push local 1
@1
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 1
@1
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Math.multiply 2
//push return address
@Screen.drawCircle$ret.3
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@7
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Math.multiply
0;JMP
// continue after call
(Screen.drawCircle$ret.3)
// sub
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@SP
A=M
M=D
@SP
M=M+1
// call Math.sqrt 1
//push return address
@Screen.drawCircle$ret.4
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@6
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Math.sqrt
0;JMP
// continue after call
(Screen.drawCircle$ret.4)
// pop local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// sub
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D-M
@SP
A=M
M=D
@SP
M=M+1
// push argument 1
@1
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 1
@1
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// push argument 0
@0
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 0
@0
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// push argument 1
@1
D=A
@address
M=D
@ARG
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 1
@1
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// call Screen.drawLine 4
//push return address
@Screen.drawCircle$ret.5
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//shift ARG
@9
D=A
@SP
D=M-D
@ARG
M=D
//shift LCL
@SP
D=M
@LCL
M=D
// call function
@Screen.drawLine
0;JMP
// continue after call
(Screen.drawCircle$ret.5)
// pop temp 0
@SP
M=M-1
@SP
A=M
D=M
@R5
M=D
// push local 1
@1
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@address
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
@y
M=D
@SP
M=M-1
@SP
A=M
D=M
@y
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// pop local 1
@1
D=A
@address
M=D
@LCL
D=M
@address
M=M+D
@SP
M=M-1
@SP
A=M
D=M
@address
A=M
M=D
// goto command
@Screen.drawCircle$WHILE1_2
0; JMP
// label command
(Screen.drawCircle$WHILE2_2)
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// return
// save LCL in end frame variable endFrame
@LCL
D=M
@endFrame
M=D
// save return address in variable retAddress
@5
D=A
@endFrame
D=M-D
A=D
D=M
@retAddress
M=D
// reposition return value for the caller
@SP
M=M-1
@SP
A=M
D=M
@ARG
A=M
M=D
// reposition SP
@ARG
D=M+1
@SP
M=D
// recover segments
// recover THAT
@endFrame
D=M-1
A=D
D=M
@THAT
M=D
// recover THIS
@2
D=A
@endFrame
D=M-D
A=D
D=M
@THIS
M=D
// recover ARG
@3
D=A
@endFrame
D=M-D
A=D
D=M
@ARG
M=D
// recover LCL
@4
D=A
@endFrame
D=M-D
A=D
D=M
@LCL
M=D
// actual return
@retAddress
A=M
0;JMP
