.MODEL SMALL
 
.STACK 100H

.DATA

; declare variables here
A DW ?
B DW ?
C DW ?

.CODE
MAIN PROC

; initialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here

MOV A, 5
MOV B, 6

MOV AX, B
SUB AX, A
MOV A, AX



 

;exit to DOS
               
MOV AX,4C00H
INT 21H

MAIN ENDP
    END MAIN
