section .text
	global my_memcpy
my_memcpy:
	push rbp
	mov rbp, rsp
	xor rcx, rcx
check_len:
	cmp rsi, 0
	je done
	
check_overlap:
	cmp rdi, rsi
	je done

while_len:
	cmp rcx, rdx
	jge done
	mov r9b, [rsi + rcx]
	mov [rdi + rcx], r9b
	inc rcx
	jmp while_len
done:
	mov rax, rdi
	pop rbp
	ret
