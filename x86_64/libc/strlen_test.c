/*
 * @Note: To compile this:
 *
 * as strlen.s -o strlen.o
 * gcc strlen_test.c -c
 * gcc strlen.o strlen_test.o -o strlen_test
 *
 */
#include <stdio.h>

#define  HELLO          "HELLO WORLD"

extern int strlen(char *);

int
main (void) {
    int x = strlen (HELLO);

    printf ("%d\n", x);

    return 0;
}


