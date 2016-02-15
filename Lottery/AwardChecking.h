//
//  AwardChecking.h
//  Lottery
//
//  Created by user on 16/2/15.
//  Copyright © 2016年 user. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BollData;

typedef NS_ENUM(NSInteger, AwardResutl) {
	
	AwardResutl_Level1,
	AwardResutl_Level2,
	AwardResutl_Level3,
	AwardResutl_Level4,
	AwardResutl_Level5,
	AwardResutl_Level6,
	AwardResutl_None,
};

@interface AwardChecking : NSObject

@property (nonatomic, retain)BollData *winningNumber;

+ (AwardChecking*)sharedInstance;

- (AwardResutl)checkResult:(BollData*)data;

- (NSString*)resultString:(BollData*)data;

@end
