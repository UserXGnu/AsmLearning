#include <stdio.h>

extern char* strncpy(char *, const char *, size_t);

int
main (void) {
    char str[6] = "Victor";
    char str1[6] = {0};

    strncpy(str1, str, 6);

    printf ("%s\n", str1);

    return 0;
}
