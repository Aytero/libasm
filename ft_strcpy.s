global _ft_strcpy

section .text

_ft_strcpy:
		xor rax, rax
		xor rcx, rcx

_again:
		cmp byte [rsi + rcx], 0
		je _end
		mov rbx, [rsi + rcx]
		mov [rdi + rcx], rbx
		inc rcx
		jmp _again

_end:
		mov rax, rdi
		ret
