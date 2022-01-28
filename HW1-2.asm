# 2076298 ¿ÃπŒ∞Ê --09/25/21
# HW1-2.asm --HW1-2 program.
# Registers used:

.text 
main:
la $a0, HW1_2_msg 	# load the address of HW1_2_msg into $a0
li $v0, 4 		# 4 is print_string code
syscall 		# syscall
# Exit the program
li $v0, 10 		# 10 is exit code
syscall 		# syscall

# Data for the program:
.data 
HW1_2_msg:
.ascii "Student ID 2076298: Minkyung LEE\n"
.ascii "I want to understand well about computer architecture and "
.ascii "get great score ("
.byte 0x41
.ascii "+)"
.asciiz "\n"	

# end HW1-2.asm