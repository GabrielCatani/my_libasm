section .text
	global my_memset
	;; rdi = dest, rsi = value, rdx = len
my_memset:
	push rbp
	mov rbp, rsp
	xor rcx, rcx
while_len:	
	cmp rdx, 0
	je done
	mov byte [rdi + rcx], sil
    dec rdx
	inc rcx
	jmp while_len
done:
	mov rax, rdi
	pop rbp
	ret
