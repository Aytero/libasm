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
		test bl, bl		; check for \0
		jz _exit
		test al, al		; check for \0
		jz _exit
		cmp al, bl		; compare bytes (symbs)
		jne _exit
		inc rsi
		inc rdi
		jmp .loop	; add short

_exit:
		;sub rdi, rsi
		;sub al, bl
		sub rax, rbx
		pop rbx
		pop rdi
		pop rsi
		ret
