# echo1.asm -- Echo int user input
# Registers used:
# $v0 - syscall parameter
# $a0 - syscall parameter

#Data for the program
	.data
req_msg:	.asciiz "It echo user int input\nEnter:"

# User Program
	.text 
main:
	## Print hello message
	la $a0, req_msg		# print 'req_msg'
	li $v0, 4		# setup 'print_string' syscall
	syscall
	## Read user input
	li $v0, 5		# setup 'read_int' syscall
	syscall
	## copy
	move $a0, $v0		# copy user input to $a0 argument of 'print_int' syscall
	## Echo user input
	li $v0, 1
	syscall
	## exit the program
	li $v0, 10
	syscall
## End of main
