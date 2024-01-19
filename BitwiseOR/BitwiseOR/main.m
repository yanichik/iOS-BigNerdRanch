#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        // Define constants for data types
//        NSTextCheckingType phoneNumberType = NSTextCheckingTypePhoneNumber;
//        NSTextCheckingType dateType = NSTextCheckingTypeDate;
//
//        // Combine the constants using bitwise-OR
//        NSTextCheckingType searchTypes = phoneNumberType | dateType;
//
//        // Create an instance of NSDataDetector with the combined types
//        NSError *error;
//        NSDataDetector *dataDetector = [NSDataDetector dataDetectorWithTypes:searchTypes error:&error];
//
//        if (dataDetector) {
//            NSLog(@"NSDataDetector created successfully with types: %llu", searchTypes);
//
//            // Now you can use dataDetector for text pattern matching
//            NSString *text = @"Call me now at 415-944-0164 by 3 PM";
//            NSRange range = NSMakeRange(0, [text length]);
//            [dataDetector enumerateMatchesInString:text
//                                           options:0
//                                             range:range
//                                        usingBlock:^(NSTextCheckingResult *result, NSMatchingFlags flags, BOOL *stop) {
//                // Handle matching result
//                NSLog(@"Match Type: x%llx, Range: %@", result.resultType, NSStringFromRange(result.range));
//            }];
//        } else {
//            NSLog(@"Error creating NSDataDetector: %@", [error localizedDescription]);
//        }
        enum MyEnum {
            MyBest = 1 << 1,
            MyMid = 1 << 2,
            MyOk = 1 << 3,
            MyWorst = 1 << 4,
        };
        NSLog(@"MyMid is: %x\n", MyMid);
    }
    return 0;
}
