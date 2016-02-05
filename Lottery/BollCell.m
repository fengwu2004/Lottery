//
//  BollCell.m
//  Lottery
//
//  Created by user on 16/2/5.
//  Copyright © 2016年 user. All rights reserved.
//

#import "BollCell.h"
#import "BollData.h"

//最多7个红球，2个蓝球

#define kLeft 10
#define kOffset 5

@interface BollCell()

@property (nonatomic, assign) CGFloat width;

@end

@implementation BollCell

- (void)awakeFromNib {
   // Initialization code
}

- (void)setBollData:(BollData *)bollData {
	
	_bollData = bollData;
	
	[self initSubviews];
}

- (CGFloat)deviceWidth {
	
	return [[UIScreen mainScreen] bounds].size.width;
}

- (CGFloat)deviceHeight {
	
	return [[UIScreen mainScreen] bounds].size.height;
}

- (UIView*)createRedBoll:(NSInteger)number index:(NSInteger)index {
	
	return nil;
}

- (UIView*)createBlueBoll:(NSInteger)number index:(NSInteger)index {
	
	return nil;
}

- (void)initSubviews {
	
	_width = ([self deviceWidth] - 8 * kOffset - 2 * kLeft)/9.0;
	
	NSArray *redBolls = _bollData.redNumbers;
	
	for (NSInteger i = 0; i < redBolls.count; ++i) {
		
		NSInteger number = [redBolls[i] integerValue];
		
		UIView *boll = [self createRedBoll:number index:i];
		
		[self addSubview:boll];
	}
	
	NSArray *blueBolls = _bollData.blueNumbers;
	
	for (NSInteger i = 0; i < blueBolls.count; ++i) {
		
		NSInteger number = [blueBolls[i] integerValue];
		
		UIView *boll = [self createBlueBoll:number index:i];
		
		[self addSubview:boll];
	}
}

@end
