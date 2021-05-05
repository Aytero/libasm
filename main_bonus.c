#include "libasm_bonus.h"
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/syscall.h>
#include <sys/errno.h>

int		cmp_lower(void *a, void *b)
{
	return ((long)a > (long)b);
}

int		main()
{
	t_list	*node = NULL;
	int		d = 8;
	int		a = 15;
	int		b = 27;

	printf("size %d\n", ft_list_size(node));

	ft_list_push_front(&node, (void*)1);
	printf("size %d\n", ft_list_size(node));

	printf("begin lst     %p   data %d\n", node, node);
	printf("begin lst + 8 %p   data %d\n", node + 8, node->data);

//	printf("%d\n", *((int *)node->data));
//	printf("%p\n", node->data);
//	printf("%p\n", node->next->data);
	ft_list_push_front(&node, (void*)-2);
	printf("size %d\n", ft_list_size(node));
//	printf("%d\n", *((int *)node->data));
//	printf("%d\n", *((int *)node->next->data));
//	printf("%p\n", node->data);
//	printf("%p\n", node->next->data);
//	printf("%p\n", node->next->next->data);
//	ft_list_push_front(&node, &b);
	ft_list_push_front(&node, (void*)3);
	printf("size %d\n", ft_list_size(node));
	ft_list_push_front(&node, (void*)8);
	printf("size %d\n", ft_list_size(node));
	ft_list_push_front(&node, (void*)5);
//	printf("%d\n", *((int *)node->data));
//	printf("%d\n", *((int *)node->next->data));
//	printf("%d\n", *((int *)node->next->next->data));
//	printf("%p\n", node->data);
//	printf("%p\n", node->next->data);
//	printf("%p\n", node->next->next->data);
//	printf("%p\n", node->next->next->next->data);


	printf("size %d\n", ft_list_size(node));

	ft_list_sort(&node, &cmp_lower);

// lst clean	

	return (0);
}
