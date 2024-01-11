//
//  NSDate+BNRDateConvenience.m
//  DateMonger
//
//  Created by YB on 11/29/23.
//

#import "NSDate+BNRDateConvenience.h"

@implementation NSDate (BNRDateConvenience)

+(instancetype)midnightOfYear:(NSInteger)year withMonth:(NSInteger)month andDay:(NSInteger)day{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [NSDateComponents new];
    components.day = day;
    components.month = month;
    components.year = year;
    components.hour = 0;
    components.second = 0;
    components.minute = 0;
    return [calendar dateFromComponents:components];
}

@end
