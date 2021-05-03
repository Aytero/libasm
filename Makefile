# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lpeggy <marvin@42.fr>                      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/16 19:44:21 by lpeggy            #+#    #+#              #
#    Updated: 2021/05/03 23:39:36 by lpeggy           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libasm.a

HEADER = libasm.h

HEADER_BONUS = libasm_bonus.h

SRCS = ft_strlen.s ft_strcpy.s ft_strcmp.s ft_write.s ft_read.s ft_strdup.s

SRCS_BONUS = ft_atoi_base_bonus.s ft_list_push_front_bonus.s\
			 ft_list_size_bonus.s ft_list_sort_bonus.s\
			 ft_list_remove_if_bonus.s

#SRCS_DIR = ./srcs
#OBJS_DIR = ./objs

FLAGS = -fmacho64

OBJS = $(SRCS:.s=.o)

OBJS_BONUS = $(SRCS_BONUS:.s=.o)

all: $(NAME)

%.o: %.s $(HEADER) $(HEADER_BONUS)
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
#	rm -f libasm.h.gch
#	rm -f libasm_bonus.h.gch

fclean: clean
	rm -f $(NAME)

re: fclean all

.PHONY: all bonus clean fclean re
