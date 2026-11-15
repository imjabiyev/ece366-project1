# ECE 366 Project 2 - Part (b): IsOdd(m)

Progress Report 2 deliverable. `is_odd.asm` is a MIPS program that decides whether a
nonnegative integer `m` is odd. The remainder of `m / 2` is computed with **division by
repeated subtraction** (Figure 3 of the handout); the MIPS `div` instruction is not used.

## Team
| Name | NetID | GitHub | Contribution |
| --- | --- | --- | --- |
| Imran Jabiyev | TODO | imjabiyev / imranello | Repository organization, `fibonacci.asm`, `is_odd.asm` implementation, READMEs |
| Joseph Kudia | TODO | josephkudia1024 | `is_fibonacci_odd.asm` (Part c), uploaded the handout |
| Maciej Baginski | TODO | maciekbaginski04 | Part (b) IsOdd(m) with repeated subtraction |
| Quan Nguyen | TODO | dongquan3005-cpu | Progress reports and documentation |

GitHub: https://github.com/imjabiyev/ece366-project1/tree/main/project2/part_b_is_odd

## How to run (MARS)
1. Open MARS and choose File > Open, then select `is_odd.asm`.
2. Press F3 (Assemble), then F5 (Go).
3. Look at the **Data Segment** panel (make sure the address box shows `0x10010000 (.data)`):
   - the first word, at `0x10010000`, is the input `m`;
   - the second word, at `0x10010004`, is the result: `1` if `m` is odd, `0` if `m` is even.
4. To test another value, edit the line `m: .word 7` in the `.data` section, then
   re-assemble (F3) and run (F5) again.

Register `$v0` also holds the result right before the exit syscall, and `$a0` holds the
remainder when `division` returns, so both can be checked in the Registers panel.

## How it works
```
main:      load m into $a0, call is_odd, store $v0 into result, exit
is_odd:    save $ra on the stack, set $a1 = 2, call division
           if the remainder in $v0 is 0 -> return 0 (even), else return 1 (odd)
division:  quotient ($t0) = 0
           while x >= y:  x = x - y ; quotient = quotient + 1
           return x (the remainder) in $v0
```
| Register | Use |
| --- | --- |
| `$a0` | argument `m`, then `x` inside `division` (what is left is the remainder) |
| `$a1` | divisor `y = 2` |
| `$t0` | quotient counter (kept for completeness, not needed for the parity test) |
| `$t1` | result of `slt` (1 when `x < y`, which ends the loop) |
| `$v0` | return value of `division` (remainder) and of `is_odd` (0 or 1) |
| `$ra` / stack | `is_odd` saves `$ra` because it calls `division` with `jal` |

## Test results
The result word at `0x10010004` after running with each input:

| m | result | | m | result |
| --- | --- | --- | --- | --- |
| 0 | 0 | | 13 | 1 |
| 1 | 1 | | 99 | 1 |
| 2 | 0 | | 100 | 0 |
| 3 | 1 | | 1000 | 0 |
| 4 | 0 | | 1001 | 1 |
| 5 | 1 | | 65535 | 1 |
| 6 | 0 | | 65536 | 0 |
| 7 | 1 | | 1000000 | 0 |
| 12 | 0 | | 1000001 | 1 |

Note: the loop runs `m / 2` times, so the running time grows linearly with `m`
(about 5 instructions per iteration). Very large inputs take a noticeable time in MARS.
