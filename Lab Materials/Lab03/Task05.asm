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

MOV AH, 1
INT 33

CMP AL, 65
JGE PUP
JMP END

PUP:
CMP AL, 90
JLE UP
JMP END

UP:
MOV DL, AL
MOV AH, 2
INT 33

;exit to DOS
END:
               
MOV AX,4C00H
INT 21H

MAIN ENDP
    END MAIN