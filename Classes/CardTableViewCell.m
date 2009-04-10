//
//  CardTableViewCell.m
//  CCGTracker
//
//  Created by Greg Heidorn on 4/9/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "CardTableViewCell.h"
#import "Card.h"

#define CARD_NAME_TAG 1
#define CARD_TYPE_TAG 2
#define CARD_QUANTITY_TAG 3
#define CARD_NUM_TAG 4

@implementation CardTableViewCell

@synthesize cardName, cardNumber, cardType, cardQuantity;

- (id)initWithFrame:(CGRect)frame reuseIdentifier:(NSString *)reuseIdentifier {
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
		
		cardQuantity = [[[UILabel alloc] initWithFrame:CGRectMake(250.0, 3.0, 50.0, 18.0)] autorelease];	
		cardQuantity.tag = CARD_QUANTITY_TAG;
		cardQuantity.font = [UIFont systemFontOfSize:12.0];
		cardQuantity.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleHeight;
		[self addSubview:cardQuantity];
    }
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {

    [super setSelected:selected animated:animated];
	NSLog(@"CardTableViewCell setSelected:animated:");
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
		cardName.textColor = [UIColor colorWithRed:0.2 green:.8 blue:0 alpha:1];
	} else if([card.rarity isEqualToString:@"Rare"]) {
		cardName.textColor = [UIColor blueColor];
	} else if([card.rarity isEqualToString:@"Epic Rare"]) {
		cardName.textColor = [UIColor magentaColor];		
	}
}

- (void)dealloc {
/*
	[cardName release];
	[cardType release];
	[cardNumber release];
	[cardQuantity release];
 */
    [super dealloc];
}

@end
