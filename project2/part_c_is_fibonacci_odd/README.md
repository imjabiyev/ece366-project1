# ECE 366 Project 2 - Part (c): IsFibonacciOdd(n)

Final Report deliverable. `is_fibonacci_odd.asm` combines Part (a) and Part (b): it
computes Fibonacci(n) and then checks whether that number is odd using division by
repeated subtraction. The result is `1` (odd) or `0` (even).

## Team
| Name | NetID | GitHub | Contribution |
| --- | --- | --- | --- |
| Imran Jabiyev | TODO | imjabiyev / imranello | Repository organization, `fibonacci.asm`, `is_odd.asm` implementation, READMEs |
| Joseph Kudia | TODO | josephkudia1024 | `is_fibonacci_odd.asm` (Part c), uploaded the handout |
| Maciej Baginski | TODO | maciekbaginski04 | Part (b) IsOdd(m) with repeated subtraction |
| Quan Nguyen | TODO | dongquan3005-cpu | Progress reports and documentation |

GitHub: https://github.com/imjabiyev/ece366-project1/tree/main/project2/part_c_is_fibonacci_odd

## How to run (MARS)
1. Open MARS and choose File > Open, then select `is_fibonacci_odd.asm`.
2. Press F3 (Assemble), then F5 (Go).
3. In the **Data Segment** panel, the input `n` is the first word (address `0x10010000`)
   and the result is the second word (address `0x10010004`): `1` if Fibonacci(n) is odd,
   `0` if it is even.
4. To test another input, change the value on the `n: .word 10` line in `.data`, then
   re-assemble and run again.

## How it works
`main` loads `n`, calls `fibonacci` (Part a), moves the returned value into `$a0`, calls
`is_odd` (Part b), and stores the 0/1 answer in `result`.

## Test results
Fibonacci(n) is even exactly when `n` is a multiple of 3, which is what the program reports.

| n | Fib(n) | result | | n | Fib(n) | result |
| --- | --- | --- | --- | --- | --- | --- |
| 0 | 0 | 0 | | 7 | 13 | 1 |
| 1 | 1 | 1 | | 8 | 21 | 1 |
| 2 | 1 | 1 | | 9 | 34 | 0 |
| 3 | 2 | 0 | | 10 | 55 | 1 |
| 4 | 3 | 1 | | 12 | 144 | 0 |
| 5 | 5 | 1 | | 20 | 6765 | 1 |
| 6 | 8 | 0 | | 30 | 832040 | 0 |

Note: the repeated-subtraction loop runs Fibonacci(n)/2 times, so large `n` (roughly 30
and above) takes a while to finish in MARS. `n = 30` executes about 2 million instructions.
