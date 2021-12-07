section .text
	global my_strlen
my_strlen:
	xor rax, rax
	push rbp
	mov rbp, rsp
	mov rax, -1
loop:
	inc rax
	cmp byte [rdi + rax], 0
	jne loop
    pop rbp
	ret
