# MedianNumbers.asm program
# CS 64, Z.Matni, zmatni@ucsb.edu
#

.data

	# TODO: Complete these declarations / initializations

	enter: .asciiz "Enter the next number:\n" 

	median: .asciiz "Median: " 

	newLine: .asciiz "\n"


#Text Area (i.e. instructions)
.text

main:

	li $v0, 4
	la $a0, enter
	syscall

	li $v0, 5
	syscall

	move $t0, $v0

	li $v0, 4
	la $a0, enter
	syscall

	li $v0, 5
	syscall

	move $t1, $v0

	li $v0, 4
	la $a0, enter
	syscall

	li $v0, 5
	syscall

	move $t2, $v0
	
	bgt $t0, $t1, next1
	blt $t1, $t2, tOne
	bgt $t0, $t2, end
	ble $t0, $t0, tTwo
	

next1: 
	blt $t0, $t2, end
	blt $t1, $t2, tTwo
	ble $t1, $t1, tOne
tOne:
	move $t0, $t1
	ble $t0, $t0, end

tTwo:
	move $t0, $t2
	ble $t0, $t0, end



end:
	li $v0, 4
	la $a0, median
	syscall

	li $v0, 1
	move $a0, $t0
	syscall

	li $v0, 4
	la $a0, newLine
	syscall





exit:
	li $v0, 10
	syscall

