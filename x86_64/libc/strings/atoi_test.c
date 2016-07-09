#include <stdio.h>

extern int atoi(char *);

int 
main (void) {
    char num[10] = "128";

    printf ("%d\n", atoi(num));
    
    return 0;
}
