#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "libasm.h"

size_t	ft_strlen(char *str);

int		main()
{
	char	*str = "lelala";
	char	str2[7];
	char	str3[7] = "kokoko";
	char	*str4 = NULL;
	char	*str5 = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque lacinia turpis ut tellus eleifend ultrices. Suspendisse felis leo, interdum non odio eu, consequat fringilla massa. Fusce libero felis, pellentesque ut fermentum eu, pellentesque ac ipsum. Nullam massa dolor, pellentesque in ultricies eget, euismod vitae turpis. Curabitur nec euismod ipsum, non imperdiet diam. Donec eget orci diam. Vestibulum non cursus est. Praesent imperdiet lorem turpis. Fusce dignissim, nisl eu imperdiet cursus, arcu tortor pretium justo, sed tempor sem eros vitae neque. Duis convallis odio sed ante consequat, a eleifend odio vulputate. Nunc sed enim at tellus faucibus ultricies eget id nulla. Phasellus suscipit maximus neque, nec maximus urna rutrum eget. Sed pharetra sem in massa rutrum rutrum. Mauris non blandit metus. Curabitur eget finibus mi, vel posuere justo. Phasellus eget sem ut enim ornare vestibulum. Mauris ullamcorper ornare interdum. Aenean a imperdiet mi. Praesent malesuada tristique lacus, sit amet justo.";
	char	*str6;
	char	*str7;

	str6 = malloc(4);
	str6 = "rir";
	str7 = malloc(7);
	str7 = "riroko";

	printf("%lu\n", strlen(str));
	printf("%zu\n", ft_strlen(str));
	printf("%lu\n", strlen(str5));
	printf("%zu\n", ft_strlen(str5));

	printf("%s\n", strcpy(str2, str));
	printf("%s\n", ft_strcpy(str2, str));

	printf("%d\n", strcmp(str6, str7));
	printf("%d\n", ft_strcmp(str6, str7));
	return (0);
}
