	extern	___error
	global	_ft_read

	section .text

_error:
			push rax
			call ___error
			pop qword [rax]
			mov rax, -1
			jmp _end
_ft_read:
			mov rax, 0x02000003
			syscall
			jc _error
_end:
			ret
