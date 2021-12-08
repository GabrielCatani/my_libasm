	;; my_read
section .text
	global my_read
my_read:
	push rbp
	mov rbp, rsp
	mov rax, 0
	syscall
	cmp rax, -1
	je error
	pop rbp
	ret
error:
	pop rbp
	ret
