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

MOV AX, 5
MOV BX, 6
MOV CX, AX
MOV AX, BX
MOV BX, CX


 

;exit to DOS
               
MOV AX,4C00H
INT 21H

MAIN ENDP
    END MAIN
