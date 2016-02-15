//
//  ShuangSeQiuData.m
//  Lottery
//
//  Created by user on 16/2/5.
//  Copyright © 2016年 user. All rights reserved.
//

#import "BollData.h"

@implementation BollData

+ (BollData*)create:(NSArray*)reds blues:(NSArray*)blues {
	
	BollData *boll = [[BollData alloc] init];
	
	boll.redNumbers = reds;
	
	boll.blueNumbers = blues;
	
	return boll;
}

@end
