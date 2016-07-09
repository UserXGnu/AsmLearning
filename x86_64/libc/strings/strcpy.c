#include <stdio.h>

extern char * nstrcpy (char *, char *);

int
main (void) {
    char src[32] = "Hacking";
    char dst[32];

    nstrcpy (dst, src);

    printf ("%s\n", dst);

    return 0;
}
