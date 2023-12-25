//
//  ObjCString.h
//  yostring
//
//  Created by YB on 12/4/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ObjCString : NSObject
-(NSString *) createNSString:(NSString*)string;

@end

NS_ASSUME_NONNULL_END
