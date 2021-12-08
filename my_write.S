	;; my_write
;; Check if fd is valid, using fstat
section .text
	global my_write
my_write:
	push rbp
	mov rbp, rsp
	mov rax, 1 	    ; write syscall
	syscall
	cmp rax, 0
    jl error 
    pop rbp
	ret
error:
	mov rax, -1		; return -1 if error
	pop rbp
	ret
