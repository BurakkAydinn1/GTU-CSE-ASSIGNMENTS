#include <stdio.h>
#include <math.h>

#define CLUSTER_COUNT 3
#define MIN_PERCENT_DIFFERENCE 30 // X
#define MAX_POINT_CAPTURE 30 // N
#define BUFFERSIZE 100

#define EPSILON 1e-9
#define VERY_LARGE_NUMBER 1e30

double calculate_distance(double x1, double y1, double x2, double y2){
    return sqrt(pow(x2 - x1, 2) + pow(y2 - y1, 2));
}

int choose_cluster(double distances[CLUSTER_COUNT]) {
    int closest = -1, second_closest = -1;
    double min_dist = VERY_LARGE_NUMBER;
    double second_min_dist = VERY_LARGE_NUMBER;

    // Find the closest and second closest distances
    for (int i = 0; i < CLUSTER_COUNT; i++) {
        if (distances[i] < min_dist) {
            second_min_dist = min_dist;
            second_closest = closest;
            min_dist = distances[i];
            closest = i;
        } else if (distances[i] < second_min_dist) {
            second_min_dist = distances[i];
            second_closest = i;
        }
    }

    // Calculate percentage difference
    printf("\nCluster differences are:\n");
    printf("\t%f, %f, %f\n", distances[0], distances[1], distances[2]);
    double percentage_diff = ((second_min_dist - min_dist) / (second_min_dist + EPSILON)) * 100;
    printf("\tPercantage distance is: %f\n", percentage_diff);

    // Check if difference is at least X percent
    if (percentage_diff >= MIN_PERCENT_DIFFERENCE) {
        return closest;
    } else {
        return -1;
    }
    
}

int main (){

    int cluster_sizes[CLUSTER_COUNT] = {0, 0, 0};
    double cluster_centers[2 * CLUSTER_COUNT] = {0,0, 0,0, 0,0};
    double distances[CLUSTER_COUNT] = {0, 0, 0};
    int captured_points = 0;

    char buffer[BUFFERSIZE];
    for (int i = 0; i < CLUSTER_COUNT; i++){ // Reading the first points that define the clusters
        if(captured_points >= MAX_POINT_CAPTURE) break;

        fgets(buffer, BUFFERSIZE , stdin); // Read the line
        
        double x, y;
        sscanf(buffer, "%lf %lf", &x, &y);

        cluster_centers[2 * i] = x;
        cluster_centers[(2 * i) + 1] = y;
        cluster_sizes[i]++;
        captured_points++;
    }


    while(fgets(buffer, BUFFERSIZE , stdin)){ // Reading until the end of file

        if(captured_points >= MAX_POINT_CAPTURE) break;

        int max_index = 0;
        double max_value = 0;

        double x, y;
        sscanf(buffer, "%lf %lf", &x, &y);

        // Calculate distances to each cluster center.
        for (int i = 0; i < CLUSTER_COUNT; i++){

            double cluster_center_x = cluster_centers[2 * i];
            double cluster_center_y = cluster_centers[(2 * i) + 1];

            double distance = calculate_distance(x, y, cluster_center_x, cluster_center_y);
            distances[i] = distance;
        }

        // Choose clustor according to calculated distances.
        int chosen_cluster_index = choose_cluster(distances);
        captured_points++;

        // Check if the point is discarded
        if (chosen_cluster_index == -1){
            printf("Point %.2f, %.2f was discarded.\n", x, y);
            continue;
        }

        // Include to the cluster if the point is not discarded.
        int x_index = 2 * chosen_cluster_index;
        int y_index = (2 * chosen_cluster_index) + 1;

        cluster_centers[x_index] = (cluster_centers[x_index] * cluster_sizes[chosen_cluster_index] + x)/(cluster_sizes[chosen_cluster_index]+1);
        cluster_centers[y_index] = (cluster_centers[y_index] * cluster_sizes[chosen_cluster_index] + y)/(cluster_sizes[chosen_cluster_index]+1);
        cluster_sizes[chosen_cluster_index]++;

        printf("Point %.2f, %.2f was included in Cluster %d\n", x, y, chosen_cluster_index + 1);
    }

    // Print the cluster infos
    for(int i = 0; i < CLUSTER_COUNT; i++){
        printf("Cluster %d: %.2f, %.2f, %d\n", i+1, cluster_centers[2 * i], cluster_centers[(2 * i) + 1], cluster_sizes[i]);
    }


    return 0;
}