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

MOV AL, 4

CMP AL, 1
JE DO
CMP AL, 3
JE DO

CMP AL,  2
JE DE
CMP AL, 4
JE DE

DO:
MOV DL, 111
MOV AH, 2
INT 33
JMP END

DE:
MOV DL,101
MOV AH, 2
INT 33

;exit to DOS
END:
               
MOV AX,4C00H
INT 21H

MAIN ENDP
    END MAIN