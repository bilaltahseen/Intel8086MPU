.MODEL  SMALL
.STACK  100h
.DATA
    MSG1 DB 'ENTER 5 NUMBERS TO BE ADDED: $'
    MSG2 DB 0Dh, 0Ah,'THE RESULT IS: '
    SUM  DW ?,'$'
.CODE
MAIN PROC
    MOV  AX , @DATA
	MOV  DS , AX
	MOV CX , 2
	MOV BX , 0
	LEA DX , MSG1
	MOV AH , 9
	INT 21h
    HERE:	MOV AH , 1
	        INT 21h
	        SUB AL , 30h
        	ADD BL , AL
        	LOOP HERE
        	MOV AL , BL
        	AAM
        	ADD AX , 3030h
        	XCHG AL , AH
        	MOV SUM , AX
        	LEA DX , MSG2
        	MOV AH , 9
        	INT 21h
        	MOV  AH , 4Ch
        	INT  21h
MAIN  ENDP
END MAIN