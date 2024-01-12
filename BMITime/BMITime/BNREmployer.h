//
//  BNREmployer.h
//  BMITime
//
//  Created by YB on 11/27/23.
//

#import "BNRPerson.h"
@class BNREmployee;

NS_ASSUME_NONNULL_BEGIN

@interface BNREmployer : BNRPerson

@property (nonatomic, strong) NSMutableSet <BNREmployee *> *employeesList;

@end

NS_ASSUME_NONNULL_END
