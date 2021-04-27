extern	_ft_strcmp
global	_ft_list_sort

section	.text

_ft_list_sort:

		xor rax, rax

.get_next:
		cmp rdi, 0
		je _end
		mov rbx, [rdi + 8]	; rbx ptr to next elem's start

_cmp:
		push rsi
		push rdi
		mov rbx, rsi		; mov func cmp ptr to rbx
		mov rsi, [rsi]		; put str (data) in reg
		mov rdi, [rdi]
		call rbx			; call (*cmp)
		pop rdi
		pop rsi
		cmp rax, 0
		jle .get_next		; signed condition / jmp if less or equal

_swap:
		rd

_end:
		ret
