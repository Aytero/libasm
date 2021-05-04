		global	_ft_list_sort

section	.text

_ft_list_sort:

		;push rbp
		;mov rbp, rsp
		;sub rsp, 16

		xor rax, rax

		push rdx
		push rbx
		cmp rdi, 0
		je _end
		cmp rsi, 0
		je _end

		mov rdx, [rdi]		; save begin_list in ptr
		mov rdi, [rdi]		; rdi = begin_list (without ptr?)

_loop:
		mov rdi, [rdi + 8]	; rdi ptr to next node's start
		cmp rdi, 0
		je _end

_cmp:
		;push rdx
		push rdi
		push rsi
		mov rcx, rsi		; mov func cmp' ptr to rbx
		mov rsi, [rdi + 8]	; rsi = node->next / get next node
		mov rsi, [rsi]		; rsi = node1->data
		mov rdi, [rdi]		; rdi = node->data
		call rcx			; call (*cmp)
		;add rsp, 8
		pop rsi
		pop rdi
		;pop rdx
		cmp rax, 0
		jg _swap			; jmp if greater (signed)

_get_next:
		mov r8, [rdi + 8]	; get next node
		cmp r8, 0			; check if there is next node
		je	_end
		jmp _loop

_swap:
		; reg = lst->next->data
		; reg = lst->data
		; lst->data = lst->next->data (reg)
		; lst->next->data = lst->data (reg)
		; rdi = begin_list
		mov r9, [r8]		; r9 = ptr node1->data
		mov r10, [rdi]		; r10 = ptr node->data
		mov [rdi], r9		; [rdi] = [r8]
		mov [r8], r10		; [r8] = [rdi]
		mov rdi, rdx		; restore rdi 
		jmp _loop
_end:
		pop rbx
		pop rdx
		;mov rsp, rbp
		;pop rbp
		ret
