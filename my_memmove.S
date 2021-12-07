section .text
	global _my_memmove
_my_memmove:
	push rbp
	mov rbp, rsp
	xor rcx, rcx
_check_len:
	cmp rsi, 0
	je _done
	
_check_overlap:
	cmp rdi, rsi
	je _done
_check_src_less_dst:
	mov rcx, rdx
	cmp rsi, rdi
	jge _fill_foward
	mov rcx, 0
_fill_backwards:
	cmp rcx, rdx
	je _done
	mov r9b, [rsi + rcx]
	mov [rdi + rcx], r9b
	inc rcx
	jmp _fill_backwards
_fill_foward:
	cmp rcx, rdx
	je _done
	mov r9b, [rsi + rcx]
	mov [rdi + rcx], r9b
	dec rcx
	jmp _fill_foward
_done:
	pop rbp
	ret
