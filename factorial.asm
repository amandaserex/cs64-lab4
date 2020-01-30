# Factorial.asm program
# CS 64, Z.Matni, zmatni@ucsb.edu
#

# Assembly (NON-RECURSIVE) version of:
#   int n, fn=1;
#   cout << "Enter the number:\n";
#   cin >> n;
#   for (int x = 2; x <= n; x++) {
#       fn = fn * x;
#   }
#   cout << "Factorial of " << x << " is:\n" << fn << "\n";
#
.data
 	enter: .asciiz "Enter a number:\n"
	factorial: .asciiz "Factorial of "
	is: .asciiz " is:\n"
	newLine: .asciiz "\n"

#Text Area (i.e. instructions)
.text
main:
	#calls for the number
	li $v0, 4
	la $a0, enter
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0

	#calculates factorial
	li $t4, 1 #just to increase count
	li $t5, 1 #fn
	li $t6, 2 #x
	add $t1, $t0, $t4
		#n is $t0
loop:
	slt $t7, $t6, $t1 #checks if x<=n
	beq $t7, $zero, end # if its greater than it exits
	mult $t6, $t5
	mflo $t5
	add $t6, $t6, $t4
	j loop
	

	#prints out factorial
end:
	li $v0, 4
	la $a0, factorial
	syscall

	li $v0, 1
	move $a0, $t0
	syscall

	li $v0, 4
	la $a0, is
	syscall

	li $v0, 1
	move $a0, $t5
	syscall

	li $v0, 4
	la $a0, newLine
	syscall

exit:
	li $v0, 10
	syscall
