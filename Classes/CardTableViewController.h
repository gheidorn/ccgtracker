//
//  CardTableViewController.h
//  CCGTracker
//
//  Created by Greg Heidorn on 4/5/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CardViewController;

@interface CardTableViewController : UITableViewController {
	NSMutableArray *cards;
	CardViewController *cardViewController;
	IBOutlet UITableView *tableView;
	NSIndexPath *selectedIndexPath;
}
@property(nonatomic, retain) NSMutableArray *cards;
@property(nonatomic, retain) CardViewController *cardViewController;
@property(nonatomic, retain) NSIndexPath *selectedIndexPath;

- (id)initWithCardSet:(NSInteger)cardSetId;
@end
