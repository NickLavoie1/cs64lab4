# xSpim MedianNumbers.asm program
# 
#

#  Data Area - allocate and initialize variables
.data

	# TODO: Complete these declarations / initializations

	prompt: .asciiz "Enter the next number:\n"

	result: .asciiz "Median: "


#Text Area (i.e. instructions)
.text

main:

	#Prints prompt and takes user input three times. Stores all three inputs in first three registers.
	li $v0, 4
	la $a0, prompt
	syscall

	li $v0, 5
	syscall 
	move $t0, $v0

	li $v0, 4
	la $a0, prompt
	syscall

	li $v0, 5
	syscall 
	move $t1, $v0

	li $v0, 4
	la $a0, prompt
	syscall

	li $v0, 5
	syscall 
	move $t2, $v0

	li $v0, 4
	la $a0, result
	syscall

	#First compare first input with second, start branching from there
	slt $t3, $t0, $t1
	bne $t3, $zero, compare_lf_one

	slt $t3, $t1, $t2
	bne $t3, $zero, compare_lf_two

	j print_second

compare_lf_one:
	slt $t3, $t2, $t0
	bne $t3, $zero, print_first
	j compare_sl

compare_sl:
	slt $t3, $t1, $t2
	bne $t3, $zero, print_second
	j print_third

compare_lf_two:
	slt $t3, $t2, $t0
	bne $t3, $zero, print_third
	j print_first

print_first:
	li $v0, 1
	move $a0, $t0
	syscall
	j exit

print_second:
	li $v0, 1
	move $a0, $t1
	syscall
	j exit

print_third:
	li $v0, 1
	move $a0, $t2
	syscall






exit:

	# Exit
	ori     $v0, $0, 10
	syscall

