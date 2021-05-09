		extern	_free
		global	_ft_list_remove_if

;void	ft_list_remove_if(t_list **begin_list, void *data_ref, int (*cmp)(),
;				void (*free_fct)(void *));

		section	.text

_ft_list_remove_if:

		push rbp
		mov rbp, rsp

		push rbx
		push r12

		test rdi, rdi		; begin list
		jz _end
		;test rsi, rsi		; data ref
		;jz _end
		test rdx, rdx		; cmp
		jz _end
		test rcx, rcx		; free_fct
		jz _end

		;xor rax, rax
		xor r9, r9			; prev = NULL

		mov r12, [rdi]		; store head
		mov rbx, rdi		; r11 (tmp) = rdi
		;mov rbx, [rdi]		; r11 (tmp) = rdi
		jmp .cmp

.get_next:
		mov r9, [rdi]
		;mov r12, [rdi + 8]	; rdi ptr to next node's start
		;mov [rdi], r12
		mov r8, [r9 + 8]
		mov [rdi], r8
		;test rdi, rdi		; check next node
		;jz _end
		;jmp short .cmp

.cmp:
		cmp qword [rdi], 0
		je _end
		push rdi
		push rsi			; data_ref
		push rdx
		push rcx
		;mov rdi, [rdi]
		mov r8, [rdi]
		mov rdi, [r8]
		cmp rdi, 0
		jz .cmp_null
		call rdx
		jmp .cmp_cont
.cmp_null:
		xor rdi, rsi
		mov rax, rdi
.cmp_cont:	
		pop rcx
		pop rdx
		pop rsi
		pop rdi
		cmp rax, 0	; mb use test
		jz .free_node
		jmp .get_next
; else inc head
;.get_prev:
;		mov r9, [rdi]		; store prev
;		jmp .get_next

.free_node:
		;mov rdi, [r8 + 8]	; new begin_list
		mov r8, [rdi]
		mov rbx, [r8 + 8]
.call_free_fct:
		push rsi
		push rdx
		push rcx
		push rdi
		;mov rdi, [rdi]
		mov r8, [rdi]
		mov rdi, [r8]
		call rcx
		pop rdi
.call_free:
		push rdi
		;mov rdi, [rdi]
		mov r8, [rdi]
		mov rdi, r8
		call _free
		pop rdi
		pop rcx
		pop rdx
		pop rsi

		mov [rdi], rbx

		cmp r9, 0
		jne .relink
		mov r12, rbx
		jmp .cmp
		;jmp .get_next

.relink:
		; prev->next = tmp->text
		;mov [r9 + 8], [rdi + 8]
		;mov r10, [rdi + 8]
		;mov [r9 + 8], r10

		mov [r9 + 8], rbx
		jmp .cmp


_end:
		mov [rdi], r12
		pop r12
		pop rbx
		mov rsp, rbp
		pop rbp
		ret
