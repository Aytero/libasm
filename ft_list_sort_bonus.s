		global	_ft_list_sort

section	.text

_ft_list_sort:

		;push rbp
		;mov rbp, rsp
		;sub rsp, 16
		;push r9
		;push r8
		;push rbx
	
		test rdi, rdi		; check if **begin_list == NULL
		jz _end
		test rsi, rdi		; check if (*cmp) == NULL
		jz _end

		mov rcx, [rdi]		; save begin_list in ptr
		mov rdi, [rdi]		; rdi = begin_list (without ptr?)


.get_next:
		mov rbx, [rdi + 8]	; get next node
		test rbx, rbx			; check if there is next node
		jz _end

.cmp:
		push rdi
		push rsi
		push rcx
		mov rcx, rsi		; mov func cmp' ptr to rbx
		mov rsi, [rdi + 8]	; rsi = node->next / get next node
		mov rsi, [rsi]		; rsi = node1->data
		mov rdi, [rdi]		; rdi = node->data
		xor rax, rax
		call rcx			; call (*cmp)
		pop rcx
		pop rsi
		pop rdi
		cmp rax, 0			; check cmp func return
		jg .swap_data		; jmp if greater (signed)

.inc_head:
		mov rdi, [rdi + 8]	; rdi ptr to next node's start
		;test rdi, rdi		; check next node
		;je _end
		jmp .get_next

.swap_data:
		; reg = lst->next->data
		; reg = lst->data
		; lst->data = lst->next->data (reg)
		; lst->next->data = lst->data (reg)
		; rdi = begin_list
		mov r8, [rbx]		; r9 = ptr node1->data
		mov r9, [rdi]		; r10 = ptr node->data
		mov [rdi], r8		; [rdi] = [r8]
		mov [rbx], r9		; [r8] = [rdi]
		mov rdi, rcx		; restore rdi 
		jmp .get_next

_end:
		;pop rbx
		;pop r8
		;pop r9
		;mov rsp, rbp
		;pop rbp
		ret
