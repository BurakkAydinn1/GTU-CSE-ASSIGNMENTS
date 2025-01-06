#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#define MAX_TERMS 100
#define MAX_IDENTIFIER_LENGTH 30
#define MAX_INPUT_LENGTH 256

typedef struct { // term structure
    int scalar; // scalar for the term
    char module_id[MAX_IDENTIFIER_LENGTH + 1]; // module id for the term
    int is_module;
} Term;

int parse_description(const char *description, Term terms[], int *term_count);
int calculate_module(const char *module_name);
void trim_whitespace(char *str);
int is_digit(char c);
int is_alnum_or_underscore(char c);
int is_space(char c);

int main() {
    char module_name[MAX_IDENTIFIER_LENGTH + 1]; // +1 for null terminator

    printf("Module name?: \n"); // prompt user for module name
    scanf("%s", module_name);

    int result = calculate_module(module_name); // calculate the module
    printf("%d\n", result);

    return 0;
}

int calculate_module(const char *module_name) {
    char description[MAX_INPUT_LENGTH]; // description of the module
    Term terms[MAX_TERMS];
    int term_count = 0;

    printf("Define %s: \n", module_name);
    getchar(); // consume newline
    scanf("%s", description); // get the description of the module
    trim_whitespace(description); // remove leading and trailing whitespaces

    if (!parse_description(description, terms, &term_count)) { // parse the description
        fprintf(stderr, "Error: Invalid description for module '%s'.\n", module_name);
        exit(1);
    }

    int sum = 0;
    for (int i = 0; i < term_count; i++) {
        if (terms[i].is_module) { // if the term is a module
            sum += terms[i].scalar * calculate_module(terms[i].module_id); // recursively calculate the module
        } else {
            sum += terms[i].scalar; // add the scalar to the sum
        }
    }

    return sum;
}

int parse_description(const char *description, Term terms[], int *term_count) { // parse the description
    char temp[MAX_INPUT_LENGTH]; // temporary buffer
    int i = 0, j = 0;
    int length = strlen(description);
    int scalar = 0;

    *term_count = 0;

    while (i < length) { // iterate through the description
        while (i < length && is_space(description[i])) i++; // skip whitespaces

        if (i < length && is_digit(description[i])) { // if the character is a digit
            scalar = 0;
            while (i < length && is_digit(description[i])) {
                scalar = scalar * 10 + (description[i] - '0');
                i++;
            }
        } else {
            return 0;
        }

        if (i < length && description[i] == '*') { // if the character is a *
            i++;
            j = 0;

            while (i < length && is_alnum_or_underscore(description[i])) { // if the character is an alphanumeric character or an underscore
                temp[j++] = description[i++];
            }
            temp[j] = '\0';

            if (j == 0) {
                return 0;
            }

            strcpy(terms[*term_count].module_id, temp); // copy the module id
            terms[*term_count].scalar = scalar;
            terms[*term_count].is_module = 1;
            (*term_count)++;
        } else { // if the character is not a *
            terms[*term_count].scalar = scalar;
            terms[*term_count].is_module = 0;
            (*term_count)++;
        }

        while (i < length && is_space(description[i])) { // skip whitespaces
            i++;
        }

        if (i < length && description[i] == '+') { // if the character is a +
            i++;
        } else if (i < length) {
            return 0;
        }
    }

    return 1;
}

void trim_whitespace(char *str) { // remove leading and trailing whitespaces
    char *end;

    while (is_space(*str)) {
        str++; // skip leading whitespaces
    }
    if (*str == 0) return;

    end = str + strlen(str) - 1;
    while (end > str && is_space(*end)) { // skip trailing whitespaces
        end--;
    }
    *(end + 1) = '\0'; // null terminate the string
}

int is_digit(char c) {
    return c >= '0' && c <= '9';
}

int is_alnum_or_underscore(char c) {
    return (c >= '0' && c <= '9') || (c >= 'A' && c <= 'Z') || (c >= 'a' && c <= 'z') || (c == '_');
}

int is_space(char c) {
    return c == ' ' || c == '\t' || c == '\n' || c == '\r' || c == '\v' || c == '\f';
}
