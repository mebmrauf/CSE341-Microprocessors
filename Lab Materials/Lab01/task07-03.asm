.MODEL SMALL
 
.STACK 100H

.DATA

; declare variables here
X DB 8
Y DB 4
Z DB 3

.CODE
MAIN PROC

; initialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here

MOV AL, X
MOV BL, Y
MUL BL
MOV BL, Z
DIV BL



 

;exit to DOS
               
MOV AX,4C00H
INT 21H

MAIN ENDP
    END MAIN
