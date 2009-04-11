//
//  CardSetTableViewCell.m
//  CCGTracker
//	Custom UITableViewCell implementation for the CardSet UITableView.
//
//  Created by Greg Heidorn on 4/10/09.
//  Copyright 2009 Eleven27, LLC. All rights reserved.
//

#import "CardSetTableViewCell.h"
#import "CardSet.h"

#define NAME_TAG 1
#define NUMBER_OF_CARDS 2

@implementation CardSetTableViewCell

@synthesize name, numberOfCards;

- (id)initWithFrame:(CGRect)frame reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithFrame:frame reuseIdentifier:reuseIdentifier]) {
		name = [[[UILabel alloc] initWithFrame:CGRectMake(10.0, 3.0, 200.0, 18.0)] autorelease];
		name.tag = NAME_TAG;
		name.font = [UIFont systemFontOfSize:15.0];
		name.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleHeight;
		[self addSubview:name];
		
		numberOfCards = [[[UILabel alloc] initWithFrame:CGRectMake(10.0, 21.0, 100.0, 18.0)] autorelease];	
		numberOfCards.tag = NUMBER_OF_CARDS;
		numberOfCards.font = [UIFont systemFontOfSize:12.0];
		numberOfCards.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleHeight;	
		[self addSubview:numberOfCards];
	}
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {

    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)buildLabels:(CardSet *)cardSet
{
	name.text = cardSet.name;
	numberOfCards.text = [NSString stringWithFormat:@"%d of %d", cardSet.totalCardsOwned, cardSet.totalCards];
}

- (void)dealloc {
    [super dealloc];
}


@end
