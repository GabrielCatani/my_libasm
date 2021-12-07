section .text
	global my_strchr
my_strchr:	
	push rbp
	mov rbp, rsp
	mov rax, -1
loop:
	inc rax			
	cmp byte [rdi + rax], sil
	je found
	cmp byte [rdi + rax], 0
	je exit
	jmp loop
found:
	lea rax, [rdi + rax]

exit:
	pop rbp
	ret
