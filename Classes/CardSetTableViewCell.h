//
//  CardSetTableViewCell.h
//  CCGTracker
//	Custom UITableViewCell implementation for the CardSet UITableView.
//
//  Created by Greg Heidorn on 4/10/09.
//  Copyright 2009 Eleven27, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CardSet.h"

@interface CardSetTableViewCell : UITableViewCell
{
	UILabel *name;
	UILabel *numberOfCards;
}
@property (nonatomic, retain) UILabel *name;
@property (nonatomic, retain) UILabel *numberOfCards;

- (void)buildLabels:(CardSet *)cardSet;

@end
