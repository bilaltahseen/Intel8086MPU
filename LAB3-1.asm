PUBLIC ARITH
.MODEL SMALL
.DATA
    MSG1 DB 0Dh,0Ah,'RESULT OF ADDITION IS: '
    RES1 DW ?,'$'
    MSG2 DB 0Dh,0Ah,'RESULT OF SUBTRACTION IS: '
    RES2 DW ?,'$'
.CODE
ARITH PROC NEAR
	CMP AL,31h
	JNE SUB1
		MOV AX,BX
		ADD AL,CL
		AAA
		ADD AL,30h
		XCHG AL,AH
		MOV RES1,AX
		LEA DX,MSG1
		MOV AH,9
		INT 21h
		JMP END1
SUB1:	MOV AX,BX
		SUB AL,CL
		AAS
		ADD AL,30h
		XCHG AL,AH
		MOV RES2,AX
		LEA DX,MSG2
		MOV AH,9
		INT 21h
END1:	RET
ARITH ENDP
END