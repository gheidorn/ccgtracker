//
//  CardTableViewCell.h
//  CCGTracker
//
//  Created by Greg Heidorn on 4/9/09.
//  Copyright 2009 Eleven27, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Card, PossessionIndicatorView;

@interface CardTableViewCell : UITableViewCell
{
	UILabel *cardName;
	UILabel *cardType;
	UILabel *cardNumber;
	//UILabel *cardQuantity;
	UITextField *cardQuantity;
	PossessionIndicatorView *haveCard;
}
@property (nonatomic, retain) UILabel *cardName;
@property (nonatomic, retain) UILabel *cardType;
@property (nonatomic, retain) UILabel *cardNumber;
//@property (nonatomic, retain) UILabel *cardQuantity;
@property (nonatomic, retain) UITextField *cardQuantity;
@property (nonatomic, retain) PossessionIndicatorView *haveCard;

- (void)buildLabels:(Card *)card;

@end
