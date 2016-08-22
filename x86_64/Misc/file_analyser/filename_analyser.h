#ifndef _dirsize_H_
#define _dirsize_H_ 

#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <unistd.h>

#include <errno.h>

#include <sys/stat.h>
#include <sys/types.h>
#include <dirent.h>
#include <ftw.h>

#define NEW(size)       ((char *) (calloc(size, sizeof(char))))

#ifdef IN_LINE_ASM
    static unsigned long int __attribute__((used)) new_size;
#else
    static unsigned long int new_size;
#endif /* IN_LINE_ASM */

int get_size (const char * fpath, const struct stat * sb, int typeflag);
bool check_size (const char * dirpath, unsigned long int * current_size);
void read_filenames (const char * dirpath);


#endif /* ifndef _dirsize_H_ */ 
