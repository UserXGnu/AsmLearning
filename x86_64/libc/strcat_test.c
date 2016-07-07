#include <stdio.h>


extern  char * nstrcat(char *, char *);

int
main(void) {
    char src[6] = "flores";
    char dst[12] = "victor";

    nstrcat (dst, src);

    printf ("%s\n", dst);

    return 0;
}
