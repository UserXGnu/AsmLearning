#include "filename_analyser.h"

int 
main (int argc, char ** argv) {
    if (argc < 2) {
        fprintf (stderr, "Usage: %s <dir path>\n", argv[0]);
        exit(1);
    }

    unsigned long int current = 0;
    for (;;) { 
        if (check_size (argv[1], &current) == true) {
            read_filenames (argv[1]);
            
        }
    }

    return 0;
}


