global _ft_strdup

section .text

_ft_strdup:
		xor rax, rax
		xor rcx, rcx
		lea rdi, [str2] ; load str in rdi
.loop1:	cmp byte [rsi + rcx], 0
		je .next
		inc rcx
		jmp .loop1
.next:	mov [len], rcx
.loop2:	cmp byte [rsi], 0
		je _exit
		mov al, [rsi]
		mov [rdi], al
		inc rsi
		inc rdi
		loop .loop2
_exit:	mov rax, rdi
		ret

section .data
		len dw 0
section .bss
		str2 resb len
