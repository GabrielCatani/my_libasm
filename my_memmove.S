	;; my_memmove
	;; rdi = dst, rsi = src, rdx = len 
section .text
	global my_memmove 	; void *my_memmove(void *dst, void *src, size_t len)
my_memmove:
	push rbp		; add base pointer to the stack
	mov rbp, rsp		; begin of stack frame
	xor rcx, rcx		; counter initiate to 0
check_len:
	cmp rsi, 0		; check if len is equal to 0
	je done			; if it is, return
	
check_overlap:
	cmp rdi, rsi		; check if dst and src ate same memory
	je done			; if overlap, return
check_src_less_dst:
	mov rcx, rdx		; counter (rcx) = rdx
	cmp rsi, rdi		; check if src > dst
	jge fill_foward		; if yes, fill dst from right to left
	mov rcx, 0		; if no, return counter (rcx) to 0
fill_backwards:
	cmp rcx, rdx		; check if counter (rcx) < len (rdx)
	je done			; if counter == len, return
	mov r9b, [rsi + rcx]	; r9b = src[counter]
	mov [rdi + rcx], r9b	; dst[counter] = r9b
	inc rcx			; counter(rcx)++
	jmp fill_backwards	; loop
fill_foward:
	cmp rcx, rdx		; check if counter (rcx) == len (rdx)
	je done			; if yes, return
	mov r9b, [rsi + rcx]	; r9b = src[counter]
	mov [rdi + rcx], r9b	; dst[counter] = r9b
	dec rcx			; counter(rcx)--
	jmp fill_foward		; loop
done:
	pop rbp			; end of stack frame
	ret			; return, end of function
