# libasm
The following functions in x86-64 Intel syntax assembly (NASM):

```C
int		ft_strlen(char const *str);
char		*ft_strcpy(char *dst, char const *src);
int		ft_strcmp(char const *s1, char const *s2);
ssize_t		ft_write(int fd, void *str, size_t nbyte);
ssize_t		ft_read(int fd, void *buf, size_t nbyte);
char		*ft_strdup(char *s1);
```

And bonus functions:
```C
typedef struct s_list
{
	void		*data;
	struct s_list	*next;
}			t_list;

int		ft_atoi_base(char *str, char *base);
void		ft_list_push_front(t_list **begin_list, void *data);
int		ft_list_size(t_list *begin_list);
void		ft_list_sort(t_list **begin_list, int (*cmp)());
void		ft_list_remove_if(t_list **begin_list, void *data_ref, int (*cmp)(),
			void (*free_fct)(void *));
```
