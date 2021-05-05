	global	_ft_list_size

	section	.text

_ft_list_size:
			push rbp
			mov rbp, rsp
			;sub rsp, 8 ; depends on local vars
			push rdi
			xor rax, rax

.loop:
			test rdi, rdi		; check if node(next) == NULL
			jz _end				; exit if there is no nodes left
			mov rdi, [rdi + 8]	; go to next node
			inc rax				; size++
			jmp .loop

_end:
			pop rdi
			mov rsp, rbp
			pop rbp
			ret
