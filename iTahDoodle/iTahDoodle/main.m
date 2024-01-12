//
//  main.m
//  iTahDoodle
//
//  Created by YB on 11/12/23.
//

#import <UIKit/UIKit.h>
#import "BNRAppDelegate.h"

int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
        appDelegateClassName = NSStringFromClass([BNRAppDelegate class]);
    }
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
    //    When an iOS application first launches, there is a lot of behind-the-scenes setting up. During this phase, an instance of UIApplication is created to control your application’s state and act as liaison to the operating system. An instance of BNRAppDelegate is also created and set as the delegate of the UIApplication instance (which explains the name “app delegate”).
}
