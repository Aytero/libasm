;char	*ft_strcpy(char *dst, char *src);

global _ft_strcpy
section .text

_ft_strcpy:	
			push rbp
			mov rbp, rsp
			push rdi			; save rdi
			xor rax, rax		; rsx = 0
			cld					; clear direction flag
.loop:		lodsb				; put byte from rsi in al(rax) and inc rsi
			stosb				; copy byte from al in rdi and inc rdi
			cmp al, 0			; check for '\0' 
			jnz .loop
			mov byte [rdi], 0	; put '\0'
			pop rdi				; restore rdi ptr
			mov rax, rdi
			mov rsp, rbp
			pop rbp
_end:		ret
