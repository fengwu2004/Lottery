//
//  BollDataMgr.m
//  Lottery
//
//  Created by user on 16/2/17.
//  Copyright © 2016年 user. All rights reserved.
//

#import "BollDataMgr.h"
#import "StoreMgr.h"
#import "BollData.h"

@interface BollDataMgr()


@end

@implementation BollDataMgr

+ (BollDataMgr*)sharedInstance {
	
	static BollDataMgr *_instance = nil;
	
	static dispatch_once_t predicate;
	
	dispatch_once(&predicate, ^{
		
		_instance = [[BollDataMgr alloc] init];
	});
	
	return _instance;
}

- (id)init {
	
	self = [super init];
	
	_bollsList = [[StoreMgr sharedInstance] queryData];
	
	return self;
}

- (void)save:(BollData*)boll {
	
	[_bollsList addObject:boll];
	
	NSMutableString *reds = [[NSMutableString alloc] init];
	
	[boll.redNumbers enumerateObjectsUsingBlock:^(id  _Nonnull obj, BOOL * _Nonnull stop) {
		
		NSNumber *num = (NSNumber *)obj;
		
		[reds appendString:num.stringValue];
		
		[reds appendString:@";"];
	}];
	
	NSInteger maxIndex = MAX(0, ([reds length] - 1));
	
	NSString *redsStr = [reds substringToIndex:maxIndex];
	
	NSMutableString *blues = [[NSMutableString alloc] init];
	
	[boll.blueNumbers enumerateObjectsUsingBlock:^(id  _Nonnull obj, BOOL * _Nonnull stop) {
		
		NSNumber *num = (NSNumber *)obj;
		
		[blues appendString:num.stringValue];
		
		[blues appendString:@";"];
	}];
	
	maxIndex = MAX(0, ([blues length] - 1));
	
	NSString *bluesStr = [blues substringToIndex:maxIndex];
	
	[[StoreMgr sharedInstance] save:redsStr blues:bluesStr];
}

@end
