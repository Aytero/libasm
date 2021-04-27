/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   libasm.h                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: lpeggy <marvin@42.fr>                      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/04/16 19:44:16 by lpeggy            #+#    #+#             */
/*   Updated: 2021/04/21 19:18:35 by lpeggy           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef LIBASM_H
# define LIBASM_H
# include <stdlib.h>

typedef struct s_list
{

	void			*data;
	struct s_list	*next;
}					t_list;

size_t	ft_strlen(char *str);
char	*ft_strcpy(char *dst, char *src);
int		ft_strcmp(const char *s1, const char *s2);
ssize_t	ft_write(int fd, void *str, size_t nbyte);
ssize_t	ft_read(int fd, void *buf, size_t nbyte);
char	*ft_strdup(char *s1);

int		ft_atoi_base(char *str, char *base);
void	ft_list_push_front(t_list **begin_list, void *data);
int		ft_list_size(t_list *begin_list);
void	ft_list_sort(t_list **begin_list, int (*cmp)());

#endif
