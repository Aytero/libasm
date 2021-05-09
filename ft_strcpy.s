global _ft_strcpy

section .text

_ft_strcpy:	xor rax, rax
			push rdi
			push rsi
			cld
.loop:		lodsb
			stosb
			cmp al, 0
			jnz .loop
			mov byte [rdi], 0
			pop rsi
			pop rdi
			mov rax, rdi
_end:		ret
