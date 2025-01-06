#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <math.h>

#define MAX_BIGRAMS 729

int bigram_index(char first, char second) { // bigram index
    int first_index = (first == ' ') ? 26 : first - 'a'; // if first is space, index is 26
    int second_index = (second == ' ') ? 26 : second - 'a'; // if second is space, index is 26
    return first_index * 27 + second_index;
}

void calculate_bigram_frequencies(FILE *file, double *frequencies) { // calculate bigram frequencies
    int counts[MAX_BIGRAMS] = {0};
    int total_bigrams = 0;

    char prev = '\0', current;
    while ((current = fgetc(file)) != EOF) { // read file character by character
        if (current == '\r') continue; // Carriage return karakterini atla
        if (isspace(current)) {
            current = ' ';
            if (prev == ' ') continue;
        }

        if ((current >= 'a' && current <= 'z') || current == ' ') { // Geçerli bir karakterse
            if (prev != '\0') { // Eğer prev doluysa bi-gram oluştur
                int index = bigram_index(prev, current); // Bi-gram indeksi hesapla
                counts[index]++;
                total_bigrams++;
                //printf("Bigram: '%c%c', Index: %d\n", prev, current, index); // Bi-gramları yazdır
            }
            prev = current; // Prev'i güncelle
        }
    }

    for (int i = 0; i < MAX_BIGRAMS; i++) {
       
        frequencies[i] = (double)counts[i] / total_bigrams; // calculate bigram frequencies
         if (counts[i] > 0) { // Sadece kullanılan bigramları yazdır
        printf("Bigram Index: %d, Count: %d, Frequency: %f\n", i, counts[i], frequencies[i]);
    }
    }

}

double calculate_dissimilarity(double *freq_x, double *freq_y) { // calculate dissimilarity
    double dissimilarity = 0.0;
    for (int i = 0; i < MAX_BIGRAMS; i++) {
        dissimilarity += fabs(freq_x[i] - freq_y[i]); // calculate dissimilarity
    }
    return dissimilarity;
}

int main(int argc, char *argv[]) {
    if (argc < 3) {
        fprintf(stderr, "Usage: %s language_x.txt language_1.txt ... language_n.txt\n", argv[0]);
        return 1;
    }

    int n = argc - 2;
    double freq_x[MAX_BIGRAMS] = {0};
    double freq_y[MAX_BIGRAMS] = {0};

    FILE *file_x = fopen(argv[1], "r");
    if (!file_x) {
        perror("Error opening language_x.txt"); // error message
        return 1;
    }
    calculate_bigram_frequencies(file_x, freq_x); // calculate bigram frequencies
    fclose(file_x);

    for (int i = 2; i < argc; i++) { // for each language file
        FILE *file_y = fopen(argv[i], "r");
        if (!file_y) {
            perror("Error opening language file");
            return 1;
        }
        calculate_bigram_frequencies(file_y, freq_y); // calculate bigram frequencies
        fclose(file_y); // close file

        double dissimilarity = calculate_dissimilarity(freq_x, freq_y); // calculate dissimilarity
          printf("Dissimilarity for %s: %.6f\n", argv[i], dissimilarity); // Sonucu yazdır
    }

    return 0;
}
