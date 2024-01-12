//
//  BNROwnedAppliance.h
//  Appliances
//
//  Created by YB on 11/25/23.
//

#import "BNRAppliance.h"

NS_ASSUME_NONNULL_BEGIN

@interface BNROwnedAppliance : BNRAppliance

@property (readonly) NSSet *ownerNames;

// designated initializer
-(instancetype) initWithProductName:(NSString *)namePtr firstOwnerName:(NSString *)ownerPtr;
-(void) addOwnerName:(NSString *)ownerPtr;
-(void) removeOwnerName:(NSString *)ownerPtr;

@end

NS_ASSUME_NONNULL_END
