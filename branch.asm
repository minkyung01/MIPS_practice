# branch.asm -- Compare two numbers
# Registers used:
# $v0 - syscall parameter
# $a0 - syscall parameter
# $t0, t1 - store user input integers

#Data for the program
	.data
hello_msg:	.asciiz		"Enter two numbers as follows.\n"
first_num:	.asciiz		"First number:"
second_num:	.asciiz		"Second number:"
less_msg:	.asciiz		"Less\n"
same_msg:	.asciiz		"Same\n"
great_msg:	.asciiz		"Greater\n"

# User Program
	.text 
main:
	## Print hello message
	la $a0, hello_msg		# print 'hello_msg'
	li $v0, 4		# setup 'print_string' syscall
	syscall
	## read the first user input
	la $a0, first_num
	li $v0, 4
	syscall
	
	li $v0, 5
	syscall
	
	move $t0, $v0
	## read the second user input
	la $a0, second_num
	li $v0, 4
	syscall
	
	li $v0, 5
	syscall
	
	move $t1, $v0
	## branch
	blt $t0, $t1, less
	bgt $t0, $t1, great
	beq $t0, $t1, same
less:
	la $a0, less_msg
	li $v0, 4
	syscall
	b exit
great:
	la $a0, great_msg
	li $v0, 4
	syscall
	b  exit
same:
	la $a0, same_msg
	li $v0, 4
	syscall
	b exit
exit:
	## exit the program
	li $v0, 10
	syscall
## End of main
	
	
