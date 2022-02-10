	;; my_strcasecmp
	;; rdi = str1, rsi = str2
section .text
	global my_strcasecmp 	; int my_strcasecmp(char *str1, char *str2)
my_strcasecmp:
	push rbp		; add base pointer to the stack
	mov rbp, rsp		; begin of stack frame
        xor rcx, rcx		; counte rinitiate to 0
	
check_str1:
    mov r9b, [rdi + rcx]	; r9b = str1[rcx]
    cmp r9b, 65			; check if str1[rcx] < 65 or 'A'
    jl check_str2		; if yes, check str2
    cmp r9b, 90			; check if str1[rcx] > 90 or 'Z'
    jl lower_str1		; if yes, str1[rcx] is upper. Lower it
check_str2:
    mov r10b, [rsi + rcx]	; r10b = str2[rcx]
    cmp r10b, 65		; check if str2[rcx] < 65 or 'A'
    jl compare_str		; if yes, compare str1/str2
    cmp r10b, 90		; check if str2[rcx] > 90 or 'Z'
    jl lower_str2		; if yes, str2[rcx] is upper. Lower it
compare_str:
    cmp r9b, r10b		; check if str1[rcx] != str2[rcx]
    jne done			; yes, return
    cmp r9b, 0			; if str1[rcx] == '\0'
    je done			; yes return
    cmp r10b, 0			; if str2[rcx] == '\0'
    je done			; yes return
    inc rcx			; rcx++
    jmp check_str1 		; loop
lower_str1:
    add r9b, 32			; str1[rcx] += 32 (Upper to lower)
    jmp check_str2		; go and check str2
lower_str2:
    add r10b, 32		; str2[rcx] += 32 (Upper to lower)
    jmp compare_str		; go and compare str1 str2
    
done:
    sub r9b, r10b		; str1[rcx] -= str2[rcx]
    movsx rax, r9b		; mov str1[rcx] to return, with sign
    cmp rax, 0			; check if str1[rcx] == 0
    jl lower			; check if str1[rcx] < 0
    jg upper			; check if str1[rcx] > 0
    pop rbp			; end of stack frame
    ret				; return, str1[rcx] == 0

lower:
	mov rax, -1 		; check if str1[rcx] < 0
	pop rbp			; end of stack frame
	ret			; return, -1
upper:
	mov rax, 1		; check if str1[rcx] > 0
	pop rbp			; end of stack frame
	ret			; return, str1[rcx] 1
