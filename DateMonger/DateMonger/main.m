//
//  main.m
//  DateMonger
//
//  Created by YB on 11/29/23.
//

#import <Foundation/Foundation.h>
#import "NSDate+BNRDateConvenience.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSDate *midnightOfToday = [NSDate midnightOfYear:2023 withMonth:11 andDay:23];
        NSLog(@"Midnight of today is: %@", [midnightOfToday descriptionWithLocale:[NSLocale currentLocale]]);
    }
    return 0;
}
