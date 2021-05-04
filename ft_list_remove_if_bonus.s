	extern	_free	; allowed in subj
	global	_ft_list_remove_if

	section	.text

_ft_list_remove_if:

		cmp rdi, 0
		je _end

_end:
		ret
