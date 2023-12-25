//
//  BNRPerson.m
//  BMITime
//
//  Created by YB on 11/27/23.
//

#import "BNRPerson.h"

@implementation BNRPerson

-(float) bodyMassIndex {
    float h = [self heightInMeters];
    return [self weightInKilos] / (h * h);
}

@end
