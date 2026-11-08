# ECE 366 Project 2 - Part (a): Fibonacci(n)
        .data
n:      .word 20            # input: nonnegative integer (change this to test)
result: .word 0             # output: nth Fibonacci number

        .text
        .globl main
main:
        lw   $a0, n         # a0 = n (argument)
        jal  fibonacci      # call the function; answer comes back in v0
        sw   $v0, result    # store the answer in memory
        li   $v0, 10        # exit program
        syscall

fibonacci:
        slti $t0, $a0, 2            # t0 = 1 if n < 2
        bne  $t0, $zero, fib_base   # if n <= 1, return n
        li   $t1, 0                 # a = 0
        li   $t2, 1                 # b = 1
        addi $t3, $a0, -1           # counter = n - 1
loop:
        beq  $t3, $zero, done       # loop ends when counter reaches 0
        move $t4, $t2               # temp = b
        add  $t2, $t1, $t2          # b = a + b
        move $t1, $t4               # a = temp
        addi $t3, $t3, -1           # counter = counter - 1
        j    loop
done:
        move $v0, $t2               # return b
        jr   $ra 
fib_base:
        move $v0, $a0               # return n
        jr   $ra
