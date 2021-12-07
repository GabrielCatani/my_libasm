section .text
	global _my_memcpy
_my_memcpy:
	push rbp
	mov rbp, rsp
	xor rcx, rcx
_check_len:
	cmp rsi, 0
	je _done
	
_check_overlap:
	cmp rdi, rsi
	je _done

_while_len:
	cmp rcx, rdx
	jge _done
	mov r9b, [rsi + rcx]
	mov [rdi + rcx], r9b
	inc rcx
	jmp _while_len
_done:
	mov rax, rdi
	pop rbp
	ret
