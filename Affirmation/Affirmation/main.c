//
//  main.c
//  Affirmation
//
//  Created by YB on 12/8/23.
//

#include <stdio.h>

// "char * argv[]" - command line arguments stored here
// "int argc" - number of arguments stored in argv
int main(int argc, const char * argv[]) {
    for (int i = 0; i < argc; i++) {
        printf("argv[%d]: %s\n", i, argv[i]);
    }
    return 0;
}
