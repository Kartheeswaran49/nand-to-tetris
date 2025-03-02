// Multiplies the values in RAM[0] and RAM[1], storing the result in RAM[2].
// Assumes RAM[0] and RAM[1] are non-negative integers.

// Initialize RAM[2] to 0 to hold the product.
@2
M=0

// Load the value from RAM[0] into D-register.
@0
D=M

// If RAM[0] is zero, skip multiplication and jump to END.
@END
D;JEQ

// Load the value from RAM[1] into D-register.
@1
D=M

// If RAM[1] is zero, skip multiplication and jump to END.
@END
D;JEQ

// Copy the value from RAM[0] to RAM[3] to use as a counter.
@0
D=M
@3
M=D

// Start of the multiplication loop.
(LOOP)
// Load the value from RAM[1] into D-register.
@1
D=M

// Add the value of RAM[1] to RAM[2] (accumulating the product).
@2
M=D+M

// Decrement the counter in RAM[3].
@3
M=M-1

// Load the updated counter value into D-register.
D=M

// If the counter (RAM[3]) is greater than zero, repeat the loop.
@LOOP
D;JGT

// End of the program.
(END)
// Infinite loop to halt the program.
@END
0;JMP
