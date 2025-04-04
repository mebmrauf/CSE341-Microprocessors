# CSE341 : LAB03 Evaluation

## SET - A

### Question 01

A robotic arm operates in two modes: **Pick Mode** and **Place Mode**. The mode is determined by a **single-digit input (0-9)**:
- If the input is an **even number**, the robot enters **Pick Mode** and prints "Picking Object".
- If the input is an **odd number**, the robot enters **Place Mode** and prints "Placing Object".
- However, if the input is **5**, the robot enters a **special maintenance mode** and prints "Maintenance Mode Activated" instead of following the usual even/odd rule.

### Question 02
A vending machine dispenses snacks based on the amount inserted. You need to write an assembly program that checks the inserted amount and decides whether the user gets a snack or needs to insert more money.

- If the amount is 50 or more, display "Snack Dispensed".
- If the amount is less than 50, calculate the remaining amount needed and display "Insert X more", where X is the remaining balance.
```
Input
60
30

Output
Snack Dispensed
Insert 20 more
```

## SET - B

### Question 01
A smart elevator system decides its movement based on a **single-digit floor number (0-9)** entered by the user:

- If the input is **0**, print "Ground Floor - No Movement".
- If the input is **an even number**, print "Moving Up" (except 0).
- If the input is **an odd number**, print "Moving Down".
- If the input is **7**, print "Emergency Stop Activated" instead of following the usual even/odd rule.

### Question 01
A parking ticket machine charges **$100** for a full-day parking pass. The machine takes an amount from the user and decides whether they can park or need to add more money.

- If the inserted amount is **100 or more** print "Parking Ticket Issued".
- If the inserted amount is **less than 100**, calculate the **remaining balance needed** and print "Insert X more", where X is the remaining amount.
```
Input
120
75

Output
Parking Ticket lssued
Insert 25 more
```
