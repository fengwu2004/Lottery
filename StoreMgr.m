//
//  StoreMgr.m
//  Lottery
//
//  Created by user on 16/2/16.
//  Copyright © 2016年 user. All rights reserved.
//

#import "StoreMgr.h"
#import "FMDatabase.h"
#import "BollData.h"

@interface StoreMgr()

@property (nonatomic, retain) FMDatabase *db;

@end

@implementation StoreMgr

+ (StoreMgr*)sharedInstance {
	
	static StoreMgr *_instance = nil;
	
	static dispatch_once_t predicate;
	
	dispatch_once(&predicate, ^{
		
		_instance = [[StoreMgr alloc] init];
	});
	
	return _instance;
}

- (id)init {
	
	self = [super init];
	
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	
	NSString *documentDirectory = [paths objectAtIndex:0];
	
	NSString *dbPath = [documentDirectory stringByAppendingPathComponent:@"MyDatabase.db"];
	
	_db = [FMDatabase databaseWithPath:dbPath];
	
	[_db open];
	
	[_db executeUpdate:@"CREATE TABLE Bolls (red text, blue integer)"];
	
	[_db class];
	
	return self;
}

- (void)save:(NSString*)reds blues:(NSString*)blues {
	
	if (![_db open]) {
		
		return ;
	}

	[_db executeUpdate:@"INSERT INTO Bolls (red, blue) VALUES (?,?)", reds, blues];
	
	[_db close];
}

- (NSArray*)queryData {
	
	if (![_db open]) {
		
		return nil;
	}
	
	NSMutableArray* array = [[NSMutableArray alloc] init];
	
	FMResultSet *rs = [_db executeQuery:@"SELECT red, blue FROM Bolls"];
	
	while ([rs next]) {
		
		NSString *red = [rs stringForColumn:@"red"];
		
		NSArray *reds = [red componentsSeparatedByString:@";"];
		
		NSString *blue = [rs stringForColumn:@"blue"];
		
		NSArray *blues = [blue componentsSeparatedByString:@";"];
		
		NSSet *redSet = [NSSet setWithArray:reds];
		
		NSSet *blueSet = [NSSet setWithArray:blues];
		
		BollData *boll = [BollData create:redSet blues:blueSet];
		
		[array addObject:boll];
	}
	
	[_db class];
	
	return array;
}

@end
