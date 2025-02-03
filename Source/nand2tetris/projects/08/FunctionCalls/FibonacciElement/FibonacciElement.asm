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
// function Main.fibonacci 0
(Main.fibonacci)
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
// push constant 2
@2
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
@LESS1
D;JLT
@NOTLESS1
0;JMP
(LESS1)
D=-1
@CONTINUE1
0;JMP
(NOTLESS1)
D=0
@CONTINUE1
0;JMP
(CONTINUE1)
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
@Main.fibonacci$IF_TRUE
D; JNE
// goto command
@Main.fibonacci$IF_FALSE
0; JMP
// label command
(Main.fibonacci$IF_TRUE)
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
// label command
(Main.fibonacci$IF_FALSE)
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
// call Main.fibonacci 1
//push return address
@Main.fibonacci$ret.0
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
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
@Main.fibonacci
0;JMP
// continue after call
(Main.fibonacci$ret.0)
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
// call Main.fibonacci 1
//push return address
@Main.fibonacci$ret.1
D=A
@SP
A=M
M=D
@SP
M=M+1
// save cur segments
// LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
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
@Main.fibonacci
0;JMP
// continue after call
(Main.fibonacci$ret.1)
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
// function Sys.init 0
(Sys.init)
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
// push constant 4
@4
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Main.fibonacci 1
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
@Main.fibonacci
0;JMP
// continue after call
(Sys.init$ret.0)
// label command
(Sys.init$WHILE)
// goto command
@Sys.init$WHILE
0; JMP
