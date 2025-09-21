#ifndef MYFILEFUNCTIONS_H
#define MYFILEFUNCTIONS_H

#include <stdio.h>

// Count lines, words, and characters in a file
int wordCount(FILE* file, int* lines, int* words, int* chars);

// Search lines containing search_str in a file, and fill matches array
int mygrep(FILE* fp, const char* search_str, char*** matches);

#endif
