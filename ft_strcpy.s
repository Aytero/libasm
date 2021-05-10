global _ft_strcpy

section .text

_ft_strcpy:	
			push rbp
			mov rbp, rsp
			push rdi
			xor rax, rax
			cld
.loop:		lodsb
			stosb
			cmp al, 0
			jnz .loop
			mov byte [rdi], 0
			pop rdi
			mov rax, rdi
			mov rsp, rbp
			pop rbp
_end:		ret
