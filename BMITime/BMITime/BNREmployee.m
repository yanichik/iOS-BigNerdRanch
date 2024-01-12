//
//  BNREmployee.m
//  BMITime
//
//  Created by YB on 11/27/23.
//

#import "BNREmployee.h"

@implementation BNREmployee
@synthesize employeeId = _employeeId;

-(NSString*) description
{
    return [NSString stringWithFormat:@"<Employee %@ with id: %d and employer: %@", @"john", employeeId, self.employer];
}
@end
