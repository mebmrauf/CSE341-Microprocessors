.MODEL SMALL
 
.STACK 100H

.DATA 

; declare variables here

.CODE
MAIN PROC

; initialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here

MOV AX, 0
CMP AX, 0

JL NEGT

JG GRET

MOV BX, 0
JMP END

NEGT:
MOV BX, -1

GRET:
MOV BX, 1

;exit to DOS
END:
               
MOV AX,4C00H
INT 21H

MAIN ENDP
    END MAIN