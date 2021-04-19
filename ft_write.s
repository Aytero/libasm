	extern	___error
	global	_ft_write

	section	.text

_error:
			push rbx
			mov rbx, rax
			call ___error
			mov [rax], rbx
			mov rax, -1
			pop rbx
			;ret
			jmp _end

_ft_write:
			;test edi, edi
			;js _error
			;xor rax, rax
			mov	rax, 0x02000004		; syscall write
			syscall
			jc _error
			;cmp rax, 0
			;jl _error
			;ret
_end:
			ret
