extern	_ft_strcmp
global	_ft_list_sort

section	.text

_ft_list_sort:

		xor rax, rax

.get_next:
		cmp rdi, 0
		je _end
		mov rbx, [rdi + 8]	; rbx ptr to next elem's start

_cmp:
		push rsi
		push rdi
		mov rdx, rsi		; mov func cmp ptr to rbx
		; put elem2->data in rsi ?
		mov rsi, [rsi]		; put str (data) in reg
		mov rdi, [rdi]
		call rdx			; call (*cmp)
		pop rdi
		pop rsi
		cmp rax, 0
		jle .get_next		; signed condition / jmp if less or equal

_swap:
		mov [rax], rsi	;
		mov rbx, [rdi]	; save start
		mov [rax + 8], rbx	; elem2->next = start

;lo:
;	mov rdi, qword [rbx]		; load first list's var
;	make smth with the var
;	mov rbx, qword [rbx + 8]	; move to next elem
;	cmp rbx, 0					; check if there is next elem
;	jne lo

_end:
		ret
