PUBLIC CONVERT

.MODEL SMALL

.STACK 100h

.DATA

CR EQU 0Dh
LF EQU 0Ah
MSG DB CR,LF,'In uppercase it is:'
CHAR DB -20h,'$'

.CODE

CONVERT PROC NEAR
    PUSH AX
    PUSH DX
    ADD CHAR,AL
    LEA DX,MSG
    MOV AH,9
    INT 21h
    POP DX
    POP AX
    RET
    CONVERT ENDP
END