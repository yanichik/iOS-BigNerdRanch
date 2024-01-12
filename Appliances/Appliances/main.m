//
//  main.m
//  Appliances
//
//  Created by YB on 11/24/23.
//

#import <Foundation/Foundation.h>
#import "BNRAppliance.h"
#import "BNROwnedAppliance.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // BNRAppliance *a = [[BNRAppliance alloc] init];
        // NSLog(@"a is %@", a);
        // [a setProductName:@"Washing Machine"];
        // [a setVoltage:240];
        // NSLog(@"a is %@", a);
        
        
        /* since initializing BNROwnedAppliance type with a BNRAppliance init, the _ownerNames
         instance variable (of BNROwnedAppliance) does not get initialized
         UNLESS --->>> add superclass's initializer which calls the "initWithProductName:firstOwnerName:"
         initializer of BNROwnedAppliance with a default firstOwnerName */
        BNROwnedAppliance *owned = [[BNROwnedAppliance alloc] initWithProductName:@"Pot"];
        NSLog(@"Pot is owned appliance: %@", owned);
        NSLog(@"Owner names set: %@", owned.ownerNames);
        owned = nil;
        NSLog(@"Pot is owned appliance: %@", owned);
        
        
        
        // this to throw exception b/c trying to do init on the overriden init of BNRAppliance, when must use
        // the designated initWithProductName:
        //        BNRAppliance *a = [[BNRAppliance alloc] init];
    }
    return 0;
}
