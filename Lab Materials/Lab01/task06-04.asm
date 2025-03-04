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

DEC A 
MOV BX, B
SUB BX, A
MOV A, BX



 

;exit to DOS
               
MOV AX,4C00H
INT 21H

MAIN ENDP
    END MAIN
