	;; my_memcpy
	;; rdi = dst, rsi = src, rdx = len 
section .text
	global my_memcpy	; void *my_memcpy(void *dst,void *src, size_t len) 
my_memcpy:
	push rbp 		; add base pointer to the stack
	mov rbp, rsp		; begin of stack frame
	xor rcx, rcx		; counter initiate to 0
check_len:			
	cmp rsi, 0		; check if src is NULL
	je done			; if it is, return
	
check_overlap:
	cmp rdi, rsi		; check if dst and src overlap
	je done			; if overlap, return

while_len:
	cmp rcx, rdx		; check if counter with len
	jge done		; if it's greater or equal return
	mov r9b, [rsi + rcx]	; r9b = dst[rcx]
	mov [rdi + rcx], r9b	; src[rcx] = r9b
	inc rcx			; rcx++
	jmp while_len		; loop
done:
	mov rax, rdi		; return dst (rax => return value)
	pop rbp			; end of stack frame
	ret			; return, end of function
