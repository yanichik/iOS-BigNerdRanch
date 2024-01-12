//
//  BNREmployee.h
//  BMITime
//
//  Created by YB on 11/27/23.
//

#import "BNRPerson.h"
@class BNREmployer;

NS_ASSUME_NONNULL_BEGIN

@interface BNREmployee : BNRPerson
{
    int employeeId;
}

@property (nonatomic) int employeeId;
@property (nonatomic, strong) BNREmployer *employer;

@end

NS_ASSUME_NONNULL_END
