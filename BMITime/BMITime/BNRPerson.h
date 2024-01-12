//
//  BNRPerson.h
//  BMITime
//
//  Created by YB on 11/27/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BNRPerson : NSObject

@property (nonatomic) float heightInMeters;
@property (nonatomic) int weightInKilos;

-(float) bodyMassIndex;

@end

NS_ASSUME_NONNULL_END
