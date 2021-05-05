#include "libasm_bonus.h"
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/syscall.h>
#include <sys/errno.h>

void	print_list(t_list *head)
{
	t_list	*tmp;

	tmp = head;
	while (tmp)
	{
		printf("%d  ", (int)tmp->data);
		tmp = tmp->next;
	}
	printf("\n");
}

void	list_clean(t_list **head)
{
	t_list	*tmp;

	if (head)
	{
		while (*head)
		{
			tmp = (*head)->next;
			free(*head);
			(*head) = tmp;
		}
	}
}

int		cmp_lower(void *a, void *b)
{
	return ((long long)a > (long long)b);
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

	printf("begin lst     %p\n", node);
	printf("begin lst     %p\n", &node);
	printf("begin lst     %p\n", &node->data);
//	printf("begin lst + 8 %p   data %d\n", node + 8, node->data);
//	printf("begin lst + 8 %p   data %d\n", &(node[0]), node->data);

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
	ft_list_push_front(&node, (void*)-800);
	ft_list_push_front(&node, (void*)302);
	ft_list_push_front(&node, (void*)5);
	ft_list_push_front(&node, (void*)0);
	printf("last head  %p\n", node);
//	printf("%d\n", *((int *)node->data));
//	printf("%d\n", *((int *)node->next->data));
//	printf("%d\n", *((int *)node->next->next->data));
//	printf("%p\n", node->data);
//	printf("%p\n", node->next->data);
//	printf("%p\n", node->next->next->data);
//	printf("%p\n", node->next->next->next->data);


	printf("size %d\n", ft_list_size(node));

	printf("\n");
	printf("sort list\n");
	print_list(node);
	ft_list_sort(&node, &cmp_lower);
	print_list(node);
	printf("\n");

	printf("node bf clean  %p\n", node);
	list_clean(&node);
	printf("node aft clean %p\n", node);

//	while (1)
//		;


	return (0);
}
