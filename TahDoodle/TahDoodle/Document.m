//
//  Document.m
//  TahDoodle
//
//  Created by YB on 11/22/23.
//

#import "Document.h"

@interface Document ()

@end

@implementation Document

- (instancetype)init {
    self = [super init];
    if (self) {
        // Add your subclass-specific initialization here.
    }
    return self;
}

+ (BOOL)autosavesInPlace {
    return YES;
}


- (NSString *)windowNibName {
    // Override returning the nib file name of the document
    // If you need to use a subclass of NSWindowController or if your document supports multiple NSWindowControllers, you should remove this method and override -makeWindowControllers instead.
    return @"Document";
}


//- (NSData *)dataOfType:(NSString *)typeName error:(NSError **)outError {
//    // Insert code here to write your document to data of the specified type. If outError != NULL, ensure that you create and set an appropriate error if you return nil.
//    // Alternatively, you could remove this method and override -fileWrapperOfType:error:, -writeToURL:ofType:error:, or -writeToURL:ofType:forSaveOperation:originalContentsURL:error: instead.
//    [NSException raise:@"UnimplementedMethod" format:@"%@ is unimplemented", NSStringFromSelector(_cmd)];
//    return nil;
//}

//- (BOOL)readFromData:(NSData *)data ofType:(NSString *)typeName error:(NSError **)outError {
//    // Insert code here to read your document from the given data of the specified type. If outError != NULL, ensure that you create and set an appropriate error if you return NO.
//    // Alternatively, you could remove this method and override -readFromFileWrapper:ofType:error: or -readFromURL:ofType:error: instead.
//    // If you do, you should also override -isEntireFileLoaded to return NO if the contents are lazily loaded.
//    [NSException raise:@"UnimplementedMethod" format:@"%@ is unimplemented", NSStringFromSelector(_cmd)];
//    return YES;
//}

#pragma mark - NSDocument Overrides

-(void) addTask:(id)sender {
    // if no array yet (only declared in h-file), create one
    if(!self.tasks){
        self.tasks = [NSMutableArray new];
    }
    [self.tasks addObject:@"New Item"];
    NSLog(@"Add task button clicked.");
    // reload data to view in table immediately
    [self.taskTable reloadData];
    
    // -updateChangeCount: tells the application whether or not the document
    // has unsaved changes, NSChangeDone flags the document as unsaved
    [self updateChangeCount:NSChangeDone];
}

-(void) removeTask:(id)sender {
    // if no array yet (only declared in h-file), create one
    if(!self.tasks){
        return;
    }
    [self.tasks removeLastObject];
    NSLog(@"Remove task button clicked.");
    // reload data to view in table immediately
    [self.taskTable reloadData];
    
    // -updateChangeCount: tells the application whether or not the document
    // has unsaved changes, NSChangeDone flags the document as unsaved
    [self updateChangeCount:NSChangeDone];
}

// To add the ability to save and reopen a task list, you need to override two methods inherited from BNRDocument’s superclass, NSDocument:

// This method is called when our document is being saved
// You are expected to hand the caller an NSData object wrapping our data so that it can be written to disk
/* From Docs: Create an NSData from a property list. The format can be either NSPropertyListXMLFormat_v1_0 or NSPropertyListBinaryFormat_v1_0. The options parameter is currently unused and should be set to 0. If an error occurs the return value will be nil and the error parameter (if non-NULL) set to an autoreleased NSError describing the problem.
 */
-(NSData *) dataOfType:(NSString *)typeName error:(NSError *__autoreleasing  _Nullable *)outError {
    if (!self.tasks){
        self.tasks = [NSMutableArray new];
    }
    // Pack the tasks array into an NSData object
    NSData *data = [NSPropertyListSerialization dataWithPropertyList:self.tasks format:NSPropertyListXMLFormat_v1_0 options:0 error:outError];
    // Return the newly-packed NSData object
    return data;
}

// This method is called when a document is being loaded
// You are handed an NSData object and expected to pull our data out of it
// Extract the tasks
- (BOOL)readFromData:(NSData *)data
              ofType:(NSString *)typeName
               error:(NSError **)outError
{
    self.tasks = [NSPropertyListSerialization
                  propertyListWithData:data
                  options:NSPropertyListMutableContainers
                  format:NULL
                  error:outError];
    // return success or failure depending on success of the above call
    return (self.tasks != nil);
}

#pragma mark - Required Methods for NSTableViewDataSource (unless bindings used)

// This table view displays the tasks array,
// so the number of entries in the table view will be the same
// as the number of objects in the array
- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    return [self.tasks count];
}


/* This method is required for the "Cell Based" TableView, and is optional for the "View Based" TableView. If implemented in the latter case, the value will be set to the view at a given row/column if the view responds to -setObjectValue: (such as NSControl and NSTableCellView). Note that NSTableCellView does not actually display the objectValue, and its value is to be used for bindings. See NSTableCellView.h for more information.
 */
- (nullable id)tableView:(NSTableView *)tableView objectValueForTableColumn:(nullable NSTableColumn *)tableColumn row:(NSInteger)row {
    // Return the item from tasks that corresponds to the cell
    // that the table view wants to display
    NSLog(@"Showing task: %@", [self.tasks objectAtIndex:row]);
    return [self.tasks objectAtIndex:row];
}

#pragma mark - Optional Methods for NSTableViewDataSource

- (void)tableView:(NSTableView *)tableView
   setObjectValue:(id)object
   forTableColumn:(NSTableColumn *)tableColumn
              row:(NSInteger)row
{
    // When the user changes a task on the table view,
    // update the tasks array
    [self.tasks replaceObjectAtIndex:row withObject:object];
    // And then flag the document as having unsaved changes.
    [self updateChangeCount:NSChangeDone];
}
@end
