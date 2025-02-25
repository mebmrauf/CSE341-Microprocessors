# Lab Tasks

## Task01
Take input in the register AX, and then move it to BX using the MOV instruction.
```
MOV AX, 4
MOV BX, AX
```

## Task02
Swap two numbers, using a maximum of 3 registers.

Hint: Use the MOV instruction.
```
MOV AX, 4
MOV BX, 8

MOV CX, AX
MOV AX, BX
MOV BX, CX
```

## Task03
Add two numbers using two registers.
```
MOV AX, 4
MOV BX, 8
ADD AX, BX
```

## Task04
Subtract two numbers using two registers. Do you always get the correct answer?
```
MOV AX, 4
MOV BX, 8
SUB BX, AX
```

What happens when you subtract larger number from the smaller one?
```
MOV AX, 5
MOV BX, 65535
SUB AX, BX
```

`Answer could be wrong for overflow/underflow issues.`

## Task05
Swap two numbers using ADD/SUB instructions only.
```
MOV AX, 5
MOV BX, 6

ADD AX, BX ; AX = 5 + 6 = 11
SUB BX, AX ; BX = 6 - 11 = -5
NEG BX ; BX = -(-5) = 5

SUB AX, BX ; AX = 11 - 5 = 5
```

## Task06
Perform the following arithmetic instructions. A, B, C are three variables to be
declared beforehand
1. A = B - A
2. A = -(A + 1)
3. C = A + (B + 1); use inc
4. A = B – (A – 1); use dec

## Task07
Perform the following arithmetic operations
1. X * Y
2. X / Y
3. X * Y / Z

## Task08
Perform the following arithmetic operations
1. 36DF * AF
2. F4D5 / C9A5
3. CA92 * BAF9
4. C2A2 * ABCD / BED

## Task09
Write two examples for each combination of registers possible for the 'mov' instruction.
Hint: See the table above to see all the possible combinations.
## Task10
Write two examples for each combination of registers possible for the 'add' and
'sub' instructions.
Hint: See the table above to see all the possible combinations.
## Task11
Perform the following arithmetic operation: (1 + 2) * (3 – 1) / 5 + 3 + 2 – (1 * 2)