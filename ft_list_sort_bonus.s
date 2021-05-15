;void	ft_list_sort(t_list **begin_list, int (*cmp)());

global	_ft_list_sort
section	.text

_ft_list_sort:

		push rbp
		mov rbp, rsp
		push rbx
	
		test rdi, rdi			; check if **begin_list == NULL
		jz _end
		cmp qword [rdi], 0
		je _end
		test rsi, rsi			; check if (*cmp) == NULL
		jz _end

		mov r10, [rdi]			; save begin_list in ptr
		mov rdi, [rdi]			; rdi = begin_list
		mov r11, rsi			; store cmp func ptr

.get_next:
		cmp qword [rdi + 8], 0	; check if there is next node
		jz _end
		mov rbx, [rdi + 8]		; get next node

.cmp:
		push rdi
		push rsi
		sub rsp, 8
		mov rsi, [rdi + 8]		; rsi = node->next (get next node)
		mov rsi, [rsi]			; rsi = node1->data
		mov rdi, [rdi]			; rdi = node->data
		call r11				; call (*cmp)
		add rsp, 8
		pop rsi
		pop rdi
		cmp rax, 0				; check cmp func return
		jg .swap_data			; jmp if greater (signed)

.inc_head:
		mov rdi, [rdi + 8]		; rdi ptr to next node's start
		jmp short .get_next

.swap_data:
		mov r8, [rbx]			; tmp = node1->data
		mov r9, [rdi]			; tmp1 = node->data
		mov [rdi], r8			; node->data = tmp
		mov [rbx], r9			; node1->data = tmp1
		mov rdi, r10			; restore begin_list
		jmp short .get_next

_end:
		pop rbx
		mov rsp, rbp
		pop rbp
		ret
