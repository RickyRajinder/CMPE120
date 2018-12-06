#include <stdio.h>

typedef unsigned char *pointer;
void show_bytes(pointer start, size_t len) {
    size_t i;
    for (i = 0; i < len; i++)
        printf("%p\t0x%02x\n",start+i, start[i]);
    printf("\n");
}

void main() {
    int a = 15213;
    printf("Endianess demo by %s at %s %s\n", "Ricky Singh", __DATE__, __TIME__);
    printf("int a = %d (0x%08x);\n", a, a);
    show_bytes((pointer) &a, sizeof(int));
}
