.MODEL SMALL
 
.STACK 100H

.DATA

; declare variables here
X DW 30
Y DB 5


.CODE
MAIN PROC

; initialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here

MOV AX, X
MOV BL, Y
DIV BL



 

;exit to DOS
               
MOV AX,4C00H
INT 21H

MAIN ENDP
    END MAIN
