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

; a

MOV AH, 1
INT 33

MOV DL, AL
MOV AH, 2
INT 33

; line break

MOV DL,10
MOV AH, 2
INT 33

MOV DL, 13
MOV AH, 2
INT 33

; b

MOV AH, 1
INT 33

MOV DL, AL
ADD DL, 32

MOV AH,2
INT 33


;exit to DOS
               
MOV AX,4C00H
INT 21H

MAIN ENDP
    END MAIN