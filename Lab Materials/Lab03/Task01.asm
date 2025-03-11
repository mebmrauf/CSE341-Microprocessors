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

MOV AX, -7
CMP AX, 0
JGE END
MOV AX, 5

;exit to DOS
END:
               
MOV AX,4C00H
INT 21H

MAIN ENDP
    END MAIN