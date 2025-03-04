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

MOV AX, 1
ADD AX, 2
MOV BX, 3
SUB BX, 1
MUL BX
MOV CX, 5
DIV CX
ADD AX, 3
ADD AX, 2
MOV BX, AX
MOV AL, 1
MOV CL, 2
MUL CL
SUB BX, AX
MOV AX, BX
 

;exit to DOS
               
MOV AX,4C00H
INT 21H

MAIN ENDP
    END MAIN
