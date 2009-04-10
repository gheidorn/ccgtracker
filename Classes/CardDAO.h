//
//  CardDAO.h
//  Data Access Object for Cards in the Trading Card Tracker system.
//
//  Created by Greg Heidorn on 3/14/09.
//  Copyright 2009 Eleven27, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface CardDAO : NSObject {
	
}

- (NSMutableArray *) getCardSets;
- (NSMutableArray *) getCardsForCardSet:(NSInteger) cardId;
- (Card *) getCard:(NSInteger)cardId;
- (void) updateTotalForCard:(NSInteger)cardId newTotal:(NSInteger)value;

@end
