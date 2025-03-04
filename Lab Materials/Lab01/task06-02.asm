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

INC A
NEG A



 

;exit to DOS
               
MOV AX,4C00H
INT 21H

MAIN ENDP
    END MAIN
