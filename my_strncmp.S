	;; my_strncmp
	;; rdi -> str1, rsi -> str2, rdx -> len
section .text
	global my_strncmp
my_strncmp:
	push rbp
	mov rbp, rsp
    xor rax, rax
	mov rax, -1
loop:
	inc rax
	cmp rax, rdx
	je done
	mov r8b, byte [rdi + rax]
	mov r9b, byte [rsi + rax]	
	cmp r8b, 0
	je done
	cmp r9b, 0
	je done
	cmp r8b, r9b
	je loop
	jne done
done:
	sub r8, r9
	mov rax, r8
	pop rbp
	ret

