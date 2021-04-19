	extern	___error
	global	_ft_read

	section .text

_error:
			push rbx
			mov rbx, rax
			call ___error
			mov [rax], rbx
			mov rax, -1
			pop rbx
			jmp _end
_ft_read:
			mov rax, 0x02000003
			syscall
			jc _error

_end:
			ret
