                   

org 100h

.MODEL SMALL 

.STACK 100h

.DATA 

MSG1 DB 'Humidity is high $'
MSG2 DB 'Humidity is average $'
MSG3 DB 'Humidity is low $'

.CODE
MAIN PROC
       
    MOV AX,@DATA
    MOV DX,AX
    MOV DX,45C0h
    IN AX,DX
    MOV AL,60h
    CMP AL,80h
    JA GREATER
    CMP AL,50h
    JBE LESSER
    JMP ABOVEBELOW
      
    


GREATER:
    ;Displaying message 2
    LEA DX,MSG1
    JMP PRINT


LESSER:
    ;Displaying message 2
    LEA DX,MSG3
    JMP PRINT
   
    
ABOVEBELOW:
    ;Displaying message 2
    LEA DX,MSG2
    JMP PRINT
    
    
PRINT:
    MOV AH,9
    INT 21h
    
    
    
ENDP
END MAIN




ret

