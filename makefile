PROJECT = ft_malloc
CC = gcc
FLAGS = -Wall -Wextra -Werror -fPIC -g3
SRCDIR = src
INCDIR = inc
OBJDIR = obj
LIBDIR = lib
LIBFTDIR = $(LIBDIR)/libft

SRCS = $(wildcard $(SRCDIR)/*.c)
OBJS = $(patsubst $(SRCDIR)/%.c, $(OBJDIR)/%.o, $(SRCS))
HOSTTYPE_MAKE = $(or $(HOSTTYPE),$(shell uname -m)_$(shell uname -s))

all: libft $(OBJS)
	$(CC) -shared -o $(LIBDIR)/lib$(PROJECT)_$(HOSTTYPE_MAKE).so $(OBJS) -L$(LIBFTDIR) -lft
	ln -s $(LIBDIR)/lib$(PROJECT)_$(HOSTTYPE_MAKE).so lib$(PROJECT).so
	$(CC) $(FLAGS) test.c -I$(INCDIR) -L. -l$(PROJECT) -o $(PROJECT)
	export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:.

libft:
	make -C $(LIBFTDIR)

$(OBJDIR)/%.o: $(SRCDIR)/%.c
	$(CC) $(FLAGS) -I$(INCDIR) -I$(LIBFTDIR)/inc -L$(LIBFTDIR) -lft -c $< -o $@

clean:
	make -C $(LIBFTDIR) clean
	rm -rf $(OBJDIR)/*

fclean: clean
	make -C $(LIBFTDIR) fclean
	rm -f $(PROJECT)
	rm -f *.so

re: fclean all

.PHONY:
	all clean fclean re
