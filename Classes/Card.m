//
//  Card.m
//  CCGTracker
//
//  Created by Greg Heidorn on 3/14/09.
//  Copyright 2009 Eleven27, LLC. All rights reserved.
//

#import "Card.h"

@implementation Card

@synthesize cardId, cardSetId, name, number, type, rarity, have;

- (void)dealloc {
	[name release];
	[number release];
	[type release];
	[rarity release];
	[super dealloc];
}
@end