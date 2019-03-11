#	Factorial:
#
#	Written in C:
#
#	int main() {
#		int n, fat, cont;
#		n = 1; 
#		printf("Digite 1 n° \n");
#		scanf("%d",&n);
#		fat = 1; cont = n;
#		while(cont > 1) {
#			fat *= cont--; 
#		}
#		printf("O fatorial de %d eh %d\n", n,fat);
#	}
#
# Now in assembly-mips:
.data
	.align 0
	digite_1_num: .asciiz "Digite 1 n° \n"
	fat_de: .asciiz "O fatorial de "
	eh: .asciiz "eh "
	ln: .byte '\n'
	space: .byte ' '
.text
	.globl main
	
	main:
		li $v0,4 		# Load service print string.
		la $a0,digite_1_num	# Print the string digite_1_num.
		syscall
		
		li $v0,5 		# Load service five: input a integer.
		syscall
		move $t0,$v0		# Move $v0 to reg s$t0, $t0 is n.
					# It's necessary move to not lose it.
					
		addi $t1,$s0,1 		# $t1 eh fat
		add $t2,$t0,$zero	# $t2 eh cont
		addi $t3, $zero, 1	# $t3 eh cont 1, caso de parado. (break point).
		
	check: ble $t0,$t3, Exit	# Check if the number is more than 1.
	
	fatorial: ble	$t2, $t3, Else	# Branch if less or equal to, cont != 1		
		mul $t1, $t1, $t2	# Multiplica fat = fat * cont
		addi $t2,$t2, -1	# Add -1 to cont 
		j fatorial		# Go to(jump, vá para) fatorial	
	
	Else:				# If cont == 1
		li $v0,4
		la $a0,fat_de
		syscall
		
		li $v0, 1
		move $a0,$t0
		syscall
		
		li $v0,4		# little gap 
		la $a0,space
		syscall
			
		li $v0,4
		la $a0,eh
		syscall
		
		li $v0,1
		move $a0,$t1
		syscall
		
		li $v0,4		# Print next line.
		la $a0,ln
		syscall		
		
	Exit:
		li $v0, 10		# Exit program.
		syscall
	
		 