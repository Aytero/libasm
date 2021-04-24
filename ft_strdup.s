extern	_ft_strlen
extern	_ft_strcpy
extern	_malloc
global	_ft_strdup

section	.text

_ft_strdup:	
			call _ft_strlen
			push rdi			; more calling prep?
			inc rax				; len + 1 for \0
			mov rdi, rax		; size to malloc
			call _malloc
			test rax, rax		; check malloc return
			je _exit
			mov rdi, rax		; rdi starts at malloc return ptr
			pop rsi				; rsi = rdi 
			call _ft_strcpy
_exit:
			ret
