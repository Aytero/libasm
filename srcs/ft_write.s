;ssize_t	ft_write(int fd, void *str, size_t nbyte);

extern	___error

global	_ft_write
section	.text

_ft_write:	mov	rax, 0x02000004		; syscall write
			syscall
			jc .error				; syscall error sets jc flag
			jmp short _end			; ret if no error
.error:		push rax
			call ___error
			pop qword [rax]			; put errno pointer in rax
			mov rax, -1
_end:		ret
