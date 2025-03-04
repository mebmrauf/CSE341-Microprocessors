.MODEL SMALL
 
.STACK 100H

.DATA

; declare variables here 
X DB 5
Y DB 6

.CODE
MAIN PROC

; initialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here

MOV AL,X
MUL Y



 

;exit to DOS
               
MOV AX,4C00H
INT 21H

MAIN ENDP
    END MAIN
