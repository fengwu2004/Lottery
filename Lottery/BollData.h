//
//  ShuangSeQiuData.h
//  Lottery
//
//  Created by user on 16/2/5.
//  Copyright © 2016年 user. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BollData : NSObject

+ (BollData*)create:(NSSet*)reds blues:(NSSet*)blues;

@property (nonatomic, retain)NSSet *redNumbers;
@property (nonatomic, retain)NSSet *blueNumbers;

@end
