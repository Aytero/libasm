extern	_ft_strcmp
global	_ft_list_sort

section	.text

_ft_list_sort:

		xor rax, rax
		mov rdi, [rdi]	; save begin_list

.get_next:
		cmp rdi, 0
		je _end
		mov rdi, [rdi + 8]	; rdi ptr to next elem's start

_loop:


_cmp:
		push rsi
		push rdi
		mov rdx, rsi		; mov func cmp ptr to rbx
		; put elem2->data in rsi ?
		;mov rsi, [rdi + 8]
		mov rsi, [rsi]		; put str (data) in reg
		mov rdi, [rdi]
		call rdx			; call (*cmp)
		pop rdi
		pop rsi
		cmp rax, 0
		jle .get_next		; signed condition / jmp if less or equal
;else
_swap:
		; reg = lst->next->data
		; reg = lst->data
		; lst->data = lst->next->data (reg)
		; lst->next->data = lst->data (reg)
		; rdi = begin_list
		mov [rax], rsi	;
		mov rbx, [rdi]	; save start
		mov [rax + 8], rbx	; elem2->next = start
		jmp _loop

;lo:
;	mov rdi, qword [rbx]		; load first list's var
;	make smth with the var
;	mov rbx, qword [rbx + 8]	; move to next elem
;	cmp rbx, 0					; check if there is next elem
;	jne lo

_end:
		ret
