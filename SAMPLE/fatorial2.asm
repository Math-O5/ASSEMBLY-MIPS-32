#	Pseu-code factorial:
#	n, fat = 1
#	while(n > 1)
#		fat = fat * n;
#		n = n - 1
#
.data
	.align 0
	nextInt: .asciiz "Digite um inteiro positivo\n"
	answer: .asciiz "Answer: \n"
	jumpLine: .byte '\n'
	eh: .asciiz "eh"
	space: .byte ' '
	invalidaInput: .asciiz "Invalide value\n"
.text
	.globl main
	
	main:
		# Print phrase input.
		li $v0,4
		la $a0,nextInt
		syscall
		
		# Input int with service 5 and add it to $t0
		li $v0,5
		syscall
		add $t0,$t0,$v0 # $t0 = n
		
		# Initialize fat = 1 e ONE
		addi $t1,$t1,1
		addi $t2,$t2,1
	
	# While t0 is great than t2
	Fac: bgt $t2,$t0,AnswerFac
		mul $t1, $t1, $t0		 
		addi $t0,$t0,-1
		j Fac
	AnswerFac:
		li $v0,4
		la $a0,answer
		syscall
		
		li $v0,1
		move $a0,$t1
		syscall
	Exit:
		li $v0, 10
		syscall