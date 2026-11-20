# ECE 366 Project 2 - Part (c): IsFibonacciOdd(n)

## Team
| Name | NetID | Contribution |
| --- | --- | --- |
| Imran Jabiyev | ijabi | Set up the GitHub repo and the project2 folder layout; wrote and tested Part (a) Fibonacci(n) and Part (b) IsOdd(m) with division by repeated subtraction, which Part (c) reuses |
| Joseph Kudia | jkudi2 | Wrote Part (c) IsFibonacciOdd(n), combining Fibonacci and IsOdd into the final program |
| Maciej Baginski | mbagi | Tested the programs in MARS with different inputs and checked the results; reviewed the code and helped write the progress reports and READMEs |
| Quan Nguyen | qnguy8 | Compiling the final and other progress reports |


GitHub: https://github.com/imjabiyev/ece366-project1/tree/main/project2/part_c_is_fibonacci_odd

## How to run
1. Open MARS and choose File > Open, then select is_fibonacci_odd.asm
2. Press F3 to assemble, then F5 to run
3. The answer is printed in the Run I/O panel at the bottom of MARS ("Is Fibonacci(n) odd? 1" means odd, 0 means even)
4. It is also stored in memory: in the Data Segment panel, the input n is the first word (address 0x10010000)
   and the result is the second word (address 0x10010004)
5. To test another input, change the value of n in .data, then re-assemble
