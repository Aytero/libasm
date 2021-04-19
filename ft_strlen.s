global _ft_strlen

section .text

_ft_strlen:
		push rcx
		xor rcx, rcx

_again:
		cmp byte [rdi + rcx], 0 ; rdi - dest index cmp with \0
		je _end ; jump if equal /jz jump if zero
		inc rcx
		jmp _again ; short ? jmp short _again

_end:
		mov rax, rcx ; only rax returns? push rax ? rsp returns
		pop	rcx
		ret
