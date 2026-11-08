        .data
m:      .word 7             # input: nonnegative integer (change this to test)
result: .word 0             # output: 1 if m is odd, 0 if even

        .text
        .globl main
main:
        lw   $a0, m         # a0 = m (argument)
        jal  is_odd         # call the function; answer comes back in v0
        sw   $v0, result    # store the answer in memory
        li   $v0, 10        # exit program
        syscall

# is_odd(m): returns 1 (True) if m is odd, 0 (False) if even
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
        li   $v0, 0                 # return False
        jr   $ra

# division(x, y): division by repeated subtraction (Figure 3), returns the remainder x
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
