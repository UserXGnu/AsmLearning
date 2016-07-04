#include <stdio.h>

#define  HELLO          "HELLO WORLD"

extern int strlen(char *);

int
main (void) {
    int x = strlen (HELLO);

    printf ("%d\n", x);

    return 0;
}


