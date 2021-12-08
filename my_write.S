	;; my_write
	;; rdi = file descriptor, rsi = value to write, rdx = len
section .text
	global my_write		; int my_write(int fd, void *buf, size_t len)
my_write:
	push rbp		; add base pointer to the stack
	mov rbp, rsp		; begin of stack frame
	mov rax, 1		; write syscall (1)
	syscall			; call syscall indicate on rax (1)
	cmp rax, 0		; if return of write is 0
        jl error 		; yes, go to error
        pop rbp			; end of stack frame
	ret			; return, end of function
error:
	mov rax, -1		; return -1 if error
	pop rbp			; end of stack frame
	ret			; return, end of function
