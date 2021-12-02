section .text
	global _my_strchr
_my_strchr:	
	push rbp
	mov rbp, rsp
	mov rax, -1
_loop:
	inc rax			
	cmp byte [rdi + rax], sil
	je _found
	cmp byte [rdi + rax], 0
	je _exit
	jmp _loop
_found:
	lea rax, [rdi + rax]

_exit:
	pop rbp
	ret
