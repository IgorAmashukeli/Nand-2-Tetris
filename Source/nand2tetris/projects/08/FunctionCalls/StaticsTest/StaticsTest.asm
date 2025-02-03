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
// function Class1.set 0
(Class1.set)
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
// pop static 0
@SP
M=M-1
@SP
A=M
D=M
@Class1.0
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
// pop static 1
@SP
M=M-1
@SP
A=M
D=M
@Class1.1
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
// function Class1.get 0
(Class1.get)
//push zeroes
@0
D=A
@nargs
M=D
(PUSH1)
@nargs
D=M
@NOTPUSH1
D;JEQ
D=0
@SP
A=M
M=D
@SP
M=M+1
@nargs
M=M-1
@PUSH1
0; JMP
(NOTPUSH1)
// push static 0
@Class1.0
D=M
@SP
A=M
M=D
@SP
M=M+1
// push static 1
@Class1.1
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
// function Class2.set 0
(Class2.set)
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
// pop static 0
@SP
M=M-1
@SP
A=M
D=M
@Class2.0
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
// pop static 1
@SP
M=M-1
@SP
A=M
D=M
@Class2.1
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
// function Class2.get 0
(Class2.get)
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
// push static 0
@Class2.0
D=M
@SP
A=M
M=D
@SP
M=M+1
// push static 1
@Class2.1
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
// function Sys.init 0
(Sys.init)
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
// push constant 6
@6
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
// call Class1.set 2
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
@Class1.set
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
// push constant 23
@23
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
// call Class2.set 2
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
@Class2.set
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
// call Class1.get 0
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
@Class1.get
0;JMP
// continue after call
(Sys.init$ret.2)
// call Class2.get 0
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
@Class2.get
0;JMP
// continue after call
(Sys.init$ret.3)
// label command
(Sys.init$WHILE)
// goto command
@Sys.init$WHILE
0; JMP
