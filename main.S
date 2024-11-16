.data
N:
.word 4
M:
.word 3
matrix:
.word 5, 1, 3, 1
.word 2, 14, 2, 2
.word 88, 3, 5, 3
result:
.word 0

.text

main:
la a2, N
la a3, M
la a4, matrix
la a5, result
call process
la a3, result
call print
call exit

print:
addi a0, x0, 1 # print_int ecall
lw a1, 0(a3)
ecall
addi a0, x0, 11 # print_char ecall
addi a1, x0, 10
ecall
ret

exit:
addi a0, x0, 10
ecall

process:
lw t1, 0(a2) # N
lw t2, 0(a3) # M

addi t4, x0, 0 # row pointer
addi a6, x0, 0 # global element index
addi t5, x0, 0 # current max elem

init:
addi t3, x0, 0 # row element number

cycle:
lw t6, 0(a4) # load value from array
blt t6, t5, continue
addi t5, t6, 0
sw a6, 0(a5)
continue:
addi a4, a4, 4 # increment array pointer
addi a6, a6, 1
addi t3, t3, 1
blt t3, t1, cycle
addi t4, t4, 1
blt t4, t2, init
ret