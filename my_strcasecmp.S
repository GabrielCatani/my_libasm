	;; my_strcasecmp
	;; rdi -> str1, rsi -> str2
section .text
	global _my_strcasecmp
_my_strcasecmp:
	push rbp
	mov rbp, rsp
        xor rcx, rcx
	
_check_str1:
	mov r9b, [rdi + rcx]
	cmp r9b, 65
	jl _check_str2
	cmp r9b, 90
	jg _check_str2
	add r9b, 32
	
_check_str2:
	mov r10b, [rsi + rcx]
	cmp r10b, 65
	jl _comp_strs
	cmp r10b, 90
	jg _comp_strs
	add r10b, 32
	
_comp_strs:
	cmp r9b, 0
	je _done
	cmp r10b, 0
	je _done
	cmp r9b, r10b
	jne _done
	inc rcx
	jmp _check_str1
	
_done:
	sub r9b, r10b
	cmp r9b, 0
	jl _lower
	jg _upper
	mov rax, 0
	pop rbp
	ret
_lower:
	mov rax, -1
	pop rbp
	ret
_upper:
	mov rax, 1
	pop rbp
	ret
