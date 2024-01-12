//
//  BNRAppDelegate.h
//  iTahDoodle
//
//  Created by YB on 11/12/23.
//

#import <UIKit/UIKit.h>


NSString *docPath(void);

@interface BNRAppDelegate : UIResponder <UIApplicationDelegate, UITableViewDataSource>
//instance vars within brackets are part of the class's internal state. Instance variables hold the actual data for an instance of the class.

{
    UITableView *taskTable;
    UITextField *textField;
    UIButton *insertButton;
    NSMutableArray *tasks;
}

//@property (nonatomic) UITableView *taskTable;
//@property (nonatomic) UITextField *textField;
//@property (nonatomic) UIButton *insertButton;
//@property (nonatomic) NSMutableArray *tasks;

-(void) addTask:(id)sender;

@property (nonatomic, strong) UIWindow *window;

@end

