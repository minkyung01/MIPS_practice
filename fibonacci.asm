# fibonacci.asm -- Print 20 numbers of Fibonacci
# Registers used:
# $v0 - syscall parameter
# $a0 - syscall parameter
# $t0 - index of the array
# $t1, t2 - temp register to get the next finobacci
# s0 - store address of an array element
# s1 - hold the length of the array

#Data for the program
	.data
hello_msg:	.asciiz		"Simple fibonacci\n"
int_arr:	.word		0:20		# array of 20 integers
space:		.asciiz		" "
	
# User Program
	.text 
main:
	## Print hello message
	la $a0, hello_msg		# print 'hello_msg'
	li $v0, 4			# setup 'print_string' syscall
	syscall
	## initialize the array
	la $s0, int_arr			# $s0 is start address
	li $s1, 20			# length of the array
	li $t0, 0
	li $t1, 1
	sw $t1, 0($s0)			# init the first as 1
	addi $t0, $t0, 1		# increase index
	move $a0, $t1			# print the first
	li $v0, 1
	syscall
	la $a0, space
	li $v0, 4
	syscall
	addi $s0, $s0, 4		# increase the pointer
	sw $t1, 0($s0)			# init the second as 1
	addi $t0, $t0, 1		# increase index
	move $a0, $t1
	li $v0, 1
	syscall				# print the second
	la $a0, space
	li $v0, 4
	syscall
	b init
init:
	beq $t0, 20, exit
	addi $s0, $s0, 4
	lw $t1, -4($s0)			# calculate the next number
	lw $t2, -8($s0)
	add $t1, $t1, $t2
	sw $t1, 0($s0)
	move $a0, $t1			## print current number
	li $v0, 1
	syscall
	la $a0, space
	li $v0, 4
	syscall
	addi $t0, $t0, 1		# increase index
	b init
exit:
	## exit the program
	li $v0, 10
	syscall
## End of main
