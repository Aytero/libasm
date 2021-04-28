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


		xor rax, rax
		mov rdi, 16
		call _malloc		; put 16 in rdi: two elems 8 + 8
		pop rdi
		pop rsi
		test rax, rax
		jz _end

		xor rbx, rbx
		mov rbx, [rdi]		; make rbx a ptr to begin_list

		mov [rax], rsi		; put data in new elem
		mov [rax + 8], rbx	; elem->next = begin_list
		;mov [rax + 8], [rdi]
		mov [rdi], rax		; begin_list = new elem

_end:
		pop rbx
	;	pop rsp
		ret
