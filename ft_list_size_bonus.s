global	_ft_list_size

section	.text

_ft_list_size:
			push rdi
			xor rax, rax

.loop:
			cmp rdi, 0
			je _end
			mov rdi, [rdi + 8]
			inc rax
			jmp .loop

_end:
			pop rdi
			ret