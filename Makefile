# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lpeggy <marvin@42.fr>                      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/16 19:44:21 by lpeggy            #+#    #+#              #
#    Updated: 2021/04/20 21:28:21 by lpeggy           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libasm.a

HEADER = libasm.h

SRCS = ft_strlen.s ft_strcpy.s ft_strcmp.s ft_write.s ft_read.s ft_strdup.s

SRCS_BONUS = ft_atoi_base.s ft_list_push_front.s ft_list_size.s\
			 ft_list_sort.s

#SRCS_DIR = ./srcs
#OBJS_DIR = ./objs

FLAGS = -fmacho64

OBJS = $(SRCS:.s=.o)

OBJS_BONUS = $(SRCS_BONUS:.s=.o)

all: $(NAME)

%.o: %.s $(HEADER)
	nasm $(FLAGS) $<

$(NAME): $(OBJS)
	ar rcs $(NAME) $(OBJS)

bonus: $(OBJS) $(OBJS_BONUS)
	ar rcs $(NAME) $(OBJS) $(OBJS_BONUS)

#$(OBJS_DIR):
#	@mkdir -p $(OBJS_DIR)

clean:
	rm -f $(OBJS)
	rm -f $(OBJS_BONUS)
#	rm -rf $(OBJS_DIR)
	rm -f libasm.h.gch

fclean: clean
	rm -f $(NAME)

re: fclean all

.PHONY: all clean fclean re
