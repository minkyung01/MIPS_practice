main: 
	li $v0, 5	# load syscall read_int into $v0
	syscall		# make the syscall
	move $t0, $v0	# move first number read into $t0
	
	li $v0, 5	# load syscall read_int into $v0
	syscall		# make the syscall
	move $t1, $v0	# move second number read into $t1
	
	li $v0, 5	# load syscall read_int into $v0
	syscall		# make the syscall
	move $t2, $v0	# move third number read into $t2
	
	add $t3, $t0, $t1	# $t3 = $t0 + $t1
	add $t3, $t3, $t2	# $t3 = $t3 + $t2
	# now, the sum of the first, second and third number is in $t3
	
	move $a0, $t3	# move the number in $t3 into $a0
	li $v0, 1	# load syscall print_int into $v0
	syscall		# make the syscall
	
	li $v0, 10	# load syscall exit into $v0
	syscall		# make the syscall