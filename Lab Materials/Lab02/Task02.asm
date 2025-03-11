.MODEL SMALL
 
.STACK 100H

.DATA 

; declare variables here 
STR1 DB "Please insert a number:$"
STR2 DB "Please insert another number:$"
SUMM DB "Addition:$"
SUBT DB "Subtraction:$"
MULT DB "Multiplication:$"
DIVD DB "Divide:$"

.CODE
MAIN PROC

; initialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here
LEA DX, STR1
MOV AH, 9
INT 33 ; USE 21H/33


MOV AH, 1
INT 33
SUB AL, 48
MOV BL, AL ; INPUT 1

MOV DL, 10
MOV AH, 2
INT 33

MOV DL, 13
MOV AH, 2
INT 33

LEA DX, STR2
MOV AH, 9
INT 33

MOV AH, 1
INT 33
SUB AL, 48
MOV CL, AL ; INPUT 2

MOV DL, 10
MOV AH, 2
INT 33

MOV DL, 13
MOV AH, 2
INT 33

LEA DX, SUMM
MOV AH, 9
INT 33

MOV DL, BL
ADD DL, CL ; Addition
ADD DL, 48

MOV AH, 2
INT 33

MOV DL, 10
MOV AH, 2
INT 33

MOV DL, 13
MOV AH, 2
INT 33

LEA DX, SUBT
MOV AH, 9
INT 33

MOV DL, BL
SUB DL, CL ; Subtraction
ADD DL, 48

MOV AH, 2
INT 33

MOV DL, 10
MOV AH, 2
INT 33

MOV DL, 13
MOV AH, 2
INT 33

LEA DX, MULT
MOV AH, 9
INT 33

MOV AL, BL
MUL CL ; Multiplication
MOV DL, AL
ADD DL, 48

MOV AH, 2
INT 33

MOV DL, 10
MOV AH, 2
INT 33

MOV DL, 13
MOV AH, 2
INT 33

LEA DX, DIVD
MOV AH, 9
INT 33

MOV AX, BX
DIV CL ; Divide
MOV DL, AL
ADD DL, 48

MOV AH, 2
INT 33

;exit to DOS
               
MOV AX,4C00H
INT 21H

MAIN ENDP
    END MAIN