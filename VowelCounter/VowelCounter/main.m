//
//  main.m
//  VowelCounter
//
//  Created by YB on 11/28/23.
//

#import <Foundation/Foundation.h>
#import "NSString+BNRVowelCounting.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSString *string = @"Hello, World!";
        NSLog(@"%@\nhas %d vowels", string, [string bnr_vowelCount]);
    }
    return 0;
}
