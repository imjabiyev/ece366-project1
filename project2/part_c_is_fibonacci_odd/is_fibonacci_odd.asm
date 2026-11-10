# ECE 366 Project 2 - Part (c): IsFibonacciOdd(n)
        .data
n:      .word 10            # input: nonnegative integer
result: .word 0             # output: 1 if Fibonacci(n) is odd, 0 if even

        .text
        .globl main
main:
        lw   $a0, n
        jal  fibonacci
        move $a0, $v0
        jal  is_odd
        sw   $v0, result
        li   $v0, 10        # exit
        syscall

fibonacci:
        slti $t0, $a0, 2            # t0 = 1 if n < 2
        bne  $t0, $zero, fib_base   # if n <= 1, return n
        li   $t1, 0                 # a = 0
        li   $t2, 1                 # b = 1
        addi $t3, $a0, -1           # counter = n - 1

loop:
        beq  $t3, $zero, done
        move $t4, $t2
        add  $t2, $t1, $t2
        move $t1, $t4
        addi $t3, $t3, -1
        j    loop

done:
        move $v0, $t2
        jr   $ra

fib_base:
        move $v0, $a0
        jr   $ra

is_odd:
        addi $sp, $sp, -4           # make room on the stack
        sw   $ra, 0($sp)            # save our return address (we are about to call division)
        li   $a1, 2                 # y = 2
        jal  division               # remainder comes back in v0
        lw   $ra, 0($sp)            # restore our return address
        addi $sp, $sp, 4            # free the stack space
        beq  $v0, $zero, odd_false  # remainder == 0 -> even
        li   $v0, 1                 # remainder != 0 -> return True
        jr   $ra

odd_false:
        li   $v0, 0
        jr   $ra

division:
        li   $t0, 0                 # quotient = 0
div_loop:
        slt  $t1, $a0, $a1          # t1 = 1 if x < y
        bne  $t1, $zero, div_done   # stop when x < y (loop runs while x >= y)
        sub  $a0, $a0, $a1          # x = x - y
        addi $t0, $t0, 1            # quotient = quotient + 1
        j    div_loop
div_done:
        move $v0, $a0               # return x (what is left is the remainder)
        jr   $ra
