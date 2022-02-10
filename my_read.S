	;; my_read
	;; rdi = file descriptor, rsi = buf to read to, rdx = len
section .text
	global my_read		; int my_read(int fd, void *buf, int len)
my_read:
	push rbp		; add base pointer to the stack
	mov rbp, rsp		; begin of stack frame
	mov rax, 0		; read syscall (0)
	syscall			; call syscall indicate on rax (0)
	cmp rax, -1		; if return of read -1
	je error		; yes, go to error
	pop rbp			; end of stack frame
	ret			; return, end of function
error:
	pop rbp			; end of stack frame
	ret			; return, end of function
