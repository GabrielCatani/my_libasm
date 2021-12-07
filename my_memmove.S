section .text
	global my_memmove
my_memmove:
	push rbp
	mov rbp, rsp
	xor rcx, rcx
check_len:
	cmp rsi, 0
	je done
	
check_overlap:
	cmp rdi, rsi
	je done
check_src_less_dst:
	mov rcx, rdx
	cmp rsi, rdi
	jge fill_foward
	mov rcx, 0
fill_backwards:
	cmp rcx, rdx
	je done
	mov r9b, [rsi + rcx]
	mov [rdi + rcx], r9b
	inc rcx
	jmp fill_backwards
fill_foward:
	cmp rcx, rdx
	je done
	mov r9b, [rsi + rcx]
	mov [rdi + rcx], r9b
	dec rcx
	jmp fill_foward
done:
	pop rbp
	ret
