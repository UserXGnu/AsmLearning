#include "filename_analyser.h"

size_t
strlen (const char * str) {
    asm ("xor   %rcx, %rcx\r\n"\
         ".Lstrlen_loop:\r\n"\
            "cmpb  $0x00, (%rdi, %rcx, 1)\r\n"\
            "jz    .Lstrlen_loop_end\r\n"\
            "inc   %rcx\r\n"\
            "jmp   .Lstrlen_loop\r\n"\
            ".Lstrlen_loop_end:\r\n"\
                "mov    %rcx, %rax\r\n");
}

char *
strcpy (char * dst, const char * src) {
    asm ("xor   %rcx, %rcx\r\n"\
         "xor   %rdx, %rdx\r\n"\
            ".Loop_strcpy:\r\n"\
                "cmpb   $0x00, (%rsi, %rcx, 1)\r\n"\
                "jz     .Loop_strcpy_end\r\n"\
                "movb   (%rsi, %rcx, 1), %dl\r\n"\
                "movb   %dl, (%rdi, %rcx, 1)\r\n"\
                "inc    %rcx\r\n"\
                "jmp    .Loop_strcpy\r\n"\
            ".Loop_strcpy_end:\r\n"\
                "movb   $0x00, (%rdi, %rcx, 1)\r\n"\
                "mov    %rdi, %rax\r\n");
}

int
strcmp (const char * s1, const char * s2) {
    asm ("xor   %rcx, %rcx\r\n"\
         ".Loop_strcmp:\r\n"\
            "cmpb 	$0x00, (%rdi, %rcx, 1)\r\n"\
		    "je 	.Loop_strcmp_end\r\n"\
 		    "movb 	(%rdi, %rcx, 1), %al\r\n"\
		    "movb	(%rsi, %rcx, 1), %dl\r\n"
		    "cmpb 	%al, %dl\r\n"\
		    "jg 	.Lgreater\r\n"\
		    "jl 	.Lesser\r\n"\
		    "inc 	%rcx\r\n"\
		    "cmpb  	$0x00, (%rsi, %rcx, 1)\r\n"\
		    "je 	.Loop_strcmp_end\r\n"\
		    "jmp 	.Loop_strcmp\r\n"\
        ".Loop_strcmp_end:\r\n"\
	 	    "mov 	$0x00, %rax\r\n"\
		    "jmp 	.Lstrcmp_end\r\n"\
	    ".Lgreater:\r\n"\
	 	    "mov 	$0x01, %rax\r\n"\
		    "jmp 	.Lstrcmp_end \r\n"\

	    ".Lesser:\r\n"\
	 	    "mov 	$-0x01, %rax\r\n"\
		    "jmp 	.Lstrcmp_end\r\n"\
        ".Lstrcmp_end:\r\n");
}

int
get_size (const char * fpath, const struct stat * sb, int typeflag) {
    new_size += sb->st_size;
    return 0;
}

bool
check_size (const char * dirpath, unsigned long int * current_size) {
    volatile int times;
    volatile bool flag;
    volatile bool flag_test;

       
    if ((ftw (dirpath, &get_size, 1))) {
        perror ("in ftw()");
        exit(EXIT_FAILURE);
    }

    if (!flag_test) {
        * current_size = new_size;
        flag = false;
        flag_test = true;

    }

    if (flag == true) {
        times ++;
        if (* current_size < new_size) {
            flag = false;
            times = 0;
        }
    }

    if (* current_size < new_size) {

        if (times == 0) { flag = true; }

        printf("\e[H\e[2J"); 
        printf ("%lu MB - %lu MB\n", * current_size/1048576, new_size/1048576);
    }

    * current_size = new_size;

    new_size = 0;
    if (times == 512) {
        return true;
    }

    return false;
}

static void 
strstrip (char * stripped, const char * new_filename) {
    int j = 0;
    for (int i = 0; i < strlen (new_filename); i++) {
        if (j > 0) {
            if (new_filename [i] == 0x5f) {
                if (stripped [j-1] != 0x5f) {
                    stripped [j] = new_filename [i];
                    j++;
                }
            } else {
                stripped [j] = new_filename [i];
                j++;
            }
        } else { 
            stripped[j] = new_filename [i];
            j++;
        }

    }
    stripped [j] = 0x00;
}

static char *
fix_name (const char * filename) {
    char * stripped = NEW (strlen(filename));
    char new_filename [strlen(filename)];

    strcpy (new_filename, filename);
    
    int i = 0;
    for (i = 0; i < strlen (filename); i++) {
        if ( ( (filename [i] > 0x60)  && (filename [i] < 0x7b) ) || (filename [i] == 0x2e) || ((filename [i] > 47) && filename [i] < 58))  { continue; }
        else {
            if ( (filename [i] > 0x40) && (filename [i] < 0x5a) ) { 
                new_filename [i] = filename [i] + 32; 
                continue;  
            } else {
                new_filename [i] = 0x5f; 
            }
        }
    }
    strstrip (stripped, new_filename);
    return stripped;
}

void
read_filenames (const char * dirpath) { 
    volatile int subdirs;
    char w_dir [512] = {0};
    char * filename = 0;
    DIR * d;
    struct dirent * dir;
    d = opendir(dirpath);
    getcwd(w_dir, 512);
    if (chdir (dirpath) == -1) {
        perror ("on chdir()");
    }
    while ((dir = readdir(d)) != NULL) {
        filename = fix_name(dir->d_name);
        if (strcmp (filename, "..") || strcmp (filename, ".")) { printf ("%s - %s\n", dir->d_name, filename); }
        rename (dir->d_name, filename);
        free (filename);
    }
    closedir (d);
    chdir (w_dir);

}


