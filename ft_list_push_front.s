extern	_malloc
global	_ft_list_push_front

section	.text

_ft_list_push_front:

	;	push rsp
		push rbx

		cmp rdi, 0			; check **begin_list
		je _end
		cmp rsi, 0			; check data
		je _end

		push rsi
		push rdi

		xor rbx, rbx
		mov rbx, [rdi]		; save begin_list ptr

		xor rax, rax
		mov rdi, 16
		call _malloc		; put 16 in rdi: two elems 8 + 8
		pop rdi
		pop rsi
		test rax, rax
		jz _end
		mov [rax], rsi		; put data in new elem
		mov [rax + 8], rbx	; elem->next = begin_list
		mov [rdi], rax

_end:
		pop rbx
	;	pop rsp
		ret
