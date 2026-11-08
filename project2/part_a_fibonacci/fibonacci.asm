# ECE 366 Project 2 - Part (a): Fibonacci(n)
        .data
n:      .word 10            # input: nonnegative integer
result: .word 0             # output: nth Fibonacci number

        .text
        .globl main
main:
        # TODO: load n, call fibonacci, store the answer in result
        li   $v0, 10        # exit
        syscall

fibonacci:
        # TODO: follow Figure 1 (a = 0, b = 1, loop n-1 times)
        jr   $ra
