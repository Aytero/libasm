global _ft_strlen

section .text

_ft_strlen:
		xor rax, rax

.loop:
		cmp byte [rdi + rax], 0 ; rdi - dest index cmp with \0
		je _end					; jump if equal
		inc rax
		jmp short .loop			; short - 1 byte

_end:
		ret
