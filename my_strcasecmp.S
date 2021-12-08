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
    jl lower_str1
check_str2:
    mov r10b, [rsi + rcx]
    cmp r10b, 65
    jl compare_str
    cmp r10b, 90
    jl lower_str2
compare_str:
    cmp r9b, r10b
    jne done
    cmp r9b, 0
    je done
    cmp r10b, 0
    je done
    inc rcx
    jmp check_str1 
lower_str1:
    add r9b, 32
    jmp check_str2
lower_str2:
    add r10b, 32
    jmp compare_str
    

done:
    sub r9b, r10b
    movsx rax, r9b
    cmp rax, 0
    jl lower
    jg upper
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