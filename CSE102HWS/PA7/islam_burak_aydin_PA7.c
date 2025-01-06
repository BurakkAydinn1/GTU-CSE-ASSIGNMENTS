#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

static int dRow[4] = {-1, 1, 0, 0};
static int dCol[4] = {0, 0, -1, 1};

int isPPMFile(const char *filename) // This function checks if the file is a PPM file.
{
    const char *dot = strrchr(filename, '.');// . character finding from searching from right
    if(!dot || dot == filename) return 0;
    if(strcasecmp(dot, ".ppm") == 0) { // strcasecmp is used to compare strings case-insensitively.
        return 1;
    }
    return 0;
}

int readTXT(const char *filename, int ***gridPtr, int *nPtr, int *mPtr) // This function reads the input file and stores the data in a 2D array.
{
    FILE *fp = fopen(filename, "r");
    if(fp == NULL) { // If the file cannot be opened, an error message is printed.
        fprintf(stderr, "Error: Cannot open %s\n", filename);
        return 0;
    }

    int N, M;
    if(fscanf(fp, "%d %d", &N, &M) != 2) { // If the file does not contain two integers, an error message is printed.
        fprintf(stderr, "Error: Invalid format in %s\n", filename);
        fclose(fp);
        return 0;
    }

    int **grid = (int **)malloc(N * sizeof(int *));
    if(!grid) { // If memory allocation fails, an error message is printed.
        fprintf(stderr, "Error: Memory allocation failed.\n");
        fclose(fp);
        return 0;
    }
    for(int i = 0; i < N; i++) {
        grid[i] = (int *)malloc(M * sizeof(int));
        if(!grid[i]) { // If memory allocation fails, an error message is printed.
            fprintf(stderr, "Error: Memory allocation failed.\n");
            for(int k = 0; k < i; k++) free(grid[k]);
            free(grid);
            fclose(fp);
            return 0;
        }
    }

    for(int i = 0; i < N; i++) {
        for(int j = 0; j < M; j++) { // The data is read from the file and stored in the 2D array.
            if(fscanf(fp, "%d", &grid[i][j]) != 1) {
                fprintf(stderr, "Error: Invalid grid data in %s\n", filename);
                for(int k = 0; k <= i; k++) free(grid[k]);
                free(grid);
                fclose(fp);
                return 0;
            }
        }
    }

    fclose(fp);
    *gridPtr = grid;
    *nPtr = N;
    *mPtr = M;
    return 1;
}

int readPPM(const char *filename, int ***gridPtr, int *nPtr, int *mPtr)
{
    FILE *fp = fopen(filename, "r");
    if(fp == NULL) { // If the file cannot be opened, an error message is printed.
        fprintf(stderr, "Error: Cannot open %s\n", filename);
        return 0;
    }

    char magic[3];//type of the ppm format
    if(!fscanf(fp, "%2s", magic)) { // If the magic number cannot be read, an error message is printed.
        fprintf(stderr, "Error: Could not read magic number from %s\n", filename);
        fclose(fp);
        return 0;
    }

    if(strcmp(magic, "P3") != 0) { // If the magic number is not P3, an error message is printed.
        fprintf(stderr, "Error: Not a valid P3 PPM file: %s\n", filename);
        fclose(fp);
        return 0;
    }

    int c = fgetc(fp);
    while(c == '#') { // If the file contains comments, they are skipped.
        while(c != '\n' && c != EOF) c = fgetc(fp);
        c = fgetc(fp);
    }
    if(c != EOF) ungetc(c, fp);

    int width, height, maxval;
    if(fscanf(fp, "%d %d %d", &width, &height, &maxval) != 3) { // If the width, height, and maxval cannot be read, an error message is printed.
        fprintf(stderr, "Error: Invalid PPM header.\n");
        fclose(fp);
        return 0;
    }

    int **grid = (int **)malloc(height * sizeof(int *));
    if(!grid) { // If memory allocation fails, an error message is printed.
        fprintf(stderr, "Error: Memory allocation failed.\n");
        fclose(fp);
        return 0;
    }
    for(int i = 0; i < height; i++) {
        grid[i] = (int *)malloc(width * sizeof(int));
        if(!grid[i]) {
            fprintf(stderr, "Error: Memory allocation failed.\n");
            for(int k = 0; k < i; k++) free(grid[k]);
            free(grid);
            fclose(fp);
            return 0;
        }
    }

    for(int i = 0; i < height; i++) {
        for(int j = 0; j < width; j++) {
            int r, g, b;
            if(fscanf(fp, "%d %d %d", &r, &g, &b) != 3) { // If the RGB values cannot be read, an error message is printed.
                fprintf(stderr, "Error: PPM pixel data incomplete.\n");
                for(int k = 0; k <= i; k++) free(grid[k]);
                free(grid);
                fclose(fp);
                return 0;
            }
            if(r == 255 && g == 255 && b == 255) { // If the pixel is white, it is stored as 1 in the 2D array.
                grid[i][j] = 1;
            } else {
                grid[i][j] = 0;
            }
        }
    }

    fclose(fp);
    *gridPtr = grid;
    *nPtr = height;
    *mPtr = width;
    return 1;
}

int writeTXT(const char *filename, int **labels, int N, int M)
{ // This function writes the output to a text file.
    FILE *fp = fopen(filename, "w");
    if(!fp) {
        fprintf(stderr, "Error: Cannot open %s for writing.\n", filename);
        return 0;
    }

    for(int i = 0; i < N; i++) {
        for(int j = 0; j < M; j++) {
            fprintf(fp, "%d", labels[i][j]);
            if(j < M - 1) {
                fprintf(fp, " ");
            }
        }
        fprintf(fp, "\n");
    }

    fclose(fp);
    return 1;
}

void labelToColor(int label, int *r, int *g, int *b)
{ // This function assigns a color to each group.
    if(label == 0) {
        *r = 0;
        *g = 0;
        *b = 0;
    } else {
        *r = (label * 50)  % 256; // The RGB values are calculated based on the label.
        *g = (label * 90)  % 256;
        *b = (label * 140) % 256;
    }
}

int writePPM(const char *filename, int **labels, int N, int M)
{ // This function writes the output to a PPM file.
    FILE *fp = fopen(filename, "w");
    if(!fp) {
        fprintf(stderr, "Error: Cannot open %s for writing.\n", filename);
        return 0;
    }

    fprintf(fp, "P3\n");
    fprintf(fp, "%d %d\n", M, N);
    fprintf(fp, "255\n");

    for(int i = 0; i < N; i++) {
        for(int j = 0; j < M; j++) {
            int r, g, b;
            labelToColor(labels[i][j], &r, &g, &b);
            fprintf(fp, "%d %d %d", r, g, b);
            if(j < M - 1) fprintf(fp, "  ");
        }
        fprintf(fp, "\n");
    }

    fclose(fp);
    return 1;
}

void labelGroups(int **grid, int **labels, int N, int M)
{ // This function labels the groups in the 2D array.
    int currentLabel = 0;

    for(int i = 0; i < N; i++) {
        for(int j = 0; j < M; j++) {
            labels[i][j] = 0;
        }
    }

    for(int row = 0; row < N; row++) {
        for(int col = 0; col < M; col++) {
            if(grid[row][col] == 1 && labels[row][col] == 0) {
                currentLabel++;
                if(currentLabel > 127) { // If more than 127 groups are found, a warning message is printed.
                    fprintf(stderr, "Warning: More than 127 groups found.\n");
                }

                labels[row][col] = currentLabel;
                int queueSize = N*M;
                int (*queue)[2] = malloc(sizeof(int) * 2 * queueSize);
                if(!queue) { // If memory allocation fails, an error message is printed.
                    fprintf(stderr, "Error: Memory allocation for BFS queue failed.\n");
                    return;
                }
                int front = 0, rear = 0;

                queue[rear][0] = row;
                queue[rear][1] = col;
                rear++;

                while(front < rear) {
                    int r = queue[front][0];
                    int c = queue[front][1];
                    front++;

                    for(int k = 0; k < 4; k++) {
                        int nr = r + dRow[k];
                        int nc = c + dCol[k];
                        if(nr >= 0 && nr < N && nc >= 0 && nc < M) { // If the neighbor is within the bounds of the 2D array, it is checked.
                            if(grid[nr][nc] == 1 && labels[nr][nc] == 0) {
                                labels[nr][nc] = currentLabel;
                                queue[rear][0] = nr;
                                queue[rear][1] = nc;
                                rear++;
                            }
                        }
                    }
                }
                free(queue); // The queue is freed after the group is labeled.
            }
        }
    }
}

int main(int argc, char *argv[])
{
    char* inputFilename = "input.P3.ppm";
    char* outputFilename = "output5.ppm";


    int N = 0, M = 0;
    int **grid = NULL;

    int success = 0;
    if(isPPMFile(inputFilename)) { // If the input file is a PPM file, the readPPM function is called.
        success = readPPM(inputFilename, &grid, &N, &M); // The data is read from the file and stored in a 2D array.
    } else {
        success = readTXT(inputFilename, &grid, &N, &M);
    }

    if(!success) { // If the read operation fails, an error message is printed.
        if(grid) free(grid);
        return 1;
    }

    int **labels = (int **)malloc(N * sizeof(int *));
    if(!labels) { // If memory allocation fails, an error message is printed.
        fprintf(stderr, "Error: Memory allocation failed for labels.\n");
        for(int i = 0; i < N; i++) {
            free(grid[i]);
        }
        free(grid);
        return 1;
    }
    for(int i = 0; i < N; i++) { // Memory is allocated for the labels.
        labels[i] = (int *)malloc(M * sizeof(int));
        if(!labels[i]) {
            fprintf(stderr, "Error: Memory allocation failed for labels.\n");
            for(int k = 0; k < i; k++) free(labels[k]);
            free(labels);
            for(int k = 0; k < N; k++) {
                free(grid[k]);
            }
            free(grid);
            return 1;
        }
    }

    labelGroups(grid, labels, N, M); // The groups are labeled in the 2D array.

    int ok = 0;
    if(isPPMFile(outputFilename)) { // If the output file is a PPM file, the writePPM function is called.
        ok = writePPM(outputFilename, labels, N, M);
    } else {
        ok = writeTXT(outputFilename, labels, N, M);
    }

    if(!ok) { // If the write operation fails, an error message is printed.
        fprintf(stderr, "Error: Failed to write output to %s.\n", outputFilename);
    } else {
        printf("Output written to %s successfully.\n", outputFilename);
    }

    for(int i = 0; i < N; i++) {
        free(grid[i]);
        free(labels[i]);
    }
    free(grid); // Memory is freed.
    free(labels);

    return 0;
}
