;ssize_t	ft_read(int fd, void *buf, size_t nbyte);

extern	___error

global	_ft_read
section .text

_ft_read:	mov rax, 0x02000003		; syscall read
			syscall
			jc .error				; syscall error sets jc flag
			jmp short _end			; ret if no error
.error:		push rax
			call ___error
			pop qword [rax]			; put errno pointer in rax
			mov rax, -1
_end:		ret
