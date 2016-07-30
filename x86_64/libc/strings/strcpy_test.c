#include <stdio.h>

extern char * strcpy (char *, char *);

int
main (void) {
    char src[32] = "Hacking";
    char dst[32];

    strcpy (dst, src);

    printf ("%s\n", dst);

    return 0;
}
