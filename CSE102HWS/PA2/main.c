#include <stdio.h>
#include <stdlib.h>


#define X 6
#define Y 3

/*
    Note: When the memory array is full, instead of shifting the elements to make space for the new segment,
    I decided to keep track of the insert position in the circular buffer and overwrite the oldest segment to
    increase efficiency.

    I used 2 functions for modularity and readability:
    - compare_segments: Compares two segments of size X and returns 1 if they are equal, 0 otherwise.
    - find_segment: Finds a segment in the memory array and returns its index if found, -1 otherwise.

    And a helper function:
    - write_output: Writes the segments and their counts to the output file.
    (I used this function to keep the main function clean and focused on the main logic
    since it also handles the circular buffer logic.)
*/

// Function to compare two segments of size X. Returns 1 if seg1 == seg2, returns 0 else
int compare_segments(int *seg1, int *seg2)
{
    for (int i = 0; i < X; i++)
    {
        if (seg1[i] != seg2[i])
            return 0;
    }
    return 1;
}

// Function to find a segment in the memory array. Compares the new segment with the existing ones.
int find_segment(int segments[Y][X], int segment_count, int *new_segment)
{
    for (int i = 0; i < segment_count; i++) // Loop through the segments
    {
        if (compare_segments(segments[i], new_segment)) // Return the index if the segment is found
            return i;
    }
    return -1;
}

// Function to write output to output.txt
void write_output(int segments[Y][X], int counts[Y], int segment_count, int start_index)
{
    FILE *output = fopen("output.txt", "w"); // Open output file for writing

    if (!output)
    {
        perror("Failed to open output.txt");
        return;
    }

    for (int i = 0; i < segment_count; i++)
    {
        int idx = (start_index + i) % Y; // Calculate the circular index

        for (int j = 0; j < X; j++) // Write the segment to the output file
        {
            fprintf(output, "%d ", segments[idx][j]);
        }

        fprintf(output, ": %d\n", counts[idx]); // Write the count of the segment to the output file
    }
    fclose(output); // Close the output file
}

int main()
{
    FILE *input = fopen("input.txt", "r"); // Open input file for reading

    if (!input)
    {
        perror("Failed to open input.txt");
        return 1;
    }

    int segments[Y][X] = {0}; // Circular buffer for segments
    int counts[Y] = {0};      // Circular buffer for counts
    int segment_count = 0;    // Current number of unique segments in memory
    int current_segment[X];   // Temporary storage for the current segment
    int insert_pos = 0;       // Position in circular buffer to insert the next segment
    int next_number;          // Temporary storage for the next number

    // Read the first X numbers into current_segment
    for (int i = 0; i < X; i++)
    {
        if (fscanf(input, "%d", &current_segment[i]) != 1)
        {
            fclose(input);
            return 0; // Handle case when there's not enough input
        }
    }

    // Keep reading until the end of input
    while (1)
    {
        // Check if the segment already exists (for second iteration and beyond)
        int found_index = find_segment(segments, segment_count, current_segment);

        if (found_index != -1)
        {
            // If the segment already exists, update its count
            counts[found_index]++;
        }
        else
        {
            // If the segment doesn't exist, add it at insert_pos in the circular buffer
            for (int j = 0; j < X; j++)
            {
                segments[insert_pos][j] = current_segment[j];
            }

            counts[insert_pos] = 1; // Initialize count for the new segment

            if (segment_count < Y)
            {
                segment_count++; // Increment segment count until we reach Y
            }

            // Move to the next position in circular buffer
            insert_pos = (insert_pos + 1) % Y;
        }

        if (fscanf(input, "%d", &next_number) != 1)
            break; // Break on EOF or read error

        // Shift the segment to the left and append the next number
        for (int i = 0; i < X - 1; i++)
        {
            current_segment[i] = current_segment[i + 1];
        }
        current_segment[X - 1] = next_number;
    }

    if (segment_count < Y) // Reset insert_pos to 0 if segment_count < Y
    {
        insert_pos = 0;
    }

    // Write the output to the output file
    write_output(segments, counts, segment_count, insert_pos);

    fclose(input);
    return 0;
}
