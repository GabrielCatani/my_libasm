section .text
	global _my_strlen
_my_strlen:
	xor rax, rax
	push rbp
	mov rbp, rsp
	mov rax, -1
_loop:
	inc rax
	cmp byte [rdi + rax], 0
	jne _loop
        pop rbp
	ret
