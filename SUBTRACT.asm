DATA SEGMENT
        A DD 5F85H
        B DD 6DA4H
        RES DD ?
DATA ENDS

CODE SEGMENT
ASSUME  DS:DATA, CS:CODE
START:
        MOV AX,DATA
        MOV DS,AX

        MOV AX,DS:WORD PTR A
        SBB AX,DS:WORD PTR B
        MOV BX,DS:WORD PTR A+2
        SBB BX,DS:WORD PTR [B+2]  ; Replace ADD with ADC to add carry
        MOV DS:WORD PTR RES,AX
        MOV DS:WORD PTR [RES+2],BX
        


CODE ENDS
END START