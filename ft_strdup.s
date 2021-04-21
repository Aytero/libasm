extern	_ft_strlen
extern	_ft_strcpy
extern	_malloc
global	_ft_strdup

section	.text

_ft_strdup:	push rdi			; more calling prep?
			call _ft_strlen
			;inc rax			; len + 1 tho works without it
			mov rdi, rax		; size for malloc
			call _malloc
			test rax, rax		; check malloc return
			je _exit
			mov rdi, rax		; rdi starts at malloc return ptr
			pop rsi				; rsi == rdi ?
			call _ft_strcpy
_exit:		ret
