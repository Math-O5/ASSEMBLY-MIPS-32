#	Bubblesort implementado por Gabriel Van Loon
#	com apoio especial de
#	Mathias F,
#	Giovanni. L,
#	Tamiris T,
#	Auberto C.
#
#	Comentarios For Dummies
#
#	From ICMC USP,
#		 2019
 
.data
	.align 2
	vet: .word 7,5,2,1,1,3,4		# UM VETOR DESORDENADO
	gap: .byte ' '				# espaco branco
	
.text
	.globl main
	
	main:	addi $t3, $zero, 28		# MAX (7 words)
		addi $t0, $zero, 0		# i = 0
	
	#IMPRIME DESORDENADO
	
	ordi2:	beq $t0, $t3, fim_ordi2		# se i == MAX, vah para fim_ord2
		
		lw $t6, vet($t0) 		# aux = v[i] 
		
		li $v0, 1
		add $a0, $zero, $t6		# $a0 = 0 + $t6
		syscall
	 	
	 	addi $t0, $t0,  +4		# i += 4
	 	j ordi2
	fim_ordi2:
	
	#BUBBLE SORT
	addi $t0, $zero, 0 			# i = 0
	ordi:	beq $t0, $t3, fim_ordi 		# se i == MAX, vah para fim_ordi
		
		addi $t1, $zero, 24 		# j = 0 + 24
		ordj: beq $t1, $t0, fim_ordj	# se j == i, fim_ordj
			
	 		#verificando se T1 eh maior do que T0
	 		lw $t6, vet($t0)	# t6 = v[i]
	 		lw $t7, vet($t1)	# t7 = v[j]
	 		
	 		ble $t6, $t7, nao_swap	# se vet[i] < vet[j], vah para nao_swap
	 			sw $t7, vet($t0)# v[i] = v[j]
	 			sw $t6, vet($t1)# v[j] = v[i]
	 		nao_swap:
	 		
	 		addi $t1, $t1, -4	# j -= 4
	 		j ordj
	 	fim_ordj:
	 	
	 	addi $t0, $t0,  +4		# j +=4
	 	j ordi
	 fim_ordi:
	 	
	
	# IMPRIME ORDENADO
	addi $t0, $zero, 0
	ordi3:	beq $t0, $t3, fim_ordi3
		
		lw $t6, vet($t0) 
		
		li $v0, 1			# imprime inteiro
		add $a0, $zero, $t6
		syscall
	 	
	 	li $v0, 4			# imprime espaco em branco
	 	la $a0, gap
	 	syscall
	 	
	 	addi $t0, $t0,  +4
	 	j ordi3
	
	# FIM
	fim_ordi3:
		
	li $v0, 10
	syscall
	
		
	
		
		
