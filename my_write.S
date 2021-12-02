	;; my_write
;; Check if fd is valid, using fstat
section .text
	global _my_write
_my_write:
	push rbp
	mov rbp, rsp
        push r8
	push r9
	mov r8, rsi 		; save second write argument - buffer
	mov r9, rdx		; save third write argument - size
	mov rax, 0x20000BD	; fstat call, to check file descriptor
	syscall
        cmp rax, 9
	je _error		; if rax == 9, jmp to error
	mov rax, 0x2000004 	; write syscall
	syscall
	pop r9
	pop r8
	pop rbp
	ret
_error:
	mov rax, -1		; return -1 if error
	pop r9
	pop r8
	pop rbp
	ret
