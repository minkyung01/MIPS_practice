#2076298 ÀÌ¹Î°æ --10/16-21

.data
intro_msg: .asciiz "[HW #2 Part II] Student ID 2076298: MinKyung Lee\n\n"
enter_msg: .asciiz "Enter a positive integer: "
iter_msg: .asciiz "\n(Iterative) Sum from 1 to "
recur_msg: .asciiz "(Recursive) Sum from 1 to "
equal_msg: .asciiz " = "
done_msg: .asciiz "\nDone..."
new_line: .asciiz "\n"

.text
main:
li $t1, 1 #int i = 1
li $t3, 0 #int sum = 0

#print introduction message
la $a0, intro_msg
li $v0, 4 #print_string
syscall
#print enter message
la $a0, enter_msg
li $v0, 4 #print_string
syscall

#read user input
li $v0, 5 #read_int
syscall
move $t2, $v0 #save user input at $t2/int n = user input

#iterative loop
iter_loop:  
add $t3, $t3, $t1 #sum = sum + i
addi $t1, $t1, 1 # i = i + 1

bgt $t1, $t2, iter_end #if(i + 1 > n) branch to iter_end
ble $t1, $t2, iter_loop #if(i + 1 <= n) branch to iter_loop

iter_end:
#print iter message
la $a0, iter_msg
li $v0, 4 #print_string
syscall
#print use input n
li $v0, 1 #print_int
move $a0, $t2 #move n to $a0
syscall
#print =
la $a0, equal_msg
li $v0, 4 #print_string
syscall
#print result
li $v0, 1 #print_int
move $a0, $t3 #move iter_loop result to $a0
syscall
#new line
la $a0, new_line
li $v0, 4 #print_string
syscall

b recur_loop #branch to recur_loop

recur_loop:
li $t3, 0 #int sum = 0 (reset)
move $t4, $t2 #move n to #t4 (to save user input in $t4)

beq $t2, 0, return1 #if(n == 0) branch to return1
jal return_n #else jump to return_n

return1:
li $v0, 1 #print_int
move $a0, $t2 #move n to $a0
syscall

return_n:
add $t3, $t3, $t2 #sum = sum + n
addi $t2, $t2, -1 #n = n - 1
bne $t2, 0, return_n #if(n == 0) branch to return_n

b recur_end #branch to recur_end

recur_end:
#print recur message
la $a0, recur_msg
li $v0, 4 #print_string
syscall
#print n
li $v0, 1 #print_int
move $a0, $t4 #move n to $a0
syscall
#print =
la $a0, equal_msg
li $v0, 4 #print_string
syscall
#print result
li $v0, 1 #print_int
move $a0, $t3 #move recur_loop result to $a0
syscall
#new line
la $a0, new_line
li $v0, 4 #print_string
syscall

b end #branch to end

end:
#print done
la $a0, done_msg
li $v0, 4 #print_string
syscall
#end
li $v0, 10
syscall
