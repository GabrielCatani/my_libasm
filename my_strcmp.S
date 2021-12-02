	;; my_strcmp
	;; rdi -> str1, rsi -> str2
section .text
	global _my_strcmp
_my_strcmp:
	push rbp
	mov rbp, rsp
        xor rax, rax
	mov rax, -1
_loop:
	inc rax
	mov r8b, byte [rdi + rax]
	mov r9b, byte [rsi + rax]	
	cmp r8b, 0
	je _done
	cmp r9b, 0
	je _done
	cmp r8b, r9b
	je _loop
	jne _done
_done:
	xor rax, rax
	mov al, r8b
	sub al, r9b
	cmp al, 0
	jl _less
	jg _more
	pop rbp
	ret

_less:
	mov rax, -1
	pop rbp
	ret

_more:
	mov rax, 1
	pop rbp
	ret
