.MODEL SMALL
.STACK 100h
.DATA
MSG1  DB  'ENTER A DIGIT FOR ADDITION: $'
LIST1  DB  '5' , '6' , '4' , '8' , '9' , '7' , '3' , '2' , '1'
MSG2  DB  0Dh, 0Ah, 'THE RESULT IS: '
RESULT  DW  ?, '$'
.CODE
MAIN PROC
    MOV  AX , @DATA
    MOV  DS , AX
    LEA  DX , MSG1
    MOV  AH , 9
    INT  21h
    MOV  AH , 1
    INT  21h
    MOV  DL , AL
    LEA  BX , LIST1
    MOV  AL , 0 ;Index of LIST1 is Zero is move to al
    XLAT
    MOV  AH , 0
    ADD  AL , DL
    AAA
    ADD  AX , 3030h
    XCHG  AL , AH
    MOV  RESULT , AX
    LEA  DX , MSG2
    MOV  AH , 9
    INT  21h
    MOV  AH , 4Ch
    INT  21h
    MAIN  ENDP
END  MAIN
