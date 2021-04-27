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
		jz _end
		test al, al		; check for \0
		jz _end
		cmp al, bl		; compare bytes (symbs)
		jne _end
		inc rsi
		inc rdi
		jmp .loop	; add short

_end:
		sub rax, rbx
		pop rbx
		pop rdi
		pop rsi
		ret
