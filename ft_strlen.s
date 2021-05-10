global _ft_strlen

;size_t	ft_strlen(char *str);

section .text

_ft_strlen:
		push rbp
		mov rbp, rsp
		sub rsp, 8
		xor rax, rax

.loop:
		cmp byte [rdi + rax], 0 ; rdi - dest index cmp with \0
		je _end					; jump if equal
		inc rax
		jmp short .loop			; short - 1 byte

_end:
		add rsp, 8
		mov rsp, rbp
		pop rbp
		ret
