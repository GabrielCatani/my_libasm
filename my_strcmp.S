	;; my_strcmp
	;; rdi = str1, rsi -> str2
section .text
	global my_strcmp	  ; int my_strcmp(char *str1, char *str2)
my_strcmp:
	push rbp		  ; add base pointer to the stack
	mov rbp, rsp		  ; begin of the stack frame
        xor rax, rax		  ; counter initiate to 0
	mov rax, -1		  ; counter initiate to -1
loop:
	inc rax			  ; rax++
	mov r8b, byte [rdi + rax] ; r8b = str1[rax]
	mov r9b, byte [rsi + rax] ; r9b = str2[rax]
	cmp r8b, 0		  ; check if str1[rax] = '\0'
	je done			  ; yes, return
	cmp r9b, 0		  ; check if str2[rax] = '\0'
	je done			  ; yes, return
	cmp r8b, r9b		  ; check if str1[rax] == str2[rax]
	je loop			  ; yes, loop
	jne done		  ; no, return
done:
	xor rax, rax		  ; rax = 0
	mov al, r8b		  ; rax (lower bits) = str1[rax]
	sub al, r9b		  ; rax -= str2[rax]
	cmp al, 0		  ; rax == 0
	jl less			  ; if rax < 0, go to less
	jg more			  ; if rax > o, go to more
	pop rbp			  ; end of stack frame
	ret			  ; return, end of function

less:
	mov rax, -1		; return -1
	pop rbp			; end of stack frame
	ret			; return, end of function

more:
	mov rax, 1		; return 1
	pop rbp			; end of stack frame
	ret			; return, end of function
