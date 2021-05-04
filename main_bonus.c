#include "libasm_bonus.h"
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/syscall.h>
#include <sys/errno.h>

int		main()
{
	t_list	*node;
	int		d = 8;
	int		a = 15;
	int		b = 27;

//	printf("size = %d\n", ft_list_size(node));
	ft_list_push_front(&node, &d);
	printf("%p\n", node->data);
	printf("%p\n", node->next->data);
	ft_list_push_front(&node, &a);
	printf("%p\n", node->data);
	printf("%p\n", node->next->data);
	printf("%p\n", node->next->next->data);
	ft_list_push_front(&node, &b);
	printf("%p\n", node->data);
	printf("%p\n", node->next->data);
	printf("%p\n", node->next->next->data);
	printf("%p\n", node->next->next->next->data);


	printf("size = %d\n", ft_list_size(node));
	

	return (0);
}
