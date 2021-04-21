	extern	___error
	global	_ft_write

	section	.text

_ft_write:	mov	rax, 0x02000004		; syscall write
			syscall
			jc .error
			jmp short _end
.error:		push rax
			call ___error
			pop qword [rax]
			mov rax, -1
_end:		ret
