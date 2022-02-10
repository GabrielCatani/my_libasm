	;; my_strchar
	;; rdi = string (Haystack), rsi = char (Needle)
section .text
	global my_strchr	  ; char *my_strchr(char *str, char c)
my_strchr:	
	push rbp		  ; add base pointer to the stack
	mov rbp, rsp		  ; begin of stack frame
	mov rax, -1		  ; set rax -1
loop:
	inc rax			  ; rax++
	cmp byte [rdi + rax], sil ; if string[rax] == rsi
	je found		  ; yes, go to found
	cmp byte [rdi + rax], 0	  ; no, check if string[rax] == '\0'
	je exit			  ; yes, return
	jmp loop		  ; no, loop
found:
	lea rax, [rdi + rax]	  ; rax = &string[rax]

exit:
	pop rbp			  ; end of stack frame
	ret			  ; return, end of function
