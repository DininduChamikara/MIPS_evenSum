# evenSum.asm
	.data 
prompt: .asciiz "Enter an integer: "
vara: 	.word 0 		# allocate memory for variable a and initialize with 0
varb:	.word 0			# allocate memory for variable b and initialize with 0
message: .asciiz "Sum of even integers is "
	.text 
main: 	la $a0, prompt		# load address of prompt to register 4
	li $v0, 4		# load immediate 4 (service 4: print string) to register 2
	syscall 		# issue a system call to print prompt
	li $v0, 5		# load immediate 5 (service 5: read integer) to register 2
	syscall 		# issue a system call to read integer
	add $t0, $v0, $zero	# copy value in register 2 to register 8
	lw $t1, vara		# load word at address labelled by vara to register 9
	lw $t2, varb		# load word at address labelled by varb to register 10
loop:	bgt $t1, $t0, endLoop	# if register 9 > register 8, branch to endLoop
	add $t2, $t2, $t1	# register 10 = register 10 + register 9
	sw $t2, varb		# store value in register 10 at address labelled by varb
	addi $t1, $t1, 2	# increment value of register 9 by 2
	sw $t1, vara		# store value in register 9 at address labelled by vara
	j loop			# jump to label loop
endLoop:la $a0, message		# load address of message to register 2
	li $v0, 4		# load immediate 4 (service 4: print string) to register 2
	syscall 		# issue a system call to print message
	lw $a0, varb		# load word at address labelled by varb to register 4
	li $v0, 1		# load immediate 1 (service 1: print integer) to register 2
	syscall			# issue a system call to print integer
	li $v0, 10		# load immediate 10 (service 10: terminate program) to register 2
	syscall 		# issue a system call to terminate program
