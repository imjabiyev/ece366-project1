# Project 2: MIPS Fibonacci Odd-Number Detection

ECE 366 Computer Organization, Fall 2026 (Instructor: Debjit Pal). MIPS assembly for the
MARS simulator.

## Team
| Name | NetID | GitHub |
| --- | --- | --- |
| Imran Jabiyev | TODO | imjabiyev / imranello |
| Joseph Kudia | TODO | josephkudia1024 |
| Maciej Baginski | TODO | maciekbaginski04 |
| Quan Nguyen | TODO | dongquan3005-cpu |

GitHub: https://github.com/imjabiyev/ece366-project1/tree/main/project2

## Checkpoints
| Checkpoint | Folder | Deadline (Chicago) | Status |
| --- | --- | --- | --- |
| Progress Report 1 | `part_a_fibonacci/` | 11/11/2026 11:59 PM | Submitted |
| Progress Report 2 | `part_b_is_odd/` | 11/14/2026 11:59 PM | Complete, tested |
| Final Report | `part_c_is_fibonacci_odd/` | 11/19/2026 11:59 PM | Code drafted, testing |

Each folder holds its `.asm` file and its own README with run instructions and test
results. The written progress reports are in `reports/`.

## Running any of the programs
Open the `.asm` file in MARS, press F3 to assemble and F5 to run. The input is the first
word of the data segment (`0x10010000`) and the result is the second word (`0x10010004`).
Change the input value in the `.data` section and re-assemble to test another input.

## Making the submission tarball
From the part's folder, for example Part (b):
```bash
tar -czvf project2_part_b.tar.gz is_odd.asm README.md
```
