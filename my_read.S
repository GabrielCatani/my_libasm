	;; my_read
section .text
	global _my_read
_my_read:
	push rbp
	mov rbp, rsp
	mov rax, 0x2000003
	syscall
	cmp rax, -1
	je _error
	pop rbp
	ret
_error:
	pop rbp
	ret
