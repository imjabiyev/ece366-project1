# ECE 366 Project 2 - Part (c): IsFibonacciOdd(n)
        .data
n:      .word 10            # input: nonnegative integer
result: .word 0             # output: 1 if Fibonacci(n) is odd, 0 if even

        .text
        .globl main
main:
        # TODO: load n, call fibonacci, pass its result to is_odd, store in result
        li   $v0, 10        # exit
        syscall

fibonacci:
        # TODO: paste from part (a)
        jr   $ra

is_odd:
        # TODO: paste from part (b)
        jr   $ra

division:
        # TODO: paste from part (b)
        jr   $ra
