//
//  ObjCString.m
//  yostring
//
//  Created by YB on 12/4/23.
//

#import "ObjCString.h"

@implementation ObjCString

-(NSString *) createNSString:(NSString*)string{
    return [NSString stringWithString:string];
}

@end
