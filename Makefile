NAME := libft.a
HEADERFILES := libft.h
OBJFILES := obj/ft_atoi.o obj/ft_bzero.o obj/ft_calloc.o obj/ft_isalnum.o obj/ft_isalpha.o obj/ft_isascii.o \
obj/ft_isdigit.o obj/ft_isprint.o obj/ft_memchr.o obj/ft_memcmp.o obj/ft_memcpy.o obj/ft_memmove.o \
obj/ft_memset.o obj/ft_strchr.o obj/ft_strdup.o obj/ft_strlcat.o obj/ft_strlcpy.o obj/ft_strncmp.o \
obj/ft_strlen.o obj/ft_strnstr.o obj/ft_strrchr.o obj/ft_tolower.o obj/ft_toupper.o obj/ft_substr.o \
obj/ft_strjoin.o obj/ft_strtrim.o obj/ft_split.o obj/ft_itoa.o obj/ft_strmapi.o obj/ft_striteri.o \
obj/ft_putchar_fd.o obj/ft_putstr_fd.o obj/ft_putendl_fd.o obj/ft_putnbr_fd.o
OBJFILES_BONUS := obj_bonus/ft_lstnew_bonus.o obj_bonus/ft_lstadd_front_bonus.o obj_bonus/ft_lstsize_bonus.o \
obj_bonus/ft_lstlast_bonus.o obj_bonus/ft_lstadd_back_bonus.o obj_bonus/ft_lstdelone_bonus.o obj_bonus/ft_lstclear_bonus.o \
obj_bonus/ft_lstiter_bonus.o obj_bonus/ft_lstmap_bonus.o
OBJFILES_EXTRA:= obj/ft_isspace.o
CFLAGS := -Wall -Wextra -Werror

all : $(NAME)

$(NAME): $(OBJFILES) $(OBJFILES_EXTRA)

obj/%.o: %.c $(HEADERFILES)
	@mkdir -p $(dir $@)
	$(CC) -c $(CFLAGS) -o $@ $< -I $(HEADERFILES)
	ar -rsc  $(NAME) $@

bonus: $(OBJFILES_BONUS) $(NAME)

obj_bonus/%.o: %.c $(HEADERFILES)
	@mkdir -p $(dir $@)
	$(CC) -c $(CFLAGS) -o $@ $< -I $(HEADERFILES)
	ar -rsc  $(NAME) $@

clean:
	rm -f $(OBJFILES) $(OBJFILES_BONUS)
	rm -rf obj_bonus/ obj/
	

fclean:	clean
	rm -f $(NAME)

re: fclean all

.PHONY: clean all fclean re bonus
