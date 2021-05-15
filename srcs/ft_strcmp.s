;int	ft_strcmp(const char *s1, const char *s2);

global _ft_strcmp
section .text

_ft_strcmp:
		push rbp
		mov rbp, rsp
		push rbx
		xor rax, rax
		xor rbx, rbx

.loop:
		mov al, byte [rdi]
		mov bl, byte [rsi]
		test bl, bl			; check for \0
		jz _end
		test al, al			; check for \0
		jz _end
		cmp al, bl			; compare bytes (symbs)
		jne _end			; if they are different
		inc rsi
		inc rdi
		jmp short .loop

_end:
		sub rax, rbx		; rax = al(rax) - bl(rbx)
		pop rbx
		mov rsp, rbp
		pop rbp
		ret
