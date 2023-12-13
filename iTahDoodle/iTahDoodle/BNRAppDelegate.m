//
//  BNRAppDelegate.m
//  iTahDoodle
//
//  Created by YB on 11/12/23.
//

#import "BNRAppDelegate.h"
#import "BNRViewController.h"

NSString *docPath(void){
    NSArray *pathList = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    return [pathList[0] stringByAppendingPathComponent:@"data.td"];
}


@interface BNRAppDelegate ()

@end

@implementation BNRAppDelegate

# pragma mark - Application Delegate Callbacks

//While the application is being launched, it is not ready for work or input. When this changes, the UIApplication instance sends its delegate the message application:didFinishLaunchingWithOptions:. This method is very important. It’s where you put everything that needs to happen or needs to be in place before the user interacts with the application.
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    NSArray *plist = [NSArray arrayWithContentsOfFile:docPath()];
    if(plist){
        tasks = [plist mutableCopy];
    } else {
        // convenience method provided by Objective-C, and it's equivalent to calling alloc and init together.
//        [self tasks] = [NSMutableArray new];
        tasks = [@[@"Task 1", @"Task 2", @"Task 3"] mutableCopy];
        NSLog(@"Tasks: %@", tasks);
    }
    
    // create and config UIWindow instance w/ CGRect
    // CGRect is struct w/ origin (x,y) and size (width, length)
    CGRect windowFrame = [[UIScreen mainScreen] bounds];
    UIWindow *theWindow = [[UIWindow alloc] initWithFrame:windowFrame];
    //    [theWindow setRootViewController:[[BNRViewController alloc] init]];
    theWindow.rootViewController = [[UIViewController alloc] init];
    [self setWindow:theWindow];
    
    // Define the frame rectangles of the three UI elements
    // CGRectMake() creates a CGRect from (x, y, width, height)
    CGRect tableFrame = CGRectMake(0, 80, windowFrame.size.width, windowFrame.size.height - 100);
    CGRect fieldFrame = CGRectMake(20, 40, 200, 31);
    CGRect buttonFrame = CGRectMake(228, 40, 72, 31);
    
    // Create and configure the table view
    taskTable = [[UITableView alloc] initWithFrame:tableFrame style:UITableViewStylePlain];
    [taskTable setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
    // Make this object the table view's dataSource
    [taskTable setDataSource:self];
//    [taskTable setDelegate:self];
    
    // Tell the table view which class to instantiate whenever it
    // needs to create a new cell
    [taskTable registerClass:[UITableViewCell class]
           forCellReuseIdentifier:@"Cell"];
    
    // Create and configure the text field where new tasks will be typed
    textField = [[UITextField alloc] initWithFrame:fieldFrame];
    [textField setBorderStyle:UITextBorderStyleRoundedRect];
    [textField setPlaceholder:@"Type a task, tap Insert."];
    [textField becomeFirstResponder];
    
    // Create and configure a rounded rect Insert button
    // insertButton = [[UIButton alloc] initWithFrame:buttonFrame];
    insertButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [insertButton setFrame:buttonFrame];
    [insertButton setFrame:buttonFrame];
    //    NSLog(@"button type: %ld", (long)insertButton.buttonType);
    
    // Buttons behave using a target/action callback
    // Configure the Insert button's action to call this object's -addTask: method
    [insertButton addTarget:self action:@selector(addTask:) forControlEvents:UIControlEventTouchUpInside];
    
    // button title
    [insertButton setTitle:@"Insert" forState:UIControlStateNormal];
    
    // Add our three UI elements to the window
//    [[[[self window] rootViewController] view] addSubview:taskTable];
//    [[[[self window] rootViewController] view] addSubview:textField];
//    [[[[self window] rootViewController] view] addSubview:insertButton];
    [self.window.rootViewController.view addSubview:taskTable];
    [self.window.rootViewController.view addSubview:textField];
    [self.window.rootViewController.view addSubview:insertButton];
    
    // Finalize the window and put it on the screen
//    [[self window] setBackgroundColor:[UIColor whiteColor]];
//    [[self window] makeKeyAndVisible];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    // To improve performance, this method first checks
    // for an existing cell object that we can reuse
    // If there isn't one, then a new cell is created
    UITableViewCell *c = [taskTable dequeueReusableCellWithIdentifier:@"Cell"];
    // Then we (re)configure the cell based on the model object,
    // in this case the tasks array, ...
    NSString *item = [tasks objectAtIndex:indexPath.row];
    c.textLabel.text = item;
    // ... and hand the properly configured cell back to the table view
    return c;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [tasks count];
}

- (void)addTask:(id)sender {
    // get text
    NSString *text = textField.text;
    
    // quit if blank
    if ([text length] == 0){
        return;
    }
    
    // add to tasks array
    [tasks addObject:textField.text];
    
    // write to file
    [tasks writeToFile:docPath() atomically:YES];
    
    // reset text field to blank
    [textField setText:@""];
    
    // reload data so new task shows up
    [taskTable reloadData];
    
    // dismiss keyboard
    [textField resignFirstResponder];
}

@end
