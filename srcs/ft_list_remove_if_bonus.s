;void	ft_list_remove_if(t_list **begin_list, void *data_ref, int (*cmp)(),
;							void (*free_fct)(void *));

extern	_free

global	_ft_list_remove_if
section	.text

_ft_list_remove_if:

		push rbp
		mov rbp, rsp
		push rbx
		push r12

		test rdi, rdi		; check if **begin_list == null
		jz _end
		test rdx, rdx		; check if (*cmp) == null
		jz _end
		test rcx, rcx		; check if (*free_fct) == null
		jz _end

		xor r9, r9			; prev = NULL
		mov r12, [rdi]		; store *begin_list
		mov rbx, rdi		; rbx (tmp_lst) = rdi (begin_list)
		jmp short .cmp

.get_next:
		mov r9, [rdi]		; prev = node
		mov r8, [r9 + 8]	; tmp = node->next
		mov [rdi], r8		; node = tmp

.cmp:
		cmp qword [rdi], 0
		je _end
		push rdi
		push rsi			; data_ref
		push rdx
		push rcx
		mov r8, [rdi]		; tmp = node->data
		mov rdi, [r8]		; rdi = tmp
		call rdx			; call (*cmp)
		pop rcx
		pop rdx
		pop rsi
		pop rdi
		test rax, rax		; check (*cmp) return
		jz .free_node		; free if return is 0
		jmp short .get_next

.free_node:
		mov r8, [rdi]		; tmp = node
		mov rbx, [r8 + 8]	; tmp_list = tmp->next 
.call_free_fct:
		push rsi
		push rdx
		push rbx
		push r9
		push rcx
		push rdi
		mov r8, [rdi]		; tmp = node->data
		mov rdi, [r8]		; rdi = tmp
		call rcx			; call (*free_fct)
		pop rdi
.call_free:
		push rdi
		mov r8, [rdi]		; tmp = node
		mov rdi, r8			; rdi = tmp
		call _free
		pop rdi
		pop rcx
		pop r9
		pop rbx
		pop rdx
		pop rsi
		mov [rdi], rbx		; rdi = tmp_lst
		cmp r9, 0			; prev == null ?
		jne .relink
		mov r12, rbx		; if prev == null update begin_list
		jmp .cmp

.relink:
		mov [r9 + 8], rbx	; prev->next = tmp
		jmp .cmp

_end:
		mov [rdi], r12		; rdi = begin_list
		pop r12
		pop rbx
		mov rsp, rbp
		pop rbp
		ret
