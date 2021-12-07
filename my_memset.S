section .text
	global _my_memset
	;; rdi = dest, rsi = value, rdx = len
_my_memset:
	push rbp
	mov rbp, rsp
	xor rcx, rcx
_while_len:	
	cmp rcx, rdx
	jge _done
	mov [rdi + rcx], rsi
	inc rcx
	jmp _while_len
_done:
	mov rax, rdi
	pop rbp
	ret
