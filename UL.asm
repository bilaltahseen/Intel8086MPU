TITLE PGM1;Conversion of lower case to upper case

.MODEL SMALL

.STACK 200h

.DATA

CR  EQU 0Dh
LF EQU 0Ah
MSG1 DB "Enter a lower case letter: $"
MSG2 DB CR,LF,"In upper case is"
CHAR DB ?,"$"

.CODE

MAIN    PROC

;Loading datasegment based address


MOV AX,@DATA
MOV DX,AX

;Displaying message 1

LEA DX,MSG1
MOV AH,9
INT 21h

;Input lower case letter

MOV AH,1
INT 21h
SUB AL,20h
MOV CHAR,AL

;Displaying message 2

LEA DX,MSG2
MOV AH,9
INT 21h

;Exit DOS

MOV AH,4Ch
INT 21h

MAIN    ENDP

END MAIN

