//
//  StoreMgr.h
//  Lottery
//
//  Created by user on 16/2/16.
//  Copyright © 2016年 user. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BollData;

@interface StoreMgr : NSObject

+ (StoreMgr*)sharedInstance;

- (void)save:(NSString*)reds blues:(NSString*)blues;

- (NSMutableArray<__kindof BollData*>*)queryData;

@end
