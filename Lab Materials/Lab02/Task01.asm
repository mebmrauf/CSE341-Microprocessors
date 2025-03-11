.MODEL SMALL
 
.STACK 100H

.DATA 

; declare variables here 
STR DB "Please insert a character:$"

.CODE
MAIN PROC

; initialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here
LEA DX, STR
MOV AH, 9
INT 33 ; USE 21H/33


MOV AH, 1
INT 33
MOV BL, AL


MOV DL, 10
MOV AH, 2
INT 33

MOV DL, 13
MOV AH, 2
INT 33

MOV DL, BL
MOV AH, 2
INT 33 

;exit to DOS
               
MOV AX,4C00H
INT 21H

MAIN ENDP
    END MAIN