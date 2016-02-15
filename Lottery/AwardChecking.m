//
//  AwardChecking.m
//  Lottery
//
//  Created by user on 16/2/15.
//  Copyright © 2016年 user. All rights reserved.
//

#import "AwardChecking.h"
#import "BollData.h"

static AwardChecking *_instance;

@implementation AwardChecking

- (AwardResutl)checkResult:(BollData*)data {
	
	NSMutableSet *blueNumbers = [NSMutableSet setWithSet:data.blueNumbers];
	
	NSMutableSet *redNumbers = [NSMutableSet setWithSet:data.redNumbers];
	
	[blueNumbers intersectSet:_winningNumber.blueNumbers];
	
	[redNumbers intersectSet:_winningNumber.redNumbers];
	
	if (blueNumbers.count + redNumbers.count == 7) {
		
		return AwardResutl_Level1;
	}
	
	if (redNumbers.count == 6) {
		
		return AwardResutl_Level2;
	}
	
	if (redNumbers.count + blueNumbers.count == 6) {
		
		return AwardResutl_Level3;
	}
	
	if (redNumbers.count + blueNumbers.count == 5) {
		
		return AwardResutl_Level4;
	}
	
	if (redNumbers.count + blueNumbers.count == 4) {
		
		return AwardResutl_Level6;
	}
	
	return AwardResutl_None;
}

- (NSString*)resultString:(BollData*)data {
	
	AwardResutl result = [self checkResult:data];
	
	switch (result) {
		case AwardResutl_Level1:
			return @"一等奖";
		case AwardResutl_Level2:
			return @"二等奖";
		case AwardResutl_Level3:
			return @"三等奖";
		case AwardResutl_Level4:
			return @"四等奖";
		case AwardResutl_Level5:
			return @"五等奖";
		case AwardResutl_Level6:
			return @"六等奖";
		case AwardResutl_None:
			return @" ";
	}
	
	return @" ";
}

+ (AwardChecking*)sharedInstance {
	
	if (!_instance) {
		
		_instance = [[AwardChecking alloc]init];
	}
	
	return _instance;
}

@end
