#include <stdio.h>


extern  char * strcat(char *, char *);

int
main(void) {
    char src[6] = "flores";
    char dst[12] = "victor";

    strcat (dst, src);

    printf ("%s\n", dst);

    return 0;
}
