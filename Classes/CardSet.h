//
//  CardSet.h
//  CCGTracker
//
//  Created by Greg Heidorn on 3/14/09.
//  Copyright 2009 Eleven27, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CardSet : NSObject {
	NSInteger cardSetId;
	NSString *name;
	NSInteger totalCards;
	NSInteger totalCardsOwned;	
}

@property (assign, nonatomic) NSInteger cardSetId;
@property (copy, nonatomic) NSString *name;
@property (assign, nonatomic) NSInteger totalCards;
@property (assign, nonatomic) NSInteger totalCardsOwned;

@end
