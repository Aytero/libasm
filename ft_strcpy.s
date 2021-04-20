global _ft_strcpy

section .text

_ft_strcpy:	xor rax, rax
			push rdi
			push rsi	;not sure if it's useful
			cld
.loop:		lodsb
			stosb
			cmp al, 0
			jnz .loop
			pop rdi
			pop rsi
			mov rax, rdi
			ret
