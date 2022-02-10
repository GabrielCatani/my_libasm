NAME=libasm.a
ASM_COMP=nasm
MACOS_FLAG=-f macho64
LINUX_FLAG=-f elf64
ASM_SRC:=$(wildcard *.S)
ASM_OBJS:=$(ASM_SRC:.S=.o)


all: $(NAME)

$(NAME): $(ASM_OBJS)
	ar rc $(NAME) $(ASM_OBJS)
	ranlib $(NAME)

.S.o:
	$(ASM_COMP) $(LINUX_FLAG) -o $@ $<

clean:
	/bin/rm -rf *.o

fclean: clean
	/bin/rm -rf $(NAME)

re: clean fclean $(NAME)
