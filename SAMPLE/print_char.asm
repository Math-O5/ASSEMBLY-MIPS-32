.data
	charset: .byte 'a'
.text
	li $v0, 4
	la $a0, charset
	syscall
	