		global	_ft_list_sort

;void	ft_list_sort(t_list **begin_list, int (*cmp)());

		section	.text

_ft_list_sort:

		push rbp
		mov rbp, rsp
		;sub rsp, 16
		;push r9
		;push r8
		;push rbx
	
		test rdi, rdi				; check if **begin_list == NULL
		jz _end

		cmp qword [rdi], 0
		je _end

		test rsi, rsi				; check if (*cmp) == NULL
		jz _end

		mov r10, qword [rdi]		; save begin_list in ptr
		mov rdi, qword [rdi]		; rdi = begin_list (without ptr?)
		mov r11, rsi			; store cmp


.get_next:
		cmp qword [rdi + 8], 0
		jz _end
		mov rbx, qword [rdi + 8]	; get next node
		;test rbx, rbx				; check if there is next node
		;jz _end

.cmp:
		push rdi
		push rsi
		sub rsp, 8
		mov rsi, qword [rdi + 8]	; rsi = node->next / get next node
		mov rsi, qword [rsi]		; rsi = node1->data
		mov rdi, qword [rdi]		; rdi = node->data
		call r11					; call (*cmp)
		add rsp, 8
		pop rsi
		pop rdi
		cmp rax, 0					; check cmp func return
		jg .swap_data				; jmp if greater (signed)

.inc_head:
		mov rdi, qword [rdi + 8]	; rdi ptr to next node's start
		;test rdi, rdi				; check next node
		;je _end
		jmp short .get_next

.swap_data:
		; reg = lst->next->data
		; reg = lst->data
		; lst->data = lst->next->data (reg)
		; lst->next->data = lst->data (reg)
		; rdi = begin_list
		mov r8, qword [rbx]		; r9 = ptr node1->data
		mov r9, qword [rdi]		; r10 = ptr node->data
		mov qword [rdi], r8		; [rdi] = [r8]
		mov qword [rbx], r9		; [r8] = [rdi]
		mov rdi, r10			; restore rdi 
		jmp short .get_next

_end:
		;pop rbx
		;pop r8
		;pop r9
		;add rsp, 8
		;mov [rdi], r10
		mov rsp, rbp
		pop rbp
		ret
