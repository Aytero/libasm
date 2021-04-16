global _ft_strcmp

section .text

_func:
		xor rax, rax
		xor rcx, rcx

_again:
		cmp byte [rdi + rcx], 0
		jz _exit
		cmp byte [rsi + rcx], 0
		jz _exit
		cmp byte [rdi + rcx], [rsi + rcx] ; two mem operands - invalid
		jne _exit
		inc rcx
		jmp _again


		; rsi - rdi, ret 

_exit:
		; sub rsi rdi
		ret