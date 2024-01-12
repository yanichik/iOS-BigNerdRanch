//
//  main.m
//  Stockz
//
//  Created by YB on 11/5/23.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSMutableArray *stocks = [[NSMutableArray alloc] init];
        
        NSMutableDictionary *stock = [NSMutableDictionary dictionary];
        [stock setObject:@"AAPL" forKey:@"symbol"];
        [stock setObject:[NSNumber numberWithInt:200] forKey:@"shares"];
        NSLog(@"Own %@ shares of %@", stock[@"shares"], stock[@"symbol"]);
        [stocks addObject:stock];
        NSLog(@"Stocks in portfolio: %@", stocks);
        
        stock = [NSMutableDictionary new];
        [stock setObject:@"GOOG" forKey:@"symbol"];
        [stock setObject:[NSNumber numberWithInt:500] forKey:@"shares"];
        [stocks addObject:stock];
        NSLog(@"Own %@ shares of %@", stock[@"shares"], stock[@"symbol"]);
        NSLog(@"Stocks in portfolio: %@", stocks);
        
        NSMutableArray *watchlist = [NSMutableArray arrayWithArray:@[@"FB", @"AMZN", @"XLE"]];
        
        [stocks addObject:watchlist];
        
        NSFileManager *fileManager = [NSFileManager new];
        NSString *homeDirPath = [fileManager homeDirectoryForCurrentUser].path;
        NSString *plistFilePath = [homeDirPath stringByAppendingString:@"/dev/objcBigNerdRanch/Stockz/Stockz/stockz.plist"];
        NSLog(@"plist file directory: %@", plistFilePath);
        
        BOOL success = [stocks writeToFile:plistFilePath atomically:YES];
        NSLog(@"Success is: %d", success);
        
        if (success){
            NSArray *stocksList = [NSArray arrayWithContentsOfFile:plistFilePath];
            //            for(stock in stocksList){
            for(NSDictionary *stock in stocksList){
                if ([stock doesContain:@"shares"]){
                    //                NSLog(@"I own %@ shares of %@", [stock objectForKey:@"shares"], [stock objectForKey:@"symbol"]);
                    NSLog(@"I own %@ shares of %@", stock[@"shares"], stock[@"symbol"]);
                }
            }
        }
    }
    return 0;
}
