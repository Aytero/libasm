	extern	_free	; allowed in subj
	global	_ft_list_remove_if

	section	.text

_ft_list_remove_if:

		test rdi, rdi
		jz _end
		test rsi, rsi
		jz _end
		test rbx, rbx		; or rdx??
		jz _end

		; store head

		; cmp
		; jz remove
		; else jmp next

		; remove
		; store prev, if data=ref rm, restore links

_end:
		ret
