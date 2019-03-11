.data
	NULL: .word 0
.text
	li $v0, 1
	lw $a0, NULL
	syscall