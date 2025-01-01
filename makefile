PROJECT = ft_malloc
CC = gcc
FLAGS = -Wall -Wextra -Werror -fPIC -g3
SRCDIR = src
INCDIR = inc
OBJDIR = obj

SRCS := $(wildcard $(SRCDIR)/*.c)
OBJS := $(patsubst $(SRCDIR)/%.c, $(OBJDIR)/%.o, $(SRCS))

$(OBJDIR)/%.o: $(SRCDIR)/%.c
	$(CC) $(FLAGS) -I$(INCDIR) -c $< -o $@

all: $(OBJS)
	$(CC) -shared -o lib$(PROJECT).so $(OBJS)
	$(CC) $(FLAGS) test.c -I$(INCDIR) -L. -l$(PROJECT) -o $(PROJECT)
	export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:.

clean:
	rm -rf $(OBJDIR)/*

fclean: clean
	rm -f $(PROJECT)
	rm -f lib$(PROJECT).so

re: fclean all

.PHONY:
	all clean fclean re
