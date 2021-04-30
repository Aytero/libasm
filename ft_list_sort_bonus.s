extern	_ft_strcmp
global	_ft_list_sort

section	.text

_ft_list_sort:

		xor rax, rax
		mov rdi, [rdi]		; save begin_list

_loop:
		mov r8, [rdi + 8]	; get next list
		cmp r8, 0			; check if there is next list
		je _end

_cmp:
		push rdx
		push rsi
		push rdi
		mov rdx, rsi		; mov func cmp ptr to rbx
		mov rsi, [rdi + 8]	; rsi = list2->data
		mov rsi, [rsi]		; put str (data) in reg
		mov rdi, [rdi]
		call rdx			; call (*cmp)
		pop rdi
		pop rsi
		pop rdx
		cmp rax, 0
		jg _swap		; signed condition / jmp if less or equal

_get_next:
		;cmp rdi, 0
		;je _end
		mov rdi, [rdi + 8]	; rdi ptr to next elem's start
		jmp _loop

_swap:
		; reg = lst->next->data
		; reg = lst->data
		; lst->data = lst->next->data (reg)
		; lst->next->data = lst->data (reg)
		; rdi = begin_list
		mov r9, [r8]
		mov r10, [rdi]
		mov [r8], r10	; [r8] = [rdi]
		mov [rdi], r9	; [rdi] = [r8]

		; mov [rax], rsi	;
		; mov rbx, [rdi]	; save start
		; mov [rax + 8], rbx	; elem2->next = start

		jmp _loop

;lo:
;	mov rdi, qword [rbx]		; load first list's var
;	make smth with the var
;	mov rbx, qword [rbx + 8]	; move to next elem
;	cmp rbx, 0					; check if there is next elem
;	jne lo

_end:
		ret
