//
//  main.c
//  bitwize
//
//  Created by YB on 11/30/23.
//

#include <stdio.h>

int main(int argc, const char * argv[]) {
    unsigned char a = 0x3c;
    unsigned char b = 0xa9;
    unsigned char c = a|b;
    printf("Hex: a | b = c\n");
    printf("Hex: %x | %x = %x\n", a, b, c);
    printf("Dec: %d | %d = %d\n", a, b, c);
    return 0;
}
