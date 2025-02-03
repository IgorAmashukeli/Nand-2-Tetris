// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

// Pseudocode 1
// while (true)
//  key_value = getkeyvalue
//  if key_value > 0:
//      for i = 0 to EndRow:
//          Screen[i] = 1....1 (-1)
//  if key_value == 0:
//      for i = 0 to EndRow:
//           Screen[i] = 0....0 (0)
//
//
//  Pseudocode 2
//  LOOP:
//      key_value = get_key_value
//      key_value JNE -> BLACK
//      key_value JMP -> WHITE
//
//  BLACK:
//      
//      addr = SCREEN
//      n = 255
//      i = 0
//
//  BLACKROW:
//      j = i - n
//      j > 0 -> JMP LOOP
//
//      RAM[addr] = -1
//      addr = addr + 32
//      i = i + 1
//
//      JMP BLACKROW
//
//  WHITE: 
//  
//      addr = SCREEN
//      n = 255
//      i = 0
//
//  WHITEROW
//      j = i - n
//      j > 0 -> JMP LOOP
//
//      RAM[addr] = 0
//      addr = addr + 32
//      i = i + 1
//
//      JMP WHITEROW
//


    (LOOP)
    @KBD
    D = M // D = RAM[KBD] - read keyboard value

    @BLACK
    D; JNE // if RAM[KBD] != 0 => BLACK

    @WHITE
    0; JMP //else JMP to WHITE

    (BLACK)
    @SCREEN
    D = A // D = SCREEN

    @addr
    M = D //addr = SCREEN

    @8191
    D = A // D = 8191

    @n
    M = D // n = 8191

    @i
    M = 0 //i = 0

    (BLACKROW)
    @i
    D = M // save i

    @j
    M = D // j = i

    @n
    D = M // take n

    @j
    M = M - D // j = i - n

    @j
    D = M // take j

    @LOOP
    D; JGT

    @addr
    D = M

    @addrval
    A = D
    M = -1

    @addr
    M = M + 1 // addr = addr + 1

    @i
    M = M + 1 // i = i + 1

    @BLACKROW //return to make rows black
    0;JMP



    (WHITE)
    @SCREEN
    D = A // D = SCREEN

    @addr
    M = D //addr = SCREEN

    @8191
    D = A // D = 255

    @n
    M = D // n = 255

    @i
    M = 0 //i = 0

    (WHITEROW)
    @i
    D = M // save i

    @j
    M = D // j = i

    @n
    D = M // take n

    @j
    M = M - D // j = i - n

    @j
    D = M // take j

    @LOOP
    D; JGT

    @addr
    D = M //save the addr 

    @addrval
    A = D   //put the addr value to the adrres
    M = 0  //RAM[addr_value] = 0
    
    @addr
    M = M + 1 // addr = addr + 32

    @i
    M = M + 1 // i = i + 1

    @WHITEROW //return to make rows white
    0;JMP