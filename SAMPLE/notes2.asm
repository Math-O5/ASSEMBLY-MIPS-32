.data
	# He says how it ll be assigned. 2^n
	# 2 palavra (word) 4 bytes
	# alighn 1 halfword
	# 0 string ()
	
	.align 0
	str: .asciiz "Hello"
	.align 2
	vet: .word 1,2,3 
.text
	
	# Um código externo pode executar a função:
	.globl main
	.globl  sum_matriz
	.globl mul_matriz
	
	# a0..a3 to be argument
	# v0..v3 to be return
	main:	
		# Jump and Link: Go to  and save the actual address in $ra
		jal func
	
	sum_matriz:
	
	mul_matriz:
	
	func:	
		# Alocar memória  na pilha, add inteiro
		# Passar argumentos, e para cada um são necessarios 4 bytes.
		addi $sp, $sp, -8
		sw $a0, 4($sp)
		sw $ra, ($sp)
		
		
		lw $a0, 4($sp)
		lw $ra, 0($sp)
		addi $sp, $sp, 8
		jr $ra
		
		# sw  valor,destino
		# lw destino,valor
		sw $a0, 4($sp)
		lw $a0, 4($sp)
		  
		# Load byte: str[1]
		# Load byte: str[0]
		lb $t2,str
		lb $t0,str
		
		# div => mflo e mfli
		# mflo => quociente
		# mfhi => resto da divisão
		div $t1, $t2
		mflo $t3 
		mfhi $t0

		# mul ignora os mais significativos
		# mult =>  mflo e mfhi
		# mflo => bit menos significativos
		# mfhi => bit mais sig
	
		# sbrk
		# Alocando memória dinamicamente,  
		# em a0 dizer quantos bytes serão alocados.
		li $v0, 9
		li $a0, 40
		syscall
		add $s0, $zero, $v0
		
		# percorrer loop: 
		loop:
			sw $t0, vet($t1)
			addi $t1, $t1, 4
			j loop
		
		
		
		
		
