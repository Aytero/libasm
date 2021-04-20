extern	_ft_strlen
extern	_ft_strcpy
extern	_malloc
global	_ft_strdup

section	.text


_error:
		ret

_ft_strdup:
		push rdi
		;xor rax, rax
		call _ft_strlen
		inc rax				; len + 1 tho works without it
		mov rdi, rax		; size for malloc
		call _malloc
		cmp rax, 0			; check malloc return
		je _error
		mov rdi, rax		; rdi starts at malloc return ptr
		pop rsi
		call _ft_strcpy
		ret
