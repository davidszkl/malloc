# include "malloc.h"
# include "libft.h"

void*  ft_malloc(size_t size) {
    char* ptr = ft_strdup("hello", 4);
    ft_free(ptr, 1);
    (void)size;
    return NULL;
}
