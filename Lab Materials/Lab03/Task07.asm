.MODEL SMALL
 
.STACK 100H

.DATA 

; declare variables here
EV DB "Even$"
OD DB "Odd$"

.CODE
MAIN PROC

; initialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here

MOV AH, 1
INT 33

MOV BL, 2
DIV BL

CMP AH, 0

MOV DL, 10
MOV AH, 2
INT 33

MOV DL, 13
MOV AH, 2
INT 33

JNE ODD
LEA DX, EV
MOV AH, 9
INT 33
JMP END

ODD:
LEA DX, OD
MOV AH, 9
INT 33


;exit to DOS
END:
               
MOV AX,4C00H
INT 21H

MAIN ENDP
    END MAIN