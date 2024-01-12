//
//  BNRAppliance.m
//  Appliances
//
//  Created by YB on 11/25/23.
//

#import "BNRAppliance.h"

@implementation BNRAppliance

-(instancetype)init{
    // override init to provide default name
//    return [self initWithProductName:@"default"];
    [NSException raise:@"BNRApplianceInit" format:@"Use initWithProductName:, not init"];
    return nil;
}

-(instancetype)initWithProductName:(NSString *)namePtr {
    // call NSObject's init method
    self = [super init];
    // check if call to [super init] returned non-nil account
    if (self){
        // BNR recommends setting instance variable directly
        _voltage = 120;
        _productName = [namePtr copy];
        
        // Many programmers using accessor methods BUT slight slight chance
        // that object not yet ready to use accessor methods within the init
        // and could lead to:
        // 1. incomplete initialization 2. crash or exception 3. dependency issues
        
        // [self setVoltage:120];
        // [self setProductName:[namePtr copy]];
    }
    return self;
}

-(NSString*)description{
    return [NSString stringWithFormat:@"<%@: %ld volts>", self.productName, self.voltage];
}

- (void) dealloc
{
    NSLog(@"deallocating %@", self);
}

@end
