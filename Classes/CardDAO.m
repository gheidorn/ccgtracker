//
//  CardDAO.m
//  Data Access Object for Cards in the application.
//
//  Created by Greg Heidorn on 3/14/09.
//  Copyright 2009 Eleven27, LLC. All rights reserved.
//

#import "CardDAO.h"
#import "Card.h"
#import "CardSet.h"
#import "FMDatabase.h"
#import "FMResultSet.h"

#define DB_NAME @"ccgtracker.db"

@implementation CardDAO

- (void)createEditableCopyOfDatabaseIfNeeded {
    // test for existence.
    BOOL success;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
	//NSLog(@"path %@", documentsDirectory);
    NSString *writableDBPath = [documentsDirectory stringByAppendingPathComponent:DB_NAME];
	//NSLog(@"path %@", writableDBPath);
    success = [fileManager fileExistsAtPath:writableDBPath];
	//NSLog(@"database exists? %d", success);
    
	if (success) return;
    
	// writable database does not exist, so copy the default to the appropriate location.
    NSString *defaultDBPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:DB_NAME];
    NSError *error;
    success = [fileManager copyItemAtPath:defaultDBPath toPath:writableDBPath error:&error];
    if (!success) {
        NSAssert1(0, @"Failed to create writable database file with message '%@'.", [error localizedDescription]);
    }
}

- (NSMutableArray *) getCardSets
{
	[self createEditableCopyOfDatabaseIfNeeded];
	
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectory = [paths objectAtIndex:0];
	NSString *path = [documentsDirectory stringByAppendingPathComponent:DB_NAME];
		
	NSLog(@"path %@", path);
	
	FMDatabase* db = [FMDatabase databaseWithPath:path];
    if (![db open])
	{
        NSLog(@"Could not open db.");
        return nil;
    }
	
	FMResultSet *rs = [db executeQuery:@"select * from card_set"];
//	FMResultSet *rs = [db executeQuery:@"select cs.name, c.name from card_set cs, card c where cs.id = c.card_set_id"];
	NSMutableArray *cardSets = [[NSMutableArray alloc] init];
	while ([rs next])
	{
		NSLog(@"%@ - %@",
			  [rs stringForColumnIndex:0],
			  [rs stringForColumnIndex:1]);
		CardSet *cardSet = [[CardSet alloc] init];
		cardSet.cardSetId = [rs intForColumnIndex:0];
		cardSet.name = [rs stringForColumnIndex:1];
		cardSet.totalCards = [rs intForColumnIndex:2];
		[cardSets addObject:cardSet];
		[cardSet release];
	}
	[rs close];
	[db close];
	return cardSets;
}

- (NSMutableArray *) getCardsForCardSet:(NSInteger)cardSetId
{
	NSLog(@"getCardsForSet [cardSetID = %d]", cardSetId);
	
	[self createEditableCopyOfDatabaseIfNeeded];
	
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectory = [paths objectAtIndex:0];
	NSString *path = [documentsDirectory stringByAppendingPathComponent:DB_NAME];
	
	FMDatabase* db = [FMDatabase databaseWithPath:path];
    
	if (![db open]) {
        NSLog(@"Could not open db.");
        return nil;
    }
	
	NSString *sql = [NSString stringWithFormat:@"select * from card where card_set_id = %d", cardSetId];
	FMResultSet *rs = [db executeQuery:sql];
	if(rs == nil) {
		NSLog(@"Err %d: %@", [db lastErrorCode], [db lastErrorMessage]);
	}
	NSMutableArray *cards = [[NSMutableArray alloc] init];
	
	while ([rs next]) {
		// just print out what we've got in a number of formats.
		/*
		NSLog(@"%@ - %@",
			  [rs stringForColumnIndex:0],
			  [rs stringForColumnIndex:1]);
		*/
		Card *card = [[Card alloc] init];
		card.cardId = [rs intForColumnIndex:0];
		card.cardSetId = [rs intForColumnIndex:1];
		card.name = [rs stringForColumnIndex:2];
		card.number = [rs stringForColumnIndex:3];
		card.type = [rs stringForColumnIndex:4];
		card.rarity = [rs stringForColumnIndex:5];
		card.have = [rs intForColumnIndex:6];
		[cards addObject:card];
		[card release];
	}
	[rs close];
	[db close];
	return cards;
}

- (Card *) getCard:(NSInteger)cardId
{
	[self createEditableCopyOfDatabaseIfNeeded];
	
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectory = [paths objectAtIndex:0];
	NSString *path = [documentsDirectory stringByAppendingPathComponent:DB_NAME];
	FMDatabase* db = [FMDatabase databaseWithPath:path];
    if (![db open])
	{
        NSLog(@"Could not open db.");
        return nil;
    }
	NSLog(@"Opened db at path=%@", path);
	FMResultSet *rs = [db executeQuery:@"select * from card where id = %d", cardId];
	Card *card = [[Card alloc] init];
	if ([rs next])
	{
		NSLog(@"%@ - %@",
			  [rs stringForColumnIndex:0],
			  [rs stringForColumnIndex:1]);
		card.cardId = [rs intForColumnIndex:0];
		card.cardSetId = [rs intForColumnIndex:1];
		card.name = [rs stringForColumnIndex:2];
		card.number = [rs stringForColumnIndex:3];
		card.type = [rs stringForColumnIndex:4];
		card.rarity = [rs stringForColumnIndex:5];
		card.have = [rs intForColumnIndex:6];
		[card release];
	}
	[rs close];
	[db close];
	return card;
}

- (CardSet *) getCardSet:(NSInteger)cardSetId
{
	[self createEditableCopyOfDatabaseIfNeeded];
	
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectory = [paths objectAtIndex:0];
	NSString *path = [documentsDirectory stringByAppendingPathComponent:DB_NAME];
	
	FMDatabase* db = [FMDatabase databaseWithPath:path];
    
	if (![db open])
	{
        NSLog(@"Could not open db.");
        return nil;
    }
	
	NSString *sql = [NSString stringWithFormat:@"select * from card_set where id = %d", cardSetId];
	FMResultSet *rs = [db executeQuery:sql];
	
	CardSet *cardSet = [[CardSet alloc] init];
	
	if ([rs next])
	{
		/*
		NSLog(@"%@ - %@",
			  [rs stringForColumnIndex:0],
			  [rs stringForColumnIndex:1]);
		*/
		cardSet.cardSetId = [rs intForColumnIndex:0];
		cardSet.name = [rs stringForColumnIndex:1];
		cardSet.totalCards = [rs intForColumnIndex:2];
		//cardSet.totalCardsOwned = [rs intForColumnIndex:4];
		//[cardSet release];
	}
	[rs close];
	[db close];
	return cardSet;
}

- (void) updateTotalForCard:(NSInteger)cardId newTotal:(NSInteger)value
{
	[self createEditableCopyOfDatabaseIfNeeded];
	
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectory = [paths objectAtIndex:0];
	NSString *path = [documentsDirectory stringByAppendingPathComponent:DB_NAME];
	FMDatabase* db = [FMDatabase databaseWithPath:path];
    if (![db open])
	{
        NSLog(@"Could not open db.");
    }

	int sqlite_ok = [db executeUpdate:@"update card set have = ? where id = ?", [NSNumber numberWithInt:value], [NSNumber numberWithInt:cardId]];
	if (!sqlite_ok) {
        NSLog(@"Err %d: %@", [db lastErrorCode], [db lastErrorMessage]);
    }
	NSLog(@"update card set have = %d where id = %d", value, cardId);
	[db close];
}
@end