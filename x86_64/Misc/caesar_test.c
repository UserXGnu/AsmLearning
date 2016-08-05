#include <stdio.h>

extern void encrypt(char * str, int key);

int 
main (void) {
    char str[32] = {0};

    printf ("Message: ");
    fgets (str, sizeof(str), stdin);

    encrypt(str, 1);

    printf ("Str: %s\n", str);

    return 0;
}
