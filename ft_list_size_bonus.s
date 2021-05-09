	global	_ft_list_size

;int		ft_list_size(t_list *begin_list);

	section	.text

_ft_list_size:
		push rbp
		mov rbp, rsp
		push rdi
		xor rax, rax

.loop:
		test rdi, rdi				; check if node(next) == NULL
		jz _end						; exit if there is no nodes left
		mov rdi, qword [rdi + 8]	; go to next node
		inc rax						; size++
		jmp .loop

_end:
		pop rdi
		mov rsp, rbp
		pop rbp
		ret
