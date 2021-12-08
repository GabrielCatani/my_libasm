	;; my_strlen
	;;  rdi = str
section .text
	global my_strlen	; int my_strlen(char *str)
my_strlen:
	xor rax, rax		; rax = 0
	push rbp		; add base pointer to the stack
	mov rbp, rsp		; begin of stack frame
	mov rax, -1		; set rax to -1
loop:
	inc rax			; rax++
	cmp byte [rdi + rax], 0	; if rdi[rax] == '\0'
	jne loop		; no, loop
        pop rbp			; yes, end of stack frame
	ret			; return, end of function
