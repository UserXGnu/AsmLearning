#include <stdio.h>

extern int strcmp(const char *, const char *);


int 
main (void) {
    char name_1[6] = "use";
    char name_2[6] = "use";


    if (!strcmp (name_1, name_2)) { printf ("Equal!\n"); }
    else { printf ("Not equal !\n"); }

    return 0;
}
