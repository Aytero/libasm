		extern _ft_strlen
		global	_ft_atoi_base

;int	ft_atoi_base(char *str, char *base);

		section	.text

_ft_atoi_base:

		push rbp
		mov rbp, rsp
		push r12
		push rbx

		test rdi ,rdi
		jz _error
		test rsi, rsi
		jz _error

.check_base_len:
		; check base len and symbs
		;xor rax, rax
		push rsi
		push rdi
		mov r12, [rsi]
		mov rdi, r12
		;mov rdi, [rsi]
		call _ft_strlen
		mov rbx, rax
		cmp rbx, 2
		jl _error
		pop rdi
		pop rsi

		mov rcx, -1
.check_base_sym:
		inc rcx
		cmp byte [rsi  + rcx], 0
		je _atoi
		cmp byte [rsi + rcx], 32	; sp
		je _error
		cmp byte [rsi + rcx], 9		; ht
		je _error
		cmp byte [rsi + rcx], 10	; nl
		je _error
		cmp byte [rsi + rcx], 11	; vt
		je _error
		cmp byte [rsi + rcx], 12	; np
		je _error
		cmp byte [rsi + rcx], 13	; cr
		je _error
		cmp byte [rsi + rcx], 43	; '+'
		je _error
		cmp byte [rsi + rcx], 45	; '-'
		je _error

_atoi:
		xor rax, rax
		xor r12, r12
		mov rcx, -1
.skip_spaces:
		inc rcx
		cmp byte [rdi + rcx], 32	; sp
		je .skip_spaces
		cmp byte [rdi + rcx], 9		; ht
		je .skip_spaces
		cmp byte [rdi + rcx], 10	; nl
		je .skip_spaces
		cmp byte [rdi + rcx], 11	; vt
		je .skip_spaces
		cmp byte [rdi + rcx], 12	; np
		je .skip_spaces
		cmp byte [rdi + rcx], 13	; cr
		je .skip_spaces

		jmp .get_sign


.inc_counter:
		inc rcx
.get_sign:
		cmp byte [rdi + rcx], 45	; '-'
		jne .skip_sign
		add r12, 1
		;jmp .skip_sign
.skip_sign:
		cmp byte [rdi + rcx], 43	; '+'
		je .inc_counter
		cmp byte [rdi + rcx], 45	; '-'
		je .inc_counter

	;	jmp .loop

.loop:
		cmp byte [rdi + rcx], 48
		jge .nxt
		jmp .deal_sign
.nxt:	cmp byte [rdi + rcx], 57
		jle .calc
		jmp .deal_sign

.calc:
		; rax = rax * 10 + byte [rdi + rcx] - 48
		mov r9, rax
		mov rax, 10
		mov rdx, r9
		mul rdx
		;mov rax, rdx
		;xor rbx, rbx
		mov dl, byte [rdi + rcx]
		add rax, rdx
		sub rax, 48
		inc rcx
		jmp .loop
		;jmp .deal_sign


 .deal_sign:
		test r12, 1
		jz _end		; if even number of '-'
		neg rax		; if odd
		jmp _end

_error:
		mov rax, 0

_end:
		pop rbx
		pop r12
		mov rsp, rbp
		pop rbp
		ret
