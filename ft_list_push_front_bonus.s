extern	_malloc
extern	___error
global	_ft_list_push_front

section	.text

_ft_list_push_front:

		push rbp
		mov rbp, rsp
		sub rsp, 8
		push rbx
		test rdi, rdi		; check **begin_list
		jz _end
		test rsi, rsi		; check data
		jz _end

.malloc:
		push rsi
		push rdi
		xor rax, rax
		mov rdi, 16			; size to malloc: two vars 8 + 8
		call _malloc
		pop rdi
		pop rsi
		test rax, rax		; check malloc return for NULL
		jz .error

.swap_data:
		xor rbx, rbx
		mov rbx, [rdi]		; make rbx a ptr to begin_list
		mov [rax], rsi		; put data in new elem
		mov [rax + 8], rbx	; elem->next = begin_list
		mov [rdi], rax		; begin_list = new elem
		jmp short _end

.error:
		push rax
		call ___error
		pop qword [rax]			; put errno pointer in rax
		mov rax, -1				; 

_end:
		pop rbx
		mov rsp, rbp
		pop rbp
		ret
