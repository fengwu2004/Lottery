//
//  ShuangSeQiuData.m
//  Lottery
//
//  Created by user on 16/2/5.
//  Copyright © 2016年 user. All rights reserved.
//

#import "BollData.h"

@implementation BollData

+ (BollData*)create:(NSSet*)reds blues:(NSSet*)blues {
	
	BollData *boll = [[BollData alloc] init];
	
	boll.redNumbers = [NSSet setWithSet:reds];
	
	boll.blueNumbers = [NSSet setWithSet:blues];
	
	return boll;
}

@end
