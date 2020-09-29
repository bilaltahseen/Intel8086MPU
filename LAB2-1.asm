.MODEL  SMALL
.STACK  100h
.DATA
    LIST1  DW  0100h,2000h,0200h,2050h ;word is 2 bytes
    MSG    DB  'ENTER COUNT: $'
.CODE
MAIN  PROC   
    MOV  AX , @DATA
    MOV  DS , AX
    LEA  DX , MSG
    MOV  AH , 9
    INT  21h
    MOV  AH , 1
    INT  21h
    MOV  CL , AL
    AND  CL , 0Fh
    LEA  BX , LIST1
    LES  DI , [BX + 04h]
    LDS  SI , [BX]
    MOV  [SI] , 6050h
    MOV  [SI + 2] , 7080h
    MOV  [SI + 4] , 2010h
    MOV  [SI + 6] , 9070h
    MOV  [SI + 8] , 40C0h
    CLD
    REP MOVSB
    MOV  AH , 4Ch
    INT  21h
    MAIN  ENDP
END  MAIN
