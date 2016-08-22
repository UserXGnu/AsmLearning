File Analyser
---------------
#### Simple directory monitor 

###### Just a simple tool for monitoring a directory for alterations (new files and so on).

If it finds any filename with special characters it will be converted into an underline, otherwise
if it finds any capitalized filename, it will be downcased.

Nothing really special about that. I did it only for fun and to show how asm can be integrated on
the middle of C code.

- ##### To compile it using normal C functions:
```
gcc file_analyser.* -c 
gcc file_analyser.o main.c -o file_analyser
```
- ##### To compile it using inline asm functions:
```
gcc -m64 -O1 -DIN_LINE_ASM filename_analyser.c filename_analyser.h -c`
gcc -DIN_LINE_ASM file_analyser.o main.c -o file_analyser 
```



