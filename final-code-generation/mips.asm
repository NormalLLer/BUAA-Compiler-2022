.data 0x10010000
temp:  .space  160000


# hehe[2][7]
global_const_arr1:  .word  1, 2, 5, 10, 20, 50, 100, 1, 5, 10, 20, 50, 100, 200

# string tokens:
str_1:  .asciiz   "19373487\n"
str_2:  .asciiz   "out of range!!\n"
str_3:  .asciiz   "the result is:"
str_5:  .asciiz   "\n"


.text 0x00400000

# main function
# local array defition:
li $t1, 268500992
li $t0, 1
sw $t0, 0($t1)
li $t0, 2
sw $t0, 4($t1)
li $t0, 5
sw $t0, 8($t1)
li $t0, 10
sw $t0, 12($t1)
li $t0, 20
sw $t0, 16($t1)
li $t0, 50
sw $t0, 20($t1)
li $t0, 100
sw $t0, 24($t1)
li $t0, 1
sw $t0, 28($t1)
li $t0, 5
sw $t0, 32($t1)
li $t0, 10
sw $t0, 36($t1)
li $t0, 20
sw $t0, 40($t1)
li $t0, 50
sw $t0, 44($t1)
li $t0, 100
sw $t0, 48($t1)
li $t0, 200
sw $t0, 52($t1)
# local var defition:
li $t0, 0
sw $t0, 268501048($zero)
# local var defition:
li $t0, 9
sw $t0, 268501052($zero)
# local var defition:
li $t0, 501
sw $t0, 268501056($zero)
la $a0, str_1
li $v0, 4
syscall
Label_25:
lw $t0, 268501048($zero)
lw $t1, 268501052($zero)
slt $t2, $t0, $t1
sw $t2, 268501060($zero)
lw $t0, 268501060($zero)
beqz $t0, Label_26
# local var defition:

li $v0, 5
syscall
sw $v0, 268501064($zero)
lw $t0, 268501064($zero)
lw $t1, 268501056($zero)
sge $t2, $t0, $t1
sw $t2, 268501068($zero)
lw $t0, 268501068($zero)
bnez $t0, Label_27
lw $t0, 268501064($zero)
li $t1, 0
slt $t2, $t0, $t1
sw $t2, 268501072($zero)
lw $t0, 268501072($zero)
sw $t0, 268501076($zero)
j Label_28
Label_27:
lw $t0, 268501068($zero)
sw $t0, 268501076($zero)
Label_28:
lw $t0, 268501076($zero)
beqz $t0, Label_29
la $a0, str_2
li $v0, 4
syscall
j Label_30
Label_29:


# Pushing Function Real Params:
addiu $sp, $sp, -30000
sw $ra, 0($sp)
li $t9, 0
mul $t9, $t9, 7
sll $t9, $t9, 2
addiu $t0, $t9, 268500992
sw $t0, 4($sp)
lw $t0, 268501064($zero)
sw $t0, 8($sp)
li $t0, 7
sw $t0, 12($sp)
# Finished Pushing Params!
# Call function!
jal Label_18
lw $ra, 0($sp)
# Pop params
addiu $sp, $sp, 30000

sw $v0, 268501080($zero)
la $a0, str_3
li $v0, 4
syscall
lw $a0, 268501080($zero)
li $v0, 1
syscall
la $a0, str_5
li $v0, 4
syscall
Label_30:
lw $t0, 268501048($zero)
li $t1, 1
addu $t2, $t0, $t1
sw $t2, 268501084($zero)
lw $t0, 268501084($zero)
sw $t0, 268501048($zero)
j Label_25
Label_26:

li $v0, 10
syscall




# self defined functions

# ---------------- FUCNTION: min ------------------
Label_1:

lw $t0, 4($sp)
lw $t1, 8($sp)
sgt $t2, $t0, $t1
sw $t2, 12($sp)
lw $t0, 12($sp)
beqz $t0, Label_2
lw $v0, 8($sp)
jr $ra
Label_2:
lw $v0, 4($sp)
jr $ra
jr $ra



# ---------------- FUCNTION: inner1 ------------------
Label_3:

# local var defition:
li $t0, 1
sw $t0, 20($sp)
# local var defition:
li $t0, 1
sw $t0, 24($sp)
Label_4:
lw $t0, 20($sp)
lw $t1, 12($sp)
slt $t2, $t0, $t1
sw $t2, 28($sp)
lw $t0, 28($sp)
beqz $t0, Label_5
li $t0, -1
sw $t0, 32($sp)
lw $t0, 32($sp)
subu $t0, $zero, $t0
sw $t0, 36($sp)
lw $t0, 36($sp)
sw $t0, 24($sp)
Label_6:
lw $t0, 24($sp)
lw $t1, 8($sp)
sle $t2, $t0, $t1
sw $t2, 40($sp)
lw $t0, 40($sp)
beqz $t0, Label_7
lw $t0, 24($sp)
lw $t7, 20($sp)
sll $t7, $t7, 2
lw $t1, 16($sp)
addu $t1, $t1, $t7
lw $t1, 0($t1)
slt $t2, $t0, $t1
sw $t2, 44($sp)
lw $t0, 44($sp)
beqz $t0, Label_8
lw $t0, 20($sp)
li $t1, 1
subu $t2, $t0, $t1
sw $t2, 48($sp)
lw $t8, 48($sp)
lw $t9, 24($sp)
mul $t8, $t8, 501
addu $t9, $t8, $t9
sll $t9, $t9, 2
lw $t0, 4($sp)
addu $t0, $t0, $t9
lw $t0, 0($t0)
lw $t8, 20($sp)
lw $t9, 24($sp)
mul $t8, $t8, 501
addu $t9, $t8, $t9
sll $t9, $t9, 2
lw $t8, 4($sp)
addu $t9, $t9, $t8
sw $t0, 0($t9)
j Label_9
Label_8:
lw $t0, 24($sp)
lw $t7, 20($sp)
sll $t7, $t7, 2
lw $t1, 16($sp)
addu $t1, $t1, $t7
lw $t1, 0($t1)
seq $t2, $t0, $t1
sw $t2, 52($sp)
lw $t0, 52($sp)
beqz $t0, Label_10
li $t0, 1
lw $t8, 20($sp)
lw $t9, 24($sp)
mul $t8, $t8, 501
addu $t9, $t8, $t9
sll $t9, $t9, 2
lw $t8, 4($sp)
addu $t9, $t9, $t8
sw $t0, 0($t9)
j Label_11
Label_10:
lw $t0, 20($sp)
li $t1, 1
subu $t2, $t0, $t1
sw $t2, 56($sp)
lw $t8, 56($sp)
lw $t9, 24($sp)
mul $t8, $t8, 501
addu $t9, $t8, $t9
sll $t9, $t9, 2
lw $t0, 4($sp)
addu $t0, $t0, $t9
lw $t0, 0($t0)
li $t1, 0
sne $t2, $t0, $t1
sw $t2, 60($sp)
lw $t0, 60($sp)
beqz $t0, Label_12
lw $t0, 24($sp)
lw $t7, 20($sp)
sll $t7, $t7, 2
lw $t1, 16($sp)
addu $t1, $t1, $t7
lw $t1, 0($t1)
subu $t2, $t0, $t1
sw $t2, 64($sp)
lw $t8, 20($sp)
lw $t9, 64($sp)
mul $t8, $t8, 501
addu $t9, $t8, $t9
sll $t9, $t9, 2
lw $t0, 4($sp)
addu $t0, $t0, $t9
lw $t0, 0($t0)
li $t1, 0
sne $t2, $t0, $t1
sw $t2, 68($sp)
lw $t0, 68($sp)
sw $t0, 72($sp)
j Label_13
Label_12:
lw $t0, 60($sp)
sw $t0, 72($sp)
Label_13:
lw $t0, 72($sp)
beqz $t0, Label_14
lw $t0, 20($sp)
li $t1, 1
subu $t2, $t0, $t1
sw $t2, 76($sp)
lw $t0, 24($sp)
lw $t7, 20($sp)
sll $t7, $t7, 2
lw $t1, 16($sp)
addu $t1, $t1, $t7
lw $t1, 0($t1)
subu $t2, $t0, $t1
sw $t2, 80($sp)
lw $t8, 20($sp)
lw $t9, 80($sp)
mul $t8, $t8, 501
addu $t9, $t8, $t9
sll $t9, $t9, 2
lw $t0, 4($sp)
addu $t0, $t0, $t9
lw $t0, 0($t0)
li $t1, 1
addu $t2, $t0, $t1
sw $t2, 84($sp)


# Pushing Function Real Params:
addiu $sp, $sp, -30000
sw $ra, 0($sp)
lw $t8, 30076($sp)
lw $t9, 30024($sp)
mul $t8, $t8, 501
addu $t9, $t8, $t9
sll $t9, $t9, 2
lw $t0, 30004($sp)
addu $t0, $t0, $t9
lw $t0, 0($t0)
sw $t0, 4($sp)
lw $t0, 30084($sp)
sw $t0, 8($sp)
# Finished Pushing Params!
# Call function!
jal Label_1
lw $ra, 0($sp)
# Pop params
addiu $sp, $sp, 30000

sw $v0, 88($sp)
lw $t0, 88($sp)
lw $t8, 20($sp)
lw $t9, 24($sp)
mul $t8, $t8, 501
addu $t9, $t8, $t9
sll $t9, $t9, 2
lw $t8, 4($sp)
addu $t9, $t9, $t8
sw $t0, 0($t9)
j Label_15
Label_14:
lw $t0, 20($sp)
li $t1, 1
subu $t2, $t0, $t1
sw $t2, 92($sp)
lw $t8, 92($sp)
lw $t9, 24($sp)
mul $t8, $t8, 501
addu $t9, $t8, $t9
sll $t9, $t9, 2
lw $t0, 4($sp)
addu $t0, $t0, $t9
lw $t0, 0($t0)
li $t1, 0
sne $t2, $t0, $t1
sw $t2, 96($sp)
lw $t0, 96($sp)
beqz $t0, Label_16
lw $t0, 20($sp)
li $t1, 1
subu $t2, $t0, $t1
sw $t2, 100($sp)
lw $t8, 100($sp)
lw $t9, 24($sp)
mul $t8, $t8, 501
addu $t9, $t8, $t9
sll $t9, $t9, 2
lw $t0, 4($sp)
addu $t0, $t0, $t9
lw $t0, 0($t0)
lw $t8, 20($sp)
lw $t9, 24($sp)
mul $t8, $t8, 501
addu $t9, $t8, $t9
sll $t9, $t9, 2
lw $t8, 4($sp)
addu $t9, $t9, $t8
sw $t0, 0($t9)
j Label_17
Label_16:
lw $t0, 24($sp)
lw $t7, 20($sp)
sll $t7, $t7, 2
lw $t1, 16($sp)
addu $t1, $t1, $t7
lw $t1, 0($t1)
subu $t2, $t0, $t1
sw $t2, 104($sp)
lw $t8, 20($sp)
lw $t9, 104($sp)
mul $t8, $t8, 501
addu $t9, $t8, $t9
sll $t9, $t9, 2
lw $t0, 4($sp)
addu $t0, $t0, $t9
lw $t0, 0($t0)
lw $t8, 20($sp)
lw $t9, 24($sp)
mul $t8, $t8, 501
addu $t9, $t8, $t9
sll $t9, $t9, 2
lw $t8, 4($sp)
addu $t9, $t9, $t8
sw $t0, 0($t9)
Label_17:
Label_15:
Label_11:
Label_9:
lw $t0, 24($sp)
li $t1, 1
addu $t2, $t0, $t1
sw $t2, 108($sp)
lw $t0, 108($sp)
sw $t0, 24($sp)
j Label_6
Label_7:
lw $t0, 20($sp)
li $t1, 1
addu $t2, $t0, $t1
sw $t2, 112($sp)
lw $t0, 112($sp)
sw $t0, 20($sp)
j Label_4
Label_5:
lw $t0, 12($sp)
li $t1, 1
subu $t2, $t0, $t1
sw $t2, 116($sp)
lw $t8, 116($sp)
lw $t9, 8($sp)
mul $t8, $t8, 501
addu $t9, $t8, $t9
sll $t9, $t9, 2
lw $v0, 4($sp)
addu $v0, $v0, $t9
lw $v0, 0($v0)
jr $ra
jr $ra



# ---------------- FUCNTION: smallmoney ------------------
Label_18:

# local array defition:
# local var defition:
li $t0, 1
sw $t0, 22060($sp)
# local var defition:
li $t0, 1
sw $t0, 22064($sp)
li $t0, 0
li $t8, 0
li $t9, 0
mul $t8, $t8, 501
addu $t9, $t8, $t9
sll $t9, $t9, 2
addiu $t9, $t9, 16
addu $t9, $t9, $sp
sw $t0, 0($t9)
Label_19:
lw $t0, 22060($sp)
lw $t1, 8($sp)
sle $t2, $t0, $t1
sw $t2, 22068($sp)
lw $t0, 22068($sp)
beqz $t0, Label_20
lw $t0, 22060($sp)
li $t7, 0
sll $t7, $t7, 2
lw $t1, 4($sp)
addu $t1, $t1, $t7
lw $t1, 0($t1)
div $t0, $t1
mfhi $t2
sw $t2, 22072($sp)
lw $t0, 22072($sp)
li $t1, 0
seq $t2, $t0, $t1
sw $t2, 22076($sp)
lw $t0, 22076($sp)
beqz $t0, Label_21
lw $t0, 22060($sp)
li $t7, 0
sll $t7, $t7, 2
lw $t1, 4($sp)
addu $t1, $t1, $t7
lw $t1, 0($t1)
div $t0, $t1
mflo $t2
sw $t2, 22080($sp)
lw $t0, 22080($sp)
li $t8, 0
lw $t9, 22060($sp)
mul $t8, $t8, 501
addu $t9, $t8, $t9
sll $t9, $t9, 2
addiu $t9, $t9, 16
addu $t9, $t9, $sp
sw $t0, 0($t9)
j Label_22
Label_21:
li $t0, 0
li $t8, 0
lw $t9, 22060($sp)
mul $t8, $t8, 501
addu $t9, $t8, $t9
sll $t9, $t9, 2
addiu $t9, $t9, 16
addu $t9, $t9, $sp
sw $t0, 0($t9)
Label_22:
lw $t0, 22060($sp)
li $t1, 1
addu $t2, $t0, $t1
sw $t2, 22084($sp)
lw $t0, 22084($sp)
sw $t0, 22060($sp)
j Label_19
Label_20:
li $t0, 1
sw $t0, 22060($sp)
Label_23:
lw $t0, 22060($sp)
lw $t1, 12($sp)
slt $t2, $t0, $t1
sw $t2, 22088($sp)
lw $t0, 22088($sp)
beqz $t0, Label_24
li $t0, 0
lw $t8, 22060($sp)
li $t9, 0
mul $t8, $t8, 501
addu $t9, $t8, $t9
sll $t9, $t9, 2
addiu $t9, $t9, 16
addu $t9, $t9, $sp
sw $t0, 0($t9)
lw $t0, 22060($sp)
li $t1, 1
addu $t2, $t0, $t1
sw $t2, 22092($sp)
lw $t0, 22092($sp)
sw $t0, 22060($sp)
j Label_23
Label_24:


# Pushing Function Real Params:
addiu $sp, $sp, -30000
sw $ra, 0($sp)
addiu $t0, $sp, 30016
sw $t0, 4($sp)
lw $t0, 30008($sp)
sw $t0, 8($sp)
lw $t0, 30012($sp)
sw $t0, 12($sp)
lw $t0, 30004($sp)
sw $t0, 16($sp)
# Finished Pushing Params!
# Call function!
jal Label_3
lw $ra, 0($sp)
# Pop params
addiu $sp, $sp, 30000

sw $v0, 22096($sp)
lw $v0, 22096($sp)
jr $ra
jr $ra



