//
//  CardTableViewCell.h
//  CCGTracker
//
//  Created by Greg Heidorn on 4/9/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Card;

@interface CardTableViewCell : UITableViewCell
{
	UILabel *cardName;
	UILabel *cardType;
	UILabel *cardNumber;
	UILabel *cardQuantity;
}
@property (nonatomic, retain) UILabel *cardName;
@property (nonatomic, retain) UILabel *cardType;
@property (nonatomic, retain) UILabel *cardNumber;
@property (nonatomic, retain) UILabel *cardQuantity;

- (void)buildLabels:(Card *)card;

@end
