#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_NAME_LEN 20
#define MAX_INPUTS 10

// Gate types
#define INPUT 0
#define OUTPUT 1
#define AND 2
#define OR 3
#define NOT 4
#define FLIPFLOP 5

// Gate structure
typedef struct gate {
    int type;
    char name[MAX_NAME_LEN]; // Name of the gate
    struct gate* input_gates[MAX_INPUTS]; // Input gates
    int number_of_inputs;
    int output; // Output value
    int former_out; // For flip-flops
    int evaluated;
    int (*characteristic_function)(int*, int);
} Gate;

// Function prototypes
int and_function(int* inputs, int n); // AND gate
int or_function(int* inputs, int n); // OR gate
int not_function(int* inputs, int n); // NOT gate
int flipflop_function(int* inputs, int n, int* former_out); // Flip-flop gate
Gate* create_gate(int type, const char* name);
void create_connection(Gate* from_gate, Gate* to_gate);
int evaluate(Gate* gate);
void reset_gates(Gate** gates, int count);

// Main logic functions
int and_function(int* inputs, int n) {
    for (int i = 0; i < n; i++) { // Check if all inputs are 1
        if (!inputs[i]) return 0; // If not, return 0
    }
    return 1;
}

int or_function(int* inputs, int n) {
    for (int i = 0; i < n; i++) { // Check if any input is 1
        if (inputs[i]) return 1; // If so, return 1
    }
    return 0;
}

int not_function(int* inputs, int n) {
    return !inputs[0]; // Return the negation of the input
}

int flipflop_function(int* inputs, int n, int* former_out) {
    int result = inputs[0] ^ (*former_out); // XOR the input with the former output
    *former_out = result; // Update the former output
    return result;
}

// Create a new gate
Gate* create_gate(int type, const char* name) {
    Gate* gate = (Gate*)malloc(sizeof(Gate)); // Allocate memory for the gate
    gate->type = type; // Set the type of the gate
    strcpy(gate->name, name); // Set the name of the gate
    gate->number_of_inputs = 0;
    gate->output = 0;
    gate->former_out = 0;
    gate->evaluated = 0;

    if (type == AND) gate->characteristic_function = and_function; // Set the characteristic function
    else if (type == OR) gate->characteristic_function = or_function; // Set the characteristic function
    else if (type == NOT) gate->characteristic_function = not_function; // Set the characteristic function

    return gate;
}

// Create a connection between gates
void create_connection(Gate* from_gate, Gate* to_gate) {
    to_gate->input_gates[to_gate->number_of_inputs++] = from_gate; // Add the from_gate to the input_gates of the to_gate
}

// Evaluate the output of a gate
int evaluate(Gate* gate) {
    if (gate->evaluated) return gate->output;

    int inputs[MAX_INPUTS];
    for (int i = 0; i < gate->number_of_inputs; i++) { // Evaluate the inputs
        inputs[i] = evaluate(gate->input_gates[i]); // Evaluate the input gates
    }

    if (gate->type == FLIPFLOP) {
        gate->output = flipflop_function(inputs, gate->number_of_inputs, &gate->former_out); // Evaluate the output
    }
    else if (gate->type == OUTPUT) { // If the gate is an output gate
        gate->output = gate->input_gates[gate->number_of_inputs - 1]->output;
    }
    else {
        gate->output = gate->characteristic_function(inputs, gate->number_of_inputs); // Evaluate the output
    }

    gate->evaluated = 1;
    return gate->output;
}

// Reset the evaluated state of gates
void reset_gates(Gate** gates, int count) {
    for (int i = 0; i < count; i++) {
        gates[i]->evaluated = 0; // Reset the evaluated state
    }
}

int main(int argc, char* argv[]) {
    if (argc != 3) {
        fprintf(stderr, "Usage: %s <circuit_file> <input_file>\n", argv[0]);
        return 1;
    }

    FILE* circuit_file = fopen(argv[1], "r");
    FILE* input_file = fopen(argv[2], "r");

    if (!circuit_file || !input_file) {
        fprintf(stderr, "Error: Unable to open input files.\n");
        return 1;
    }

    // Arrays to store gates
    Gate* gates[100];
    int gate_count = 0;

    char line[256];
    while (fgets(line, sizeof(line), circuit_file)) {
        char type[20], name[20], from_name[20], to_name[20];

        if (sscanf(line, "GATE %s %s", type, name) == 2) { // Read the gate type and name
            int gate_type;
            if (strcmp(type, "INPUT") == 0) gate_type = INPUT;
            else if (strcmp(type, "OUTPUT") == 0) gate_type = OUTPUT;
            else if (strcmp(type, "AND") == 0) gate_type = AND;
            else if (strcmp(type, "OR") == 0) gate_type = OR;
            else if (strcmp(type, "NOT") == 0) gate_type = NOT;
            else if (strcmp(type, "FLIPFLOP") == 0) gate_type = FLIPFLOP;

            gates[gate_count++] = create_gate(gate_type, name);
        } else if (sscanf(line, "CONNECTION %s %s", from_name, to_name) == 2) { // Read the connection
            Gate *from_gate = NULL, *to_gate = NULL;

            for (int i = 0; i < gate_count; i++) {
                if (strcmp(gates[i]->name, from_name) == 0) from_gate = gates[i];
                if (strcmp(gates[i]->name, to_name) == 0) to_gate = gates[i];
            }

            if (from_gate && to_gate) {
                create_connection(from_gate, to_gate); // Create a connection between the gates
            }
        }
    }

    fclose(circuit_file);

    // Process input lines
    while (fgets(line, sizeof(line), input_file)) {
        int input_values[100], input_count = 0;
        for (int i = 0; line[i] != '\0' && line[i] != '\n'; i++) {
            input_values[input_count++] = line[i] - '0';
        }

        // Assign inputs
        for (int i = 0, input_index = 0; i < gate_count; i++) {
            if (gates[i]->type == INPUT) {
                gates[i]->output = input_values[input_index++];
                gates[i]->evaluated = 1;
            }
        }

        // Evaluate outputs
        for (int i = 0; i < gate_count; i++) {
            if (gates[i]->type == OUTPUT) {
                printf("%d", evaluate(gates[i]));
            }
        }
        printf("\n");

        reset_gates(gates, gate_count);
    }

    fclose(input_file);

    // Free memory
    for (int i = 0; i < gate_count; i++) {
        free(gates[i]);
    }

    return 0;
}
