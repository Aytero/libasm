	extern	_free
	global	_ft_list_remove_if

	section	.text

_ft_list_remove_if:

		push rbp
		mov rbp, rsp

		test rdi, rdi		; begin list
		jz near _end
		test rsi, rsi		; data ref
		jz near _end
		test rdx, rdx		; cmp
		jz near _end
		test rcx, rcx		; free_fct
		jz near _end

		xor r9, r9
		mov r8, [rdi]		; store head // tmp
		mov rdi, [rdi]	; get node->data?
		jmp .cmp

.get_next:
		mov rdi, [rdi + 8]	; rdi ptr to next node's start
		test rdi, rdi		; check next node
		jz _end
		;jmp short .cmp

.cmp:
		xor rax, rax
		push rsi
		push rdi
		;xor rax, rax
		mov rsi, [rsi]	; ref
		mov rdi, [rdi]
		call rdx
		pop rdi
		pop rsi
		cmp rax, 0	; mb use test
		jz .remove
; else inc head
.get_prev:
		mov r9, [rdi]		; store prev
		jmp .get_next

.remove:
		cmp r9, 0
		jne .relink
		mov rdi, [r8 + 8]	; new begin_list
		jmp .clean

.relink:
		; prev->next = tmp->text
		;mov [r9 + 8], [rdi + 8]
		mov r10, [rdi + 8]
		mov [r9 + 8], r10

.clean:
		push rdi
		mov rdi, [rdi]
		call rcx
		pop rdi
		call _free
		; test rax
		jmp .get_next

_end:
		mov rsp, rbp
		pop rbp
		ret
