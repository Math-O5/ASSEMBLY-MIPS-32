#--------------------------------------------------------------
# sumNums.s  
#     Program to sum the digits 1 to 10 and display the answer

#---------------------------------------------------------------
# Global variables declaration section
	.data				# data declaration section
ID:	.ascii	"\nCS366, Computer Architecture II, Spring 2005 \n\n"
 	.ascii	"PCSpim Addition demo  \n"
 	.asciiz 	"Author: Dale Reed \n\n"	# asciiz NULL terminates

#---------------------------------------------------------------
# Main part of the program
	.text		
main:	
	# Display header
	la $a0, ID	# Address of prompt to be displayed on screen
	li $v0, 4		# syscall to print string
	syscall
	# Initialize values
	li	$t0, 0	# Clear sum
	li	$t1, 10	# Initialize loop count

	# Main addition loop
loop:	add	$t0, $t0, $t1  	# $t0 = $t0 + $t1
	addi	$t1, $t1, -1	# Dec. loop count
	bgtz	$t1, loop 	# if ($t1 > 0) branch 

	# display result
	move	$a0, $t0   	# Store the result into $a0 for printing
	li	$v0, 1		# syscall to print integer
	syscall

	# we're done
	li	$v0, 10	 	# syscall for End of program	
	syscall
