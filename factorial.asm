# factorial.asm -- Print factorial of input
# Registers used:
# $v0 - syscall parameter. Returned value
# $a0 - syscall parameter
# $t0 - set if less than 0
# $sp - store parameter in stack
# $ra - return address

#Data for the program
	.data
hello_msg:	.asciiz		"Recursive Factorial\nEnter an integer:"
space:		.asciiz		" "
	
# User Program
	.text 
main:
	## Print hello message
	la $a0, hello_msg		# print 'hello_msg'
	li $v0, 4			# setup 'print_string' syscall
	syscall
	li $v0, 5
	syscall
	move $a0, $v0			# copy to be parameter
	jal fact
	nop
	move $a0, $v0
	li $v0, 1
	syscall
	b exit
fact:
	addi $sp, $sp, -8		# adjust stack for 2 items
	sw $ra, 4($sp)			# save return address
	sw $a0, 0($sp)			# save argument
	slti $t0, $a0, 1		# test for n < 1
	beq $t0, $zero, L1		# n > 1. Call recursive factorial agin
	addi $v0, $zero, 1		# if so, result is 1
	addi $sp, $sp, 8		# pop 2 items from stack and return
	jr $ra
L1:
	addi $a0, $a0, -1		# else decrement n
	jal fact			# recursive call
	nop				## return point
	lw $a0, 0($sp)			# retore original n
	lw $ra, 4($sp)			# and return address
	addi $sp, $sp, 8		# pop 2 items from stack
	mul $v0, $a0, $v0
	jr $ra
exit:
	## exit the program
	li $v0, 10
	syscall
## End of main
