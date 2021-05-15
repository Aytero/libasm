;void	ft_list_push_front(t_list **begin_list, void *data);

extern	_malloc
extern	___error

global	_ft_list_push_front
section	.text

_ft_list_push_front:

		push rbp
		mov rbp, rsp
		sub rsp, 8
		push rbx
		test rdi, rdi				; check if **begin_list == null
		jz _end

.malloc:
		push rsi
		push rdi
		xor rax, rax
		mov rdi, 16					; size to allocate: two vars 8 + 8 bytes
		call _malloc
		pop rdi
		pop rsi
		test rax, rax				; check malloc return for NULL
		jz .error

.swap_data:
		mov rbx, qword [rdi]		; make rbx a ptr to begin_list
		mov qword [rax], rsi		; put data in new elem
		mov qword [rax + 8], rbx	; elem->next = begin_list
		mov qword [rdi], rax		; begin_list = new elem
		jmp short _end

.error:
		push rax
		call ___error
		pop qword [rax]				; put errno pointer in rax
		mov rax, -1

_end:
		pop rbx
		add rsp, 8
		mov rsp, rbp
		pop rbp
		ret
