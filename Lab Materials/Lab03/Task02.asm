.MODEL SMALL
 
.STACK 100H

.DATA 

; declare variables here
SMALL DB "Smallest characters: $" 

.CODE
MAIN PROC

; initialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here

MOV AL, 130
MOV BL,  128

CMP AL, BL

LEA DX, SMALL
MOV AH, 9
INT 33

JL PRINTAL
MOV DL, BL
MOV AH, 2
INT 33

PRINTAL:
MOV DL, AL
MOV AH, 2
INT 33

;exit to DOS
END:
               
MOV AX,4C00H
INT 21H

MAIN ENDP
    END MAIN