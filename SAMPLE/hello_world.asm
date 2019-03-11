#This is a sample HELLO WORLD maldition:
 
.data				# Contém os dados do programa.
				# It has the data of program.
	hello: .asciiz "HELLO WORLD \n"
	
.text				# Instructions of the program.
	li $v0, 4		# Load immediately  System.
	la $a0, hello		# Load adress of hello.
	syscall