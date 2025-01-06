#include <stdio.h>
#include <stdlib.h>

void convert_to_ppm(const char *input_file, const char *output_file) {
    FILE *input = fopen(input_file, "r");
    if (!input) {
        perror("Error opening input file");
        exit(EXIT_FAILURE);
    }

    FILE *output = fopen(output_file, "w");
    if (!output) {
        perror("Error opening output file");
        fclose(input);
        exit(EXIT_FAILURE);
    }

    int rows, cols;
    fscanf(input, "%d %d", &rows, &cols);

    // Write PPM header
    fprintf(output, "P3\n%d %d\n255\n", cols, rows);

    // Read grid data and write PPM pixel data
    for (int i = 0; i < rows; i++) {
        for (int j = 0; j < cols; j++) {
            int value;
            fscanf(input, "%d", &value);
            if (value == 1) {
                fprintf(output, "255 255 255 "); // White
            } else {
                fprintf(output, "0 0 0 ");       // Black
            }
        }
        fprintf(output, "\n"); // New line after each row
    }

    fclose(input);
    fclose(output);
    printf("Conversion to PPM completed.\n");
}

int main() {
    const char *input_file = "input_2.txt";
    const char *output_file = "input_2.ppm";
    convert_to_ppm(input_file, output_file);
    return 0;
}
