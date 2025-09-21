#include <stdio.h>
#include "mystrfunctions.h"

int mystrlen(const char* s) {
    int len = 0;
    while (s[len] != '\0') len++;
    return len;
}

int mystrcpy(char* dest, const char* src) {
    int i = 0;
    while ((dest[i] = src[i]) != '\0') i++;
    return i; // return number of characters copied
}

int mystrncpy(char* dest, const char* src, int n) {
    int i = 0;
    for (i = 0; i < n && src[i] != '\0'; i++) {
        dest[i] = src[i];
    }
    dest[i] = '\0';
    return i;
}

int mystrcat(char* dest, const char* src) {
    int i = 0, j = 0;
    while (dest[i] != '\0') i++;
    while ((dest[i++] = src[j++]) != '\0');
    return i - 1;
}
