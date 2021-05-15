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

//	printf("HUH\n");
	printf("\n");


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

	printf("ft_atoi_base\n");
	printf("\n");
	printf("decimal\n");
	printf("%10d == 0\n", ft_atoi_base("0", "0123456789"));
	printf("%10d == 1\n", ft_atoi_base("+1", "0123456789"));
	printf("%10d == -1\n", ft_atoi_base("-1", "0123456789"));
	printf("%10d == 9\n", ft_atoi_base("9", "0123456789"));
	printf("%10d == 15\n", ft_atoi_base("15lkkgk", "0123456789"));
	printf("%10d == -258\n", ft_atoi_base("---258", "0123456789"));
	printf("%10d == -8\n", ft_atoi_base("++-+8", "0123456789"));
	printf("%10d == 893047891\n", ft_atoi_base("893047891", "0123456789"));
//	printf("%10d == 9893047891\n", ft_atoi_base("9893047891", "0123456789"));
	printf("\n");


	printf("binary\n");
//	printf("atoi %d == 1\n", ft_atoi_base("+-+-1l", "012345"));
	printf("%10d == 0\n", ft_atoi_base("0", "01"));
	printf("%10d == 1\n", ft_atoi_base("1", "01"));
	printf("%10d == -1\n", ft_atoi_base("-1", "01"));
	printf("%10d == 2\n", ft_atoi_base("10", "01"));
	printf("%10d == 5\n", ft_atoi_base("101", "01"));
	printf("%10d == 10\n", ft_atoi_base("1010", "01"));
	printf("%10d == -41\n", ft_atoi_base("---101001", "01"));
	printf("\n");

	printf("hex\n");
	printf("%10d == 0\n", ft_atoi_base("0", "0123456789ABCDEF"));
	printf("%10d == 56\n", ft_atoi_base("38", "0123456789ABCDEF"));
	printf("%10d == 15\n", ft_atoi_base("F", "0123456789ABCDEF"));
	printf("%10d == 22\n", ft_atoi_base("16", "0123456789ABCDEF"));
	printf("%10d == 255\n", ft_atoi_base("FFk", "0123456789ABCDEF"));
	printf("%10d == -1\n", ft_atoi_base("-1kFFk", "0123456789ABCDEF"));
	printf("\n");

	printf("errors\n");
	printf("%10d == 0 ('L5')\n", ft_atoi_base("L5", "0123456789"));
	printf("%10d == 0 (base '')\n", ft_atoi_base("11", ""));
	printf("%10d == 0 (base '01 ')\n", ft_atoi_base("11", "01 "));
	printf("%10d == 0 (base ' 1')\n", ft_atoi_base("11", " 1"));
	printf("%10d == 0 (base '-01')\n", ft_atoi_base("11", "-01"));
	printf("%10d == 0 (base '01+')\n", ft_atoi_base("11", "01+"));
	printf("%10d == 0 (base '\\n01')\n", ft_atoi_base("11", "\n01"));
	printf("%10d == 0 (base '011')\n", ft_atoi_base("11", "011"));
	printf("%10d == 0 (base '01234567890')\n", ft_atoi_base("11", "01234567890"));
	printf("%10d == 0 (str '8', base '01')\n", ft_atoi_base("8", "01"));

	return (0);
}
