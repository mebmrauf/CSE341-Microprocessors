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

MOV AX, 0CA92H
MOV BX, 0BAF9H
MUL BX



 

;exit to DOS
               
MOV AX,4C00H
INT 21H

MAIN ENDP
    END MAIN
