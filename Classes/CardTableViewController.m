//
//  CardTableViewController.m
//  CCGTracker
//	UITableViewController for viewing Cards.
//
//  Created by Greg Heidorn on 4/5/09.
//  Copyright 2009 Eleven27, LLC. All rights reserved.
//

#import "CardTableViewController.h"
#import "CardTableViewCell.h"
#import "CardDAO.h"
#import "Card.h"
#import "CardSet.h"

#define CARD_NAME_TAG 1
#define CARD_TYPE_TAG 2
#define CARD_QUANTITY_TAG 3
#define CARD_NUM_TAG 4

@implementation CardTableViewController

@synthesize cards, cardViewController, selectedIndexPath;

- (id)initWithCardSet:(NSInteger)cardSetId {
	NSLog(@"CardTableViewController:cardSetId=%d", cardSetId);
    
	// initialize DAO
	CardDAO *cardDAO = [[CardDAO alloc] init];

	// retrieve card sets and add to controller
	self.cards = [cardDAO getCardsForCardSet:cardSetId];
	
	// retrieve card set for title
	CardSet *cardSet = [cardDAO getCardSet:cardSetId];
	
	// set table view title
	self.title = cardSet.name;
	
	[cardDAO release];
	
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


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [cards count];
}



// customize the table view cells
- (UITableViewCell *)tableView:(UITableView *)tv cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	NSLog(@"rendering cell @ %d", indexPath.row);
    static NSString *CellIdentifier = @"Cell";
    
    //UITableViewCell *cell = [tv dequeueReusableCellWithIdentifier:CellIdentifier];
	CardTableViewCell *cell = (CardTableViewCell *)[tv dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
//		cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier] autorelease];
		NSLog(@"cell is nil");
		cell = [[[CardTableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier] autorelease];
	}
	[cell buildLabels:[cards objectAtIndex:indexPath.row]];
	// index of table view correlates to index of array
	//Card *card = [cards objectAtIndex:indexPath.row];
	
	/*
	UILabel *cardNameLbl = [[[UILabel alloc] initWithFrame:CGRectMake(10.0, 3.0, 200.0, 18.0)] autorelease];
	cardNameLbl.tag = CARD_NAME_TAG;	
	cardNameLbl.text = card.name;
	cardNameLbl.font = [UIFont systemFontOfSize:12.0];

	if([card.rarity isEqualToString:@"Common"]) {
		cardNameLbl.textColor = [UIColor blackColor];
	} else if([card.rarity isEqualToString:@"Uncommon"]) {
		cardNameLbl.textColor = [UIColor colorWithRed:0.2 green:.8 blue:0 alpha:1];
	} else if([card.rarity isEqualToString:@"Rare"]) {
		cardNameLbl.textColor = [UIColor blueColor];
	} else if([card.rarity isEqualToString:@"Epic Rare"]) {
		cardNameLbl.textColor = [UIColor magentaColor];		
	}
	
	cardNameLbl.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleHeight;
	[cell.contentView addSubview:cardNameLbl];

	UILabel *cardNumLbl = [[[UILabel alloc] initWithFrame:CGRectMake(10.0, 21.0, 100.0, 18.0)] autorelease];	
	cardNumLbl.tag = CARD_NUM_TAG;
	cardNumLbl.text = card.number;
	cardNumLbl.font = [UIFont systemFontOfSize:12.0];
	cardNumLbl.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleHeight;	
	[cell.contentView addSubview:cardNumLbl];
	
	UILabel *cardTypeLbl = [[[UILabel alloc] initWithFrame:CGRectMake(110.0, 21.0, 200.0, 18.0)] autorelease];	
	cardTypeLbl.tag = CARD_TYPE_TAG;
	cardTypeLbl.text = card.type;
	cardTypeLbl.font = [UIFont systemFontOfSize:12.0];
	cardTypeLbl.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleHeight;	
	[cell.contentView addSubview:cardTypeLbl];
	
	UILabel *cardQuantityLbl = [[[UILabel alloc] initWithFrame:CGRectMake(250.0, 3.0, 50.0, 18.0)] autorelease];	
	cardQuantityLbl.tag = CARD_QUANTITY_TAG;
	cardQuantityLbl.text = [NSString stringWithFormat:@"%d", card.have];
	cardQuantityLbl.font = [UIFont systemFontOfSize:12.0];
	cardQuantityLbl.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleHeight;
	[cell.contentView addSubview:cardQuantityLbl];
	*/
	/*	
	// simple text representation
	// set cell text
	cell.text = card.name;
	
	cell.font = [UIFont systemFontOfSize:12.0];
	
	if([card.rarity isEqualToString:@"Common"]) {
		cell.textColor = [UIColor blackColor];
	} else if([card.rarity isEqualToString:@"Uncommon"]) {
		cell.textColor = [UIColor colorWithRed:0.2 green:.8 blue:0 alpha:1];
	} else if([card.rarity isEqualToString:@"Rare"]) {
		cell.textColor = [UIColor blueColor];
	} else if([card.rarity isEqualToString:@"Epic Rare"]) {
		cell.textColor = [UIColor magentaColor];		
	}
	*/	
		
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here. Create and push another view controller.
	// AnotherViewController *anotherViewController = [[AnotherViewController alloc] initWithNibName:@"AnotherView" bundle:nil];
	// [self.navigationController pushViewController:anotherViewController];
	// [anotherViewController release];
	/*
	NSLog(@"card picked: %d", indexPath.row);
	
	UIAlertView *alert = [[UIAlertView alloc] 
						  initWithTitle:@"Row selected!" 
						  message:@"asdf!" 
						  delegate:nil
						  cancelButtonTitle:@"Yes I did!"
						  otherButtonTitles:nil];
	[alert show];
	[alert release];
	 */
}

- (void)dealloc {
	[cards release];
	[cardViewController release];
	[selectedIndexPath release];
    [super dealloc];
}

@end