//
//  Card.h
//  CCGTracker
//
//  Created by Greg Heidorn on 3/14/09.
//  Copyright 2009 Eleven27, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject {
	NSInteger cardId;
	NSInteger cardSetId;
	NSString *name;
	NSString *number;
	NSString *type;
	NSString *rarity;
	NSInteger have;
}
@property (assign, nonatomic) NSInteger cardId;
@property (assign, nonatomic) NSInteger cardSetId;
@property (copy, nonatomic) NSString *name;
@property (copy, nonatomic) NSString *number;
@property (copy, nonatomic) NSString *type;
@property (copy, nonatomic) NSString *rarity;
@property (assign, nonatomic) NSInteger have;

@end