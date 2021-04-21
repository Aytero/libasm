global _ft_strcmp

section .text

_ft_strcmp:
		push rsi
		push rdi
		push rbx
		xor rax, rax
		xor rbx, rbx

.loop:
		mov al, [rdi]
		mov bl, [rsi]
		cmp al, bl
		jne _exit
		test bl, bl
		jz _exit
		test al, al
		jz _exit
		inc rsi
		inc rdi
		jmp .loop	; add short

_exit:
		;sub rdi, rsi
		;sub al, bl
		sub rax, rbx
		pop rsi
		pop rdi
		pop rbx
		ret
