	extern	___error
	global	_ft_read

	section .text

_ft_read:	mov rax, 0x02000003		; syscall read
			syscall
			jc .error				; syscall error sets jc flag
			jmp short _end
.error:		push rax
			call ___error
			pop qword [rax]			; 
			mov rax, -1
_end:		ret
