section .text

_ft_strdup:
		;push rsi
		xor rax, rax
		xor rcx, rcx
.loop:	cmp byte [rsi + rcx], 0
		je .next
		inc rcx
		jmp .loop
.next:	inc rcx				; len + 1
		mov rdi, rcx		; size for malloc
		call _malloc
		cmp rax, 0			; check malloc return
		je _end
		mov rdi, rax		; rdi starts at malloc return ptr
.loop1:	cmp byte [rsi], 0
		je .next1
		mov al, [rsi]
		mov [rdi], al
		inc rsi
		inc rdi
		loop .loop1
.next1:	;pop rsi
_end:	mov rax, rdi
		ret
