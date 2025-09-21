#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "myfilefunctions.h"

int wordCount(FILE* file, int* lines, int* words, int* chars) {
    if (!file) return -1;
    char c;
    *lines = *words = *chars = 0;
    int in_word = 0;

    while ((c = fgetc(file)) != EOF) {
        (*chars)++;
        if (c == '\n') (*lines)++;
        if (c == ' ' || c == '\n' || c == '\t') {
            in_word = 0;
        } else if (!in_word) {
            in_word = 1;
            (*words)++;
        }
    }
    return 0;
}

int mygrep(FILE* fp, const char* search_str, char*** matches) {
    if (!fp || !search_str) return -1;

    size_t size = 0, capacity = 10;
    char** results = malloc(capacity * sizeof(char*));
    char line[1024];

    while (fgets(line, sizeof(line), fp)) {
        if (strstr(line, search_str)) {
            if (size >= capacity) {
                capacity *= 2;
                results = realloc(results, capacity * sizeof(char*));
            }
            results[size] = strdup(line);
            size++;
        }
    }
    *matches = results;
    return size;
}
