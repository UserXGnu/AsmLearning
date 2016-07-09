#include <stdio.h>


extern  char * strncat(char *, char *, size_t);

int
main(void) {
    char src[6] = "flores";
    char dst[12] = "victor";

    strncat (dst, src, 6);

    printf ("%s\n", dst);

    return 0;
}
