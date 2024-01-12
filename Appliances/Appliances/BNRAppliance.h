//
//  BNRAppliance.h
//  Appliances
//
//  Created by YB on 11/25/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BNRAppliance : NSObject
{
    NSString *_productName;
}

@property (nonatomic, copy) NSString *productName;
@property (nonatomic) NSInteger voltage;
// designated initializer
-(instancetype) initWithProductName:(NSString *)namePtr;

@end

NS_ASSUME_NONNULL_END
