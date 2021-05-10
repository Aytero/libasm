extern	_ft_strlen
extern	_ft_strcpy
extern	___error
extern	_malloc
		global	_ft_strdup

		section	.text

_ft_strdup:	
		;push rbp
		;mov rbp, rsp
		;push rdi			; more calling prep?
		call _ft_strlen
		;pop rdi
		push rdi			; more calling prep?
		inc rax				; len + 1 for \0
		mov rdi, rax		; size to malloc// use lea
		call _malloc
		test rax, rax		; check malloc return
		jz .error
		mov rdi, rax		; rdi starts at malloc return ptr
		pop rsi				; rsi = rdi 
		call _ft_strcpy
		jmp short _exit
.error:	
		push rax
		call ___error
		pop qword [rax]			; put errno pointer in rax
		mov rax, -1				; 
_exit:
		;mov rsp, rbp
		;pop rbp
		ret
