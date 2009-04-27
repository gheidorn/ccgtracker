//
//  CardTableViewCell.m
//  CCGTracker
//
//  Created by Greg Heidorn on 4/9/09.
//  Copyright 2009 Eleven27, LLC. All rights reserved.
//

#import "CardTableViewCell.h"
#import "Card.h"
#import "PossessionIndicatorView.h"

#define CARD_NAME_TAG 1
#define CARD_TYPE_TAG 2
#define CARD_QUANTITY_TAG 3
#define CARD_NUM_TAG 4

@implementation CardTableViewCell

@synthesize cardName, cardNumber, cardType, cardQuantity, haveCard;

- (id)initWithFrame:(CGRect)frame reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithFrame:frame reuseIdentifier:reuseIdentifier]) {
		cardName = [[[UILabel alloc] initWithFrame:CGRectMake(10.0, 3.0, 200.0, 18.0)] autorelease];
		cardName.tag = CARD_NAME_TAG;
		cardName.font = [UIFont systemFontOfSize:12.0];
		cardName.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleHeight;
		[self addSubview:cardName];
		
		cardNumber = [[[UILabel alloc] initWithFrame:CGRectMake(10.0, 21.0, 100.0, 18.0)] autorelease];	
		cardNumber.tag = CARD_NUM_TAG;
		cardNumber.font = [UIFont systemFontOfSize:12.0];
		cardNumber.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleHeight;	
		[self addSubview:cardNumber];
		
		cardType = [[[UILabel alloc] initWithFrame:CGRectMake(110.0, 21.0, 200.0, 18.0)] autorelease];	
		cardType.tag = CARD_TYPE_TAG;
		cardType.font = [UIFont systemFontOfSize:12.0];
		cardType.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleHeight;	
		[self addSubview:cardType];
		
		cardQuantity = [[[UITextField alloc] initWithFrame:CGRectMake(260.0, 3.0, 30.0, 20.0)] autorelease];
		cardQuantity.borderStyle = UITextBorderStyleBezel;
		cardQuantity.tag = CARD_QUANTITY_TAG;
		cardQuantity.font = [UIFont systemFontOfSize:10.0];
		cardQuantity.textAlignment = UITextAlignmentCenter;
		cardQuantity.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleHeight;
		[self addSubview:cardQuantity];
		
		UIImage *dontHaveImg = [[UIImage imageNamed:@"down.png"] retain];
		haveCard = [[PossessionIndicatorView alloc] initWithImage:dontHaveImg];
		haveCard.frame = CGRectMake(260, 10, 24, 24);
		// haveCard.
		[self addSubview:haveCard];
    }
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
//    [super setSelected:selected animated:animated];
//	NSLog(@"CardTableViewCell setSelected:animated:");
    // Configure the view for the selected state
}

- (void)buildLabels:(Card *)card
{
	cardName.text = card.name;
	cardType.text = card.type;
	cardNumber.text = card.number;
	cardQuantity.text = [NSString stringWithFormat:@"%d", card.have];
	
	if([card.rarity isEqualToString:@"Common"]) {
		cardName.textColor = [UIColor blackColor];
	} else if([card.rarity isEqualToString:@"Uncommon"]) {
		cardName.textColor = [UIColor colorWithRed:0.2 green:.75 blue:.2 alpha:1];
	} else if([card.rarity isEqualToString:@"Rare"]) {
		cardName.textColor = [UIColor blueColor];
	} else if([card.rarity isEqualToString:@"Epic Rare"]) {
		cardName.textColor = [UIColor magentaColor];		
	}
}

- (void)dealloc
{
    [super dealloc];
}

@end
