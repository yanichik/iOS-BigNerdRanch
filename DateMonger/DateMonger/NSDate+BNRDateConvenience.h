//
//  NSDate+BNRDateConvenience.h
//  DateMonger
//
//  Created by YB on 11/29/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (BNRDateConvenience)
+(instancetype)midnightOfYear:(NSInteger)year withMonth:(NSInteger)month andDay:(NSInteger)day;

@end

NS_ASSUME_NONNULL_END
