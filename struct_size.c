#include <stdlib.h>
#include <stdio.h>

typedef struct s_list
{
	void			*data;
	struct t_list	*next;
}					t_list;

int		main()
{
	t_list	*elem;
	int		i = 15;

	elem = malloc(sizeof(t_list));
	if (!elem)
		return (0);
	elem->data = &i;
	elem->next = NULL;
	printf("size %lu\n", sizeof(t_list));
	printf("%p\n", elem);
	printf("%p\n", elem->data);
	printf("%p\n", elem[0]);
	printf("%p\n", elem[1]);
	printf("%p\n", elem + 8);
	printf("%p\n", elem->data + 8);
	printf("%p\n", elem->next);
	return (0);
}
