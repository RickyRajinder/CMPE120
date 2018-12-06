#include <stdio.h>

char * my_name = "Ricky Singh";

char a[] ={'3','5','6','4','1'} ; 

extern void sort(char a[], int size);

void print_array(char a[], int size) {
    int i;
    for (i=0; i< size; i++) 
        printf("%c, ", a[i]);
    printf("\n");
}

void main() {
    printf("Bubble sort demo by %s at %s %s\n", my_name, __DATE__, __TIME__);

    printf("before sorting : ");
    print_array(a, 5);

    sort(a, 5);

    printf("after sorting : ");
    print_array(a, 5);
        
}

