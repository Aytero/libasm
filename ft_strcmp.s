global _ft_strcmp

section .text

_ft_strcmp:
		push rsi
		push rdi
		xor rax, rax
		xor rbx, rbx

.again:
		mov al, [rdi]
		mov bl, [rsi]
		cmp al, bl
		;cmp [rsi], al
		jne _exit
		;cmp bl, 0
		cmp byte [rsi], 0 ; faster than cmp bl, 0 (?)
		jz _exit
		;cmp al, 0
		cmp byte [rdi], 0
		jz _exit
		inc rsi
		inc rdi
		jmp .again

_exit:
		;sub rdi, rsi
		;sub al, bl
		sub rax, rbx
		pop rsi
		pop rdi
		ret
