// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.

// Put your code here.



//Pseudocode 1:

//a = RAM[0]

//b = 0

//while a != 0:
    //b += RAM[1]
    //a -=1

//RAM[2] = b
//finish

//Pseudocode 2:

//a = RAM[0]

//b = 0

//LOOP

//a; JLE; END;

//b += RAM[1]

//a -= 1

//JMP LOOP;

//END

//RAM[2] = b
//finish



    @R0 // select 0 register
    D = M // put D = RAM[0]

    @a
    M = D // a = D = RAM[0]

    @b
    M = 0   //b = 0

    (LOOP)

    @a
    D = M // D = a = RAM[0]

    @END
    D; JLE // if d = a <= 0 => while loop breaks => we go to end part

    @R1 //select 1 register
    D = M // put D = RAM[1]

    @b
    M = M + D // put b = b + RAM[1] => b += RAM[1]

    @a
    M = M - 1   //put a = a - 1

    @LOOP
    0;JMP   //return to while loop

    (END)
    @b
    D = M //save b

    @R2
    M = D //RAM[2] = b

    @22 //this is 22 line
    0;JMP //while true loop






