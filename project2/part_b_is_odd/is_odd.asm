# ECE 366 Project 2 - Part (b): IsOdd(m), no DIV instruction allowed
        .data
m:      .word 7             # input: nonnegative integer
result: .word 0             # output: 1 if odd, 0 if even

        .text
        .globl main
main:
        # TODO: load m, call is_odd, store 0 or 1 in result
        li   $v0, 10        # exit
        syscall

is_odd:
        # TODO: remainder = division(m, 2), return 1 if remainder != 0
        jr   $ra

division:
        # TODO: repeated subtraction, Figure 3 (return the remainder x)
        jr   $ra
