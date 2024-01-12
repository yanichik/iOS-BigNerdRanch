//
//  main.m
//  BMITime
//
//  Created by YB on 11/27/23.
//

#import <Foundation/Foundation.h>
#import "BNRPerson.h"
#import "BNREmployee.h"
#import "BNREmployer.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        BNREmployee *john = [BNREmployee new];
        BNREmployer *costco = [BNREmployer new];
        [john setEmployer:costco];
        [costco setEmployeesList:[NSMutableSet setWithObject:john]];
        
        NSLog(@"employee: \n%@ has employeeId: %d", john, john.employeeId);

        // even though costco nil b/c john.employer has strong ref, john has ownership of costco object
        costco = nil;
        NSLog(@"employee: \n%@", john);

        // after nilling out john.employer then only does the employer ref get deallocated
        john.employer = nil;
        NSLog(@"employee: \n%@", john);
    }
    return 0;
}
