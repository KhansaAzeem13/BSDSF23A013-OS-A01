#include <stdio.h>
#include "mystrfunctions.h"
#include "myfilefunctions.h"

int main() {
    // Test string functions
    char s1[100] = "Hello";
    char s2[100];
    printf("Length of '%s' = %d\n", s1, mystrlen(s1));
    mystrcpy(s2, s1);
    printf("Copy: %s\n", s2);
    mystrcat(s2, " World");
    printf("Concat: %s\n", s2);

    // Test file functions
    FILE* f = fopen("tests/sample.txt", "r");
    int lines, words, chars;
    if (wordCount(f, &lines, &words, &chars) == 0) {
        printf("Lines=%d Words=%d Chars=%d\n", lines, words, chars);
    }
    fclose(f);

    f = fopen("tests/sample.txt", "r");
    char** matches;
    int count = mygrep(f, "test", &matches);
    printf("Found %d matches for 'test'\n", count);
    for (int i = 0; i < count; i++) {
        printf("Match: %s", matches[i]);
        free(matches[i]);
    }
    free(matches);
    fclose(f);

    return 0;
}
