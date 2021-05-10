#include "libasm_bonus.h"
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/syscall.h>
#include <sys/errno.h>
//#include <signal.h>

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

void	print_list_str(t_list *head)
{
	t_list	*tmp;

	tmp = head;
	while (tmp)
	{
		printf("%s  ", tmp->data);
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

void	free_func(void *s)
{
	//*(int*)s = 2;
	//*((int*)s) = 0;
	*(char*)s = '-';
}

int		cmp_equal(void *a, void *b)
{
	return (*(char*)a - *(char*)b);
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

	ft_list_push_front(&node, (void*)0);
//	printf("data zero %d\n", &node->data);
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
	ft_list_push_front(&node, (void*)0);
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
//	printf("data zero %d\n", node->next->next->data);

	printf("node bf clean  %p\n", node);
	list_clean(&node);
	printf("node aft clean %p\n", node);

	node = NULL;
	int		i;
	char	str[50] = {0};
	char	ref = 0;

	i = -1;
	while (++i < 10)
		str[i] = i + '0';
	i = 10;
	while (--i >= 0)
		ft_list_push_front(&node, str + i);
	ref = '9';
	print_list_str(node);
	ft_list_remove_if(&node, &ref, &cmp_equal, &free_func);
	print_list_str(node);

	printf("HUH\n");


//	int		ref = 4;
//	i = 10;
//	while (--i > 0)
//		ft_list_push_front(&node, (void*)i);
//	print_list(node);
//	if (cmp_lower(ref, node->data))
//		free_func(&node->data);
//	if (cmp_lower(ref, node->next->next->data))
//		free_func(&node->next->next->data);
//	if (cmp_lower(ref, node->next->next->next->next->data))
//		free_func(&node->next->next->next->next->data);
//	print_list(node);
//	ft_list_remove_if(&node, &ref, &cmp_lower, &free_func);
//	print_list(node);

//	while (1)
//		;

	char	*atoi_str = " +-+--815al";
	char	*base;// = "10";

	base = malloc(sizeof(char) * 3);
	base[0] = 'a';
	base[1] = 'b';
	base[2] = '\0';

	printf("atoi %d\n", ft_atoi_base(atoi_str, base));

	return (0);
}
