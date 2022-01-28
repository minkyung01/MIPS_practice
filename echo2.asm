# echo2.asm -- Echo user string input
# Registers used:
# $v0 - syscall parameter
# $a0 - syscall parameter - the string to input and output
# $a1 - syscall parameter - set user input string length

#Data for the program
	.data
req_msg:	.asciiz "It echo user string input\nEnter:"
user_input:
	.space 64	# The Largest input size is 64 bytes

# User Program
	.text 
main:
	## Print hello message
	la $a0, req_msg		# print 'req_msg'
	li $v0, 4		# setup 'print_string' syscall
	syscall
	## Read user input
	li $v0, 8		# setup 'read_string' syscall
	la $a0, user_input	# set 'user_input' as $a0 to read user input
	la $a1, 64		# set 64 as $a1 to set maximum input length
	syscall
	## Echo user input
	li $v0, 4
	syscall
	## exit the program
	li $v0, 10
	syscall
## End of main
	
	
