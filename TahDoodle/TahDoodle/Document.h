//
//  Document.h
//  TahDoodle
//
//  Created by YB on 11/22/23.
//

#import <Cocoa/Cocoa.h>

@interface Document : NSDocument <NSTableViewDataSource>

@property (nonatomic) NSMutableArray *tasks;

// IBOutlet tells Xcode that the taskTable pointer will be assigned in Interface Builder and not in the class’s code files
@property (nonatomic) IBOutlet NSTableView *taskTable;

// IBAction tells Xcode that addTask: is an action method and that the associated target-action pair will be configured in Interface Builder and not in the class’s code files.
- (IBAction)addTask:(id)sender;
- (IBAction)removeTask:(id)sender;


@end
