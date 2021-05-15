# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lpeggy <marvin@42.fr>                      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/16 19:44:21 by lpeggy            #+#    #+#              #
#    Updated: 2021/05/15 19:20:21 by lpeggy           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libasm.a

HEADER = ./inc/libasm.h

HEADER_BONUS = ./inc/libasm_bonus.h

SRCS = ft_strlen.s ft_strcpy.s ft_strcmp.s ft_write.s ft_read.s ft_strdup.s

SRCS_BONUS = ft_atoi_base_bonus.s ft_list_push_front_bonus.s\
			 ft_list_size_bonus.s ft_list_sort_bonus.s\
			 ft_list_remove_if_bonus.s

SRCS_DIR = ./srcs
OBJS_DIR = ./objs

FLAGS = -fmacho64 -g

OBJS = $(addprefix $(OBJS_DIR)/,$(SRCS:.s=.o))

OBJS_BONUS = $(addprefix $(OBJS_DIR)/,$(SRCS_BONUS:.s=.o))

all: $(NAME)

$(OBJS_DIR)/%.o: $(SRCS_DIR)/%.s $(HEADER) $(HEADER_BONUS)
	nasm $(FLAGS) $< -o $@

$(NAME): $(OBJS_DIR) $(OBJS)
	ar rcs $(NAME) $(OBJS)

bonus: $(OBJS_DIR) $(OBJS) $(OBJS_BONUS)
	ar rcs $(NAME) $(OBJS) $(OBJS_BONUS)

$(OBJS_DIR):
	@mkdir -p $(OBJS_DIR)

clean:
	rm -f $(OBJS)
	rm -f $(OBJS_BONUS)
	rm -rf $(OBJS_DIR)

fclean: clean
	rm -f $(NAME)

re: fclean all

.PHONY: all bonus clean fclean re
