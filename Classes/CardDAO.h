//
//  CardDAO.h
//  Data Access Object for Cards in the application.
//
//  Created by Greg Heidorn on 3/14/09.
//  Copyright 2009 Eleven27, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"
#import "CardSet.h"

@interface CardDAO : NSObject {
	
}

- (NSMutableArray *) getCardSets;
- (NSMutableArray *) getCardsForCardSet:(NSInteger) cardId;
- (Card *) getCard:(NSInteger)cardId;
- (CardSet *) getCardSet:(NSInteger)cardSetId;
- (void) updateTotalForCard:(NSInteger)cardId newTotal:(NSInteger)value;

@end
