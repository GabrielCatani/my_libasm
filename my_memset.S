	;; my_memset
	;; rdi = dst, rsi = value, rdx = len 
section .text
	global my_memset	; void *my_memset(void *dst,int value, size_t len) 
my_memset:
	push rbp		  ; add base pointer to the stack
	mov rbp, rsp		  ; begin of stack frame
	xor rcx, rcx		  ; counter initiate to 0
while_len:	
	cmp rdx, 0		  ; check if len is 0
	je done			  ; if it is, return
	mov byte [rdi + rcx], sil ; dst[rcx] = value 
        dec rdx			  ; rdx--
	inc rcx			  ; rcx++
	jmp while_len		  ; loop
done:
	mov rax, rdi		  ; return dst (rax => return value)
	pop rbp			  ; end of stack frame
	ret			  ; return, end of function
