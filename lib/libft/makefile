PROJECT = libft
CC = gcc
FLAGS = -Wall -Wextra -Werror -g3
SRCDIR = src
INCDIR = inc
OBJDIR = obj

SRCS = $(wildcard $(SRCDIR)/*.c)
OBJS = $(patsubst $(SRCDIR)/%.c, $(OBJDIR)/%.o, $(SRCS))

$(OBJDIR)/%.o: $(SRCDIR)/%.c
	$(CC) $(FLAGS) -I$(INCDIR) -c $< -o $@

all: $(OBJS)
	ar rcs $(PROJECT).a $(OBJS)

clean:
	rm -rf $(OBJDIR)/*

fclean: clean
	rm -f $(PROJECT).a

re: fclean all

.PHONY:
	all clean fclean re
