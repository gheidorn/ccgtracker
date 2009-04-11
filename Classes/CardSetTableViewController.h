//
//  CardSetTableViewController.h
//  CCGTracker
//	UITableViewController for viewing CardSets.
//
//  Created by Greg Heidorn on 3/23/09.
//  Copyright 2009 Eleven27, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CardTableViewController;

@interface CardSetTableViewController : UITableViewController {
	NSMutableArray *cardSets;
	CardTableViewController *cardTableViewController;
	IBOutlet UITableView *tableView;
}
@property (nonatomic, retain) NSMutableArray *cardSets;
@property (nonatomic, retain) CardTableViewController *cardTableViewController;
@end