TITLE PGM2a:Conversion from small to capital

EXTRN CONVERT:NEAR

.MODEL SMALL

.STACK 100h

.DATA 

MSG DB "Enter a lower case letter: $"

.CODE

MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    LEA DX,MSG
    MOV AH,9
    INT 21h
    MOV AH,1
    INT 21h
    CALL CONVERT
    MOV AH,4Ch
    INT 21h
    MAIN ENDP
END MAIN
