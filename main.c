#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/syscall.h>
#include <sys/errno.h>
#include "libasm.h"

size_t	ft_strlen(char *str);

int		main(int argc, char **argv)
{
	(void)argc;

	char	*str = "lelala";
	char	str2[7];
	char	str3[7] = "kokoko";
	char	*str4 = NULL;
	char	*str5 = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque lacinia turpis ut tellus eleifend ultrices. Suspendisse felis leo, interdum non odio eu, consequat fringilla massa. Fusce libero felis, pellentesque ut fermentum eu, pellentesque ac ipsum. Nullam massa dolor, pellentesque in ultricies eget, euismod vitae turpis. Curabitur nec euismod ipsum, non imperdiet diam. Donec eget orci diam. Vestibulum non cursus est. Praesent imperdiet lorem turpis. Fusce dignissim, nisl eu imperdiet cursus, arcu tortor pretium justo, sed tempor sem eros vitae neque. Duis convallis odio sed ante consequat, a eleifend odio vulputate. Nunc sed enim at tellus faucibus ultricies eget id nulla. Phasellus suscipit maximus neque, nec maximus urna rutrum eget. Sed pharetra sem in massa rutrum rutrum. Mauris non blandit metus. Curabitur eget finibus mi, vel posuere justo. Phasellus eget sem ut enim ornare vestibulum. Mauris ullamcorper ornare interdum. Aenean a imperdiet mi. Praesent malesuada tristique lacus, sit amet justo.";
	char	*str6;
	char	*str7;
	int		fd;
	int		reader = 0;
	char	buf[32];
	char	buf1[32];

	str6 = malloc(4);
	str6 = "rir";
	str7 = malloc(7);
	str7 = "riroko";

	printf("strlen    |%lu|\n", strlen(str));
	printf("ft_strlen |%zu|\n", ft_strlen(str));
	printf("strlen    |%lu|\n", strlen(str5));
	printf("ft_strlen |%zu|\n", ft_strlen(str5));
	printf("\n");

	printf("strcpy    |%s|\n", strcpy(str2, ""));
	printf("ft_strcpy |%s|\n", ft_strcpy(str2, ""));
	printf("strcpy    |%s|\n", strcpy(str2, "123"));
	printf("ft_strcpy |%s|\n", ft_strcpy(str2, "123"));
	printf("\n");

	printf("strcmp    |%d|\n", strcmp(str6, str7));
	printf("ft_strcmp |%d|\n", ft_strcmp(str6, str7));
	printf("\n");

	printf("write     |%zd|\n", write(1, NULL, 6));
	printf("%s\n", strerror(errno));
	printf("ft_write  |%zd|\n", ft_write(1, NULL, 6));
	printf("%s\n", strerror(errno));
	printf("write     |%zd|\n", write(-1, "Hello\n", 6));
	printf("%s\n", strerror(errno));
	printf("ft_write  |%zd|\n", ft_write(-1, "Hello\n", 6));
	printf("%s\n", strerror(errno));
	printf("write     |%zd|\n", write(1, "Hello\n", 6));
	printf("ft_write  |%zd|\n", ft_write(1, "Hello\n", 6));

	printf("\n");
	printf("READ\n");
	if (!(reader = ft_read(0, buf1, 16)))
		return (-1);
	printf("bytes read %d\n", reader);
	printf("buf |%s|\n", buf1);
	if (!(fd = open(argv[1], O_RDONLY)))
		return (-1);
	if (!(reader = ft_read(fd, buf, 16)))
		return (-1);
	printf("bytes read %d\n", reader);
	printf("buf |%s|\n", buf);
	if (!(reader = ft_read(-1, buf, 16)))
		return (-1);
	printf("%s\n", strerror(errno));
	close(fd);
	printf("\n");

	printf("strdup     |%s|\n", strdup(str6));
	str4 = ft_strdup(str6);
	printf("ft_strdup  |%s|\n", str4);
	printf("ft_strdup  |%s|\n", ft_strdup(str6));
	printf("strdup     |%s|\n", strdup(""));
	printf("ft_strdup  |%s|\n", ft_strdup(""));


//	t_list	*elem;
//	int		d = 8;
//	ft_list_push_front(&elem, &d);
//	printf("%p\n", elem->data);

	return (0);
}
