//
//  NSString+BNRVowelCounting.m
//  VowelCounter
//
//  Created by YB on 11/28/23.
//

#import "NSString+BNRVowelCounting.h"

@implementation NSString (BNRVowelCounting)

-(int) bnr_vowelCount{
    NSCharacterSet *vowels = [NSCharacterSet characterSetWithCharactersInString:@"aeiouAEIOU"];
    NSInteger vowelCount = 0;
    NSInteger length = [self length];
    NSMutableArray *myStringArray = [NSMutableArray new];
    if (length){
        for(NSInteger i = 0; i < length; i++){
            [myStringArray addObject:@([[self description] characterAtIndex:i])];
        }
        for(NSNumber *letter in myStringArray){
            unichar newLetter = [letter unsignedCharValue];
//            NSLog(@"%C", newLetter);
            if([vowels characterIsMember:newLetter]){
                vowelCount++;
            }
        }
    }
    return vowelCount;
}

@end


//#import "NSString+BNRVowelCounting.h"
//
//@implementation NSString (BNRVowelCounting)
//
//- (int)bnr_vowelCount {
//    NSCharacterSet *vowels = [NSCharacterSet characterSetWithCharactersInString:@"aeiouAEIOU"];
//    NSInteger vowelCount = 0;
//    NSInteger length = [self length];
//
//    if (length) {
//        for (NSInteger i = 0; i < length; i++) {
//            unichar letter = [self characterAtIndex:i];
//            NSLog(@"%C", letter);
//
//            // Check if the character is a vowel
//            if ([vowels characterIsMember:letter]) {
//                vowelCount++;
//            }
//        }
//    }
//
//    return vowelCount;
//}
//
//@end
