//
//  BollDataMgr.h
//  Lottery
//
//  Created by user on 16/2/17.
//  Copyright © 2016年 user. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BollData;

@interface BollDataMgr : NSObject

@property (nonatomic, retain) NSMutableArray *bollsList;

+ (BollDataMgr*)sharedInstance;

- (void)save:(BollData*)boll;

@end
