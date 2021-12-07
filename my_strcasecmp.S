	;; my_strcasecmp
	;; rdi -> str1, rsi -> str2
section .text
	global my_strcasecmp
my_strcasecmp:
	push rbp
	mov rbp, rsp
    xor rcx, rcx
	
check_str1:
	mov r9b, [rdi + rcx]
	cmp r9b, 65
	jl check_str2
	cmp r9b, 90
	jg check_str2
	add r9b, 32
	
check_str2:
	mov r10b, [rsi + rcx]
	cmp r10b, 65
	jl comp_strs
	cmp r10b, 90
	jg comp_strs
	add r10b, 32
	
comp_strs:
	cmp r9b, 0
	je done
	cmp r10b, 0
	je done
	cmp r9b, r10b
	jne done
	inc rcx
	jmp check_str1
	
done:
	sub r9b, r10b
	cmp r9b, 0
	jl lower
	jg upper
	mov rax, 0
	pop rbp
	ret
lower:
	mov rax, -1
	pop rbp
	ret
upper:
	mov rax, 1
	pop rbp
	ret