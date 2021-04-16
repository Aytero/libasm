	global	_ft_write

	section	.text

_error:
			;

_ft_write:
			mov	rax, 0x02000004		; syscall write
			mov	rdi, 1				; stdout
			syscall
			; error
_end:
			ret
