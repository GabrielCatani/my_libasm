	;; my_strncmp
	;; rdi = str1, rsi = str2, rdx = len
section .text
	global my_strncmp	; int my_strncmp(char *str1, char *str2, int len)
my_strncmp:
	push rbp		  ; add base pointer to the stack
	mov rbp, rsp		  ; begin of stack frame
        xor rax, rax		  ; set rax to zero
	mov rax, -1		  ; set rax to -1
loop:
	inc rax			  ; rax++
	cmp rax, rdx		  ; if rax == len(rdx)
	je done			  ; yes, return
	mov r8b, byte [rdi + rax] ; r8b = str1[rax]
	mov r9b, byte [rsi + rax] ; r9b = str2[rax]
	cmp r8b, 0		  ; check if str1[rax] == '\0'
	je done			  ; yes, return
	cmp r9b, 0		  ; check if str2[rax] == '\0'
	je done			  ; yes, return
	cmp r8b, r9b		  ; check if str1[rax] == str2[rax]
	je loop			  ; yes, loop
	jne done		  ; no, return
done:
	sub r8, r9		  ; str1[rax] -= str2[rax]
	mov rax, r8		  ; return str1[rax] (rax => return value)
	pop rbp			  ; end of stack frame
	ret			  ; return, end of function

