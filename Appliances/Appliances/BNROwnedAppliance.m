//
//  BNROwnedAppliance.m
//  Appliances
//
//  Created by YB on 11/25/23.
//

#import "BNROwnedAppliance.h"

// line of "@interface BNROwnedAppliance ()" indicates class extension
// empty () indicates anonymous category  -> meaning "extension without a name"
@interface BNROwnedAppliance ()
// {...} block designated for instance variables
{
    // private instance variable _ownerNames where the "_" indicates that it is private
    // Since this declaration is in the class extension, it means that _ownerNames is not part of the public interface of the class, and it's meant to be used only internally within the implementation file.
    NSMutableSet *_ownerNames;
}
@end

@implementation BNROwnedAppliance

- (instancetype)initWithProductName:(nonnull NSString *)namePtr firstOwnerName:(nonnull NSString *)ownerPtr {
    // call super's init
    if (self = [super initWithProductName:namePtr]){
        _ownerNames = [[NSMutableSet alloc] initWithSet:[NSSet setWithObject:namePtr]];
    }
    return self;
}

// adding superclass's initializer override in order to enable calling of BNROwnedAppliance custom init
// together with setting _ownerNames, which would otherwise not be called IN CASE THAT this class type obj
// was improperly initialized with superclass's init method instead of this class's init type
- (instancetype) initWithProductName:(NSString *)namePtr {
    if(self = [self initWithProductName:namePtr firstOwnerName:@"Default Owner"]){
        return self;
    }
    return [super initWithProductName:namePtr];
}

- (void)addOwnerName:(nonnull NSString *)ownerPtr {
    [_ownerNames addObject:ownerPtr];
}


- (void)removeOwnerName:(nonnull NSString *)ownerPtr {
    [_ownerNames removeObject:ownerPtr];
}

- (NSSet *)ownerNames
{
    return [_ownerNames copy];
}

@end
