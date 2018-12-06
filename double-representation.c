#include <stdio.h>

typedef unsigned char *pointer;
void show_bytes(pointer start, size_t len) {
    size_t i;
    for (i = 0; i < len; i++)
        printf("%p\t0x%02x\n",start+i, start[i]);
    printf("\n");
}


void doubleToHex(double x) {
    char *buffer[32];
    sprintf(buffer, "%llx", *(unsigned long long *)&x);
    printf(buffer);
    printf("\n");
}


void main() {
    int a = 15213;
    double b = 4.75;
    //printf("Enter a double value: ");
    //scanf("%lf", &b);
    //printf("You entered: %f\n", b);
    printf("Endianess demo by %s at %s %s\n\n", "Ricky Singh", __DATE__, __TIME__);
    //printf("int a = %d (0x%08x);\n", a, a);
    //show_bytes((pointer) &a, sizeof(int));
    printf("double b = %f ", b);
    printf("0x");
    doubleToHex(b);
    show_bytes((pointer) &b, sizeof(double));
}
