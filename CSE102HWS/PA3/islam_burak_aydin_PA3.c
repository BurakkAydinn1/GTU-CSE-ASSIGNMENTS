#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

#define MAX_POLY_LEN 1000
#define MAX_VALUES 200
#define OUTPUT_FILE "evaluations.txt"


double evaluate_monomial(const char *monomial, double x, double y) {
    int sign = 1;
    double coefficient = 1.0;
    int x_pow = 0, y_pow = 0;
    const char *ptr = monomial;

    // Determine the sign of the coefficient
    if (*ptr == '-') {
        sign = -1;
        ptr++;
    } else if (*ptr == '+') {
        sign = 1;
        ptr++;
    }

    // Extract the coefficient if present
    if (sscanf(ptr, "%lf", &coefficient) == 1) {
        // Adjust the pointer to skip over the coefficient
        while (*ptr && (*ptr == '.' || (*ptr >= '0' && *ptr <= '9'))) {
            ptr++;
        }
    }

    coefficient *= sign;

    // Parse powers of x and y
    while (*ptr) {
        if (*ptr == 'x') {
            ptr++;
            if (*ptr == '^') {
                ptr++;
                sscanf(ptr, "%d", &x_pow);
                while (*ptr >= '0' && *ptr <= '9') ptr++; // Move pointer past the power
            } else {
                x_pow = 1;
            }
        } else if (*ptr == 'y') {
            ptr++;
            if (*ptr == '^') {
                ptr++;
                sscanf(ptr, "%d", &y_pow);
                while (*ptr >= '0' && *ptr <= '9') ptr++;
            } else {
                y_pow = 1;
            }
        } else {
            ptr++;
        }
    }

    // Calculate monomial result
    return coefficient * pow(x, x_pow) * pow(y, y_pow);
}

double parseMonomialsAndEvaluate(const char* expression, double x, double y) {
    int start = 0;  // Starting index of the monomial
    int len = strlen(expression);
    double result = 0;

    while (start < len) {
        // Skip whitespace characters
        while (start < len && expression[start] == ' ') {
            start++;
        }

        // Detect the sign (+ or -) at the beginning of the monomial
        if (expression[start] == '+' || expression[start] == '-') {
            int end = start + 1;

            // Move 'end' until the next sign (+ or -) or end of string
            while (end < len && expression[end] != '+' && expression[end] != '-') {
                end++;
            }

            // Create a temporary buffer for the current monomial
            int monomialLen = end - start;
            char monomial[monomialLen + 1];
            strncpy(monomial, expression + start, monomialLen);
            monomial[monomialLen] = '\0';  // Null-terminate the string

            // Evaluate the monomial
            result += evaluate_monomial(monomial, x, y);

            // Move to the start of the next monomial
            start = end;
        } else {
            // If no sign found, increment start
            start++;
        }
    }
    return result;
}

// Function to evaluate a polynomial for given x and y values
double evaluate_polynomial(const char *polynomial, double x, double y) {
    double result = 0.0;
    char term[MAX_POLY_LEN];
    const char *ptr = polynomial;
    int offset = 0;

    // Assume the first term is positive if it doesn't start with + or -
    if (*ptr != '+' && *ptr != '-') {
        sprintf(term, "+%s", ptr);
    } else {
        strcpy(term, ptr);
    }

    result += parseMonomialsAndEvaluate(term, x, y);
    return result;
}

int main() {
    FILE *valuesFile = fopen("values.txt", "r");
    FILE *polynomialsFile = fopen("polynomials.txt", "r");
    FILE *outputFile = fopen(OUTPUT_FILE, "w");

    if (!valuesFile || !polynomialsFile || !outputFile) {
        printf("Error opening files.\n");
        return 1;
    }

    double values[MAX_VALUES][2];
    int valueCount = 0;

    // Read values from values.txt
    while (fscanf(valuesFile, "%lf %lf", &values[valueCount][0], &values[valueCount][1]) == 2) {
        valueCount++;
    }

    char polynomial[MAX_POLY_LEN];
    // Process each polynomial line-by-line
    while (fgets(polynomial, MAX_POLY_LEN, polynomialsFile)) {
        for (int i = 0; i < valueCount; i++) {
            double x = values[i][0];
            double y = values[i][1];
            double eval = evaluate_polynomial(polynomial, x, y);
            fprintf(outputFile, "%.2f ", eval);
        }
        fprintf(outputFile, "\n");
    }

    fclose(valuesFile);
    fclose(polynomialsFile);
    fclose(outputFile);

    printf("Evaluation complete. Results stored in %s.\n", OUTPUT_FILE);
    return 0;
}
