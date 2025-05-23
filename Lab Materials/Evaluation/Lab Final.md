# CSE341 : LAB Final

## Question 01

You are a systems engineer working for an intelligence agency, One of the agency's data vaults has gone into lockdown due to an anomaly. To unlock the vault, the onboard microcontroller requires a security checksum, which is calculated based on a range of even numbers. According to the security protocol: "The vault will unlock only when the checksum equals the sum of all even integers between a provided range (inclusive)." You are provided with two integers: AX→The starting number of the range. BX The ending number of the range. You need to write an assembly program that:
numbers to calculate the checksum,

a. Loops through the numbers between AX and BX (inclusive),

b. Adds only the even c. Stores the final sum in register DX. Once the checksum is computed, it is sent to the vault controller.
