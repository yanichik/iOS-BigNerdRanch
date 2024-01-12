//
//  main.c
//  yostring
//
//  Created by YB on 12/2/23.
//

#include <stdio.h>
#include <stdlib.h> // For malloc/free
#include <string.h> // For strlen
#include "ObjCString.h"

int main(int argc, const char * argv[]) {
    //    char x = 0x21;
    //    while(x <= 0x7e){
    //        printf("%x is %c\n", x, x);
    //        x++;
    //    }
    
    // same thing using literals inside single quotes
    //    char x = '!';
    //    while(x <= '~'){
    //        printf("%x is %c\n", x, x);
    //        x++;
    //    }
    
    // Get a pointer to 5 bytes of memory on the heap
//    char *start = malloc(10);
//
//    *start = 'L';
//    *(start+1) = 'o';
//    *(start+2) = 'o';
//    *(start+3) = 'k';
////    *(start+4) = '\0';
//
//    printf("start string: '%s' has length %lu\n", start, strlen(start));
//    printf("the 4th letter of start is: '%c'\n", *(start+3));
//
//    free(start);
//    start = NULL;
    NSString *myString = @"my string";
    
    return 0;
}
