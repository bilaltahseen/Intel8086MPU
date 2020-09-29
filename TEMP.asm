org 100h

.MODEL SMALL
.STACK 100h
.DATA
    DISPLAY_MESSAGE DB "Enter Value of Temperature in C !$"
    RESULT_MESSAGE DB 0Dh,0Ah, "In Kelvin Is ="
    RESULT_C DW ?,"$"
    C DB ?
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DX,AX
    JMP INPUT

INPUT:
    LEA DX,DISPLAY_MESSAGE ;Display Message
    MOV AH,9
    INT 21h
           
    MOV AH,1 ;1st Digit
    INT 21h
    SUB AL,30h  
    MOV CH,AL
    
    MOV AH,1 ;2nd Digit
    INT 21h
    SUB AL,30h
    MOV CL,AL    
    MOV AL,CH
    MOV BL,10h
    MUL BL
    ADD CL,AL
    JMP CONVERSION

CONVERSION:
    MOV AL,CL
    MOV BX,273h
    ADC AX,BX
    ADD AX,3030h
    AAA
    MOV [RESULT_C],AX
    JMP PRINT

PRINT:
    MOV BX,OFFSET RESULT_C
    MOV DL,BYTE PTR[BX]
    
    
    
   
    
    
    
    
     
  
    
    
    
    
    
    
  
 

ret