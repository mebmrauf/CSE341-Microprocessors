# CSE341 : LAB Mid

## Question 01

You are a systems engineer working for an intelligence agency, One of the agency's data vaults has gone into lockdown due to an anomaly. To unlock the vault, the onboard microcontroller requires a security checksum, which is calculated based on a range of even numbers. According to the security protocol: "The vault will unlock only when the checksum equals the sum of all even integers between a provided range (inclusive)." You are provided with two integers: AX → The starting number of the range. BX → The ending number of the range. You need to write an assembly program that:

a. Loops through the numbers between AX and BX (inclusive),

b. Adds only the even numbers to calculate the checksum

c. Stores the final sum in register DX. Once the checksum is computed, it is sent to the vault controller.

**Initiated Registers**

```
MOV AX, 2
MOV BX, 25
```

```
MOV AX, 120
MOV BX, 400
```

**Resulted Registers**

```
DX = 156
```

```
DX = 36600
```

## Question 02

You are a designer working on a tiled courtyard for a palace. Each tile is a perfect square, and inside each square tile, you carve out a perfect circle so that it touches all four sides of the square - meaning the circle is inscribed. You want to coat only the area outside the circle but inside the square with gold paint, leaving the circle area untouched. To calculate how much paint you need, you must compute the difference between the area of the square and the area of the circle. The side of the square, the radius of the circle needs to be taken as input from the user. You must calculate: **Paint Area=Area of Square-Area of Circle = s² - πr²**, where **s** is the side of the square and **r** is the radius of the circle. [Both of the inputs are single digit and you can consider **π = 3**]. You need to print the final result [difference between the areas].

**Standard Input**

```
95
```

```
84
```

**Standard Output**

```
6
```

```
16
```

**Console Display**

```
95
6
```

```
84
16
```

**Explanations**

```
s = 9, r = 5
=> 9^2 - 3 * 5^2 = 81 - 75 = 6 
```

```
s = 8, r = 4 8^2 - 3 * 4^2 = 64 - 48 = 16
```

## Question 03

Mr. Karim recently moved into a new apartment in Dhaka, and at the end of the month, he received his first electricity bill. The billing system of the local power company works as follows:

| Units | Charge/Unit |
| :---- | :---- |
| 0 \-199 | Tk. 1 |
| 200 \- 399 | Tk. 2 |
| 400 \- 599 | Tk. 3 |

**If the bill exceeds Tk. 500, a surcharge of 20% will be added and the minimum bill should be Tk. 120.**

You have to take **one variable** as **user input** - the number of units consumed. Calculate the bill to be paid by the customer and display it.

**Sample Case 1**

```
Test Data : Units Consumed : 50
Expected Output :
Amount charged at Tk. 50 * 1 = 50
Minimum bill has to be paid
Payable bill: Tk. 120 
```

**Sample Case 2**

```
Test Data : Units Consumed: 650
Expected Output :
Amount charged at Tk. 650 * 4 = 2600
Surcharge(20%) = Tk. 520
Payable bill: 2600 + 520 = 3120 Tk.
```

## Question 04

You've been hired as a junior developer for a digital scoreboard system at a local sports club. The system tracks match scores using a special 4-digit code, where:

- The **first two digits represent Team A's score**, and
- The **last two digits represent Team B's score**.

As part of the system's testing, you've been asked to perform a special operation:

- You have to declare a variable named id and store your full student ID in it.
- Declare a variable named score_code and store the last 4-digit of your id which is match score (example: 1523 means Team A scored 15 and Team B scored 23).
- Next, **reverse the positions of the two scores** to form a new 4-digit code (i.e., swap the first two digits with the last two digits).
- After that:
  - **Add the new Team A score and Team B score** together.
  - Display the **original scores**, the **swapped scores**, and the **total combined score**.

**Sample Input**

```
id = 20231234
```

```
id = 21134456
```

**Sample Output**

```
Match score (last 4 digits): 1234
Swapped score: 3412
Team A: 34
Team B: 12 
Total Combined Score: 46
```

```
Match score (last 4 digits): 4456
Swapped score: 5644
Team A: 56
Team B: 44
Total Combined Score: 100
```

**Explanation**

```
Last 4 digits = 1234
Swap positions of Team A and Team B: 3412
Team A = 34
Team B = 12
Total = 34 + 12 = 46
```

```
Last 4 digits = 4456
Swap positions: 5644
Team A = 56
Team B = 44
Total = 56 + 44 = 100
```
