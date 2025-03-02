// Program: Screen Color Toggle Based on Keyboard Input
// Description:
// Continuously monitors the keyboard. If any key is pressed, the program fills the screen with black.
// If no key is pressed, it fills the screen with white.

@SCREEN
D=A
@0
M=D  // Initialize RAM[0] with the starting address of the screen (16384).

(KBDCHECK)
@KBD
D=M
@BLACK
D;JGT  // If a key is pressed (KBD > 0), jump to BLACK.
@WHITE
D;JEQ  // If no key is pressed (KBD == 0), jump to WHITE.

@KBDCHECK
0;JMP  // Repeat the keyboard check.

(BLACK)
@1
M=-1  // Set RAM[1] to -1, representing the color black (all pixels on).
@CHANGE
0;JMP  // Proceed to change the screen color.

(WHITE)
@1
M=0  // Set RAM[1] to 0, representing the color white (all pixels off).
@CHANGE
0;JMP  // Proceed to change the screen color.

(CHANGE)
@1
D=M  // D now holds the color value (black or white).

@0
A=M  // A is set to the current screen pixel address from RAM[0].
M=D  // Set the pixel at the current address to the desired color.

@0
M=M+1  // Move to the next pixel address.
A=M

@CHANGE
D=A-16384
@24576
D=A-D  // Check if the current address has reached the end of the screen.

@KBDCHECK
D;JLT  // If not at the end, continue changing pixels.

@RESTART
0;JMP  // Restart the program after filling the screen.
