//
//  CardSetTableViewController.m
//  CCGTracker
//	UITableViewController for viewing CardSets.
//
//  Created by Greg Heidorn on 3/23/09.
//  Copyright 2009 Eleven27, LLC. All rights reserved.
//

#import "CardSetTableViewController.h"
#import "CardDAO.h"
#import "CardSet.h"
#import "CardSetTableViewCell.h"
#import "CardTableViewController.h"

@implementation CardSetTableViewController

@synthesize cardSets;
@synthesize cardTableViewController;

- (id)initWithStyle:(UITableViewStyle)style {
    
	if (self = [super initWithStyle:style]) {
    }
	
	// initialize DAO
	CardDAO *cardDAO = [[CardDAO alloc] init];
	
	// retrieve card sets and add to controller
	self.cardSets = [cardDAO getCardSets];
	
	[cardDAO release];

	self.title = @"Card Sets";
	
    return self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}

#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

// return the number of rows in the table view
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [cardSets count];
}

// customize the table view cells
- (UITableViewCell *)tableView:(UITableView *)tv cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    //UITableViewCell *cell = [tv dequeueReusableCellWithIdentifier:CellIdentifier];
	CardSetTableViewCell *cell = (CardSetTableViewCell *)[tv dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[CardSetTableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier] autorelease];
    }
	
    [cell buildLabels:[cardSets objectAtIndex:indexPath.row]];
	/*
	// index of table view correlates to index of array
	CardSet *cardSet = [cardSets objectAtIndex:indexPath.row];
	
	// set cell text
	cell.text = cardSet.name;
	*/
    return cell;
}

// action to perform when row is selected
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	NSLog(@"selected row at indexpath %d", [indexPath row]);
	CardTableViewController *controller = [[CardTableViewController alloc] initWithNibName:@"CardTableViewController" bundle:nil];
	[controller initWithCardSet:[indexPath row] + 1];
	[self.navigationController pushViewController:controller animated:YES];
	[controller release];
}

#pragma mark -
#pragma mark Table Delegate and Data Source Methods

// The accessory type is the image displayed on the far right of each table cell. In order for the delegate method
// tableView:accessoryButtonClickedForRowWithIndexPath: to be called, you must return the "Detail Disclosure Button" type.
- (UITableViewCellAccessoryType)tableView:(UITableView *)tv accessoryTypeForRowWithIndexPath:(NSIndexPath *)indexPath {
    return UITableViewCellAccessoryDisclosureIndicator;
}

- (void)dealloc {
	[cardSets release];
	[cardTableViewController release];
    [super dealloc];
}

@end

