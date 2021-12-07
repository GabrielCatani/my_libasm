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
	xor rax, rax
	mov al, r8b
	sub al, r9b
	cmp al, 0
	jl less
	jg more
	pop rbp
	ret

less:
	mov rax, -1
	pop rbp
	ret

more:
	mov rax, 1
	pop rbp
	ret
