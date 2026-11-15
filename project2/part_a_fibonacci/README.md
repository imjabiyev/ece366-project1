# ECE 366 Project 2 - Part (a): Fibonacci(n)

Progress Report 1 deliverable. `fibonacci.asm` is a MIPS program that computes the nth
Fibonacci number (Figure 1 of the handout) for a nonnegative integer `n` stored in memory.

## Team
| Name | NetID | GitHub | Contribution |
| --- | --- | --- | --- |
| Imran Jabiyev | TODO | imjabiyev / imranello | Repository organization, `fibonacci.asm`, `is_odd.asm` implementation, READMEs |
| Joseph Kudia | TODO | josephkudia1024 | `is_fibonacci_odd.asm` (Part c), uploaded the handout |
| Maciej Baginski | TODO | maciekbaginski04 | Part (b) IsOdd(m) with repeated subtraction |
| Quan Nguyen | TODO | dongquan3005-cpu | Progress reports and documentation |

GitHub: https://github.com/imjabiyev/ece366-project1/tree/main/project2/part_a_fibonacci

## How to run (MARS)
1. Open MARS and choose File > Open, then select `fibonacci.asm`.
2. Press F3 (Assemble), then F5 (Go).
3. In the **Data Segment** panel, the input `n` is the first word (address `0x10010000`)
   and the result Fibonacci(n) is the second word (address `0x10010004`).
4. To test another input, change the value on the `n: .word 20` line in `.data`, then
   re-assemble and run again.

## How it works
`fibonacci` returns `n` directly when `n <= 1`. Otherwise it keeps `a = 0`, `b = 1` in
`$t1`, `$t2` and repeats `temp = b; b = a + b; a = temp` for `n - 1` iterations
(counter in `$t3`), then returns `b` in `$v0`.

## Test results
| n | Fibonacci(n) | | n | Fibonacci(n) |
| --- | --- | --- | --- | --- |
| 0 | 0 | | 8 | 21 |
| 1 | 1 | | 9 | 34 |
| 2 | 1 | | 10 | 55 |
| 3 | 2 | | 20 | 6765 |
| 4 | 3 | | 30 | 832040 |
| 5 | 5 | | 40 | 102334155 |
| 6 | 8 | | 46 | 1836311903 |
| 7 | 13 | | | |

Fibonacci(46) is the largest value that fits in a signed 32-bit register; `n >= 47` overflows.
