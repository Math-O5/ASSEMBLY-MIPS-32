.data
	.align 0
	str1: .asciiz "Capivara Feliz" 
	str2: .asciiz ""
.text
	.globl main
	
	main:
		addi $t1, $zero, 0
	
	loop:
		lb $t0, str1($t1)
		sb $t0, str2($t1)
		
		beq $t0, $zero, imprimi
		addi $t1, $t1, 1
		j loop
	
	imprimi:
		li $v0, 4
		la $a0, str2
		syscall   	
			
	
	fim:
	li $v0, 10
	syscall