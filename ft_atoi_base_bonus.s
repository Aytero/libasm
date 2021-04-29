global	_ft_atoi_base

section	.text

_ft_atoi_base:

		test rdi ,rdi
		jz _error
		test rsi, rsi
		jz _error

		; check base len and symbs

		xor rax, rax
		;xor sign

; _skip_spaces
; _check_sign

_loop:
		; calc
		; mov rax, new value


; _deal_sign

_error:
		mov rax, 0
		ret

_end:
		ret
