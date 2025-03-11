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

CMP AL, 89
JE PRINT
CMP  AL, 121
JE PRINT
JMP END

PRINT:
MOV DL, AL
MOV AH, 2
INT 33


;exit to DOS
END:
               
MOV AX,4C00H
INT 21H

MAIN ENDP
    END MAIN