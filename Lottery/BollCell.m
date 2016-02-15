//
//  BollCell.m
//  Lottery
//
//  Created by user on 16/2/5.
//  Copyright © 2016年 user. All rights reserved.
//

#import "BollCell.h"
#import "BollData.h"
#import "AwardChecking.h"

//最多7个红球，2个蓝球

#define kLeft 10

@interface BollCell()

@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat offset;

@end

@implementation BollCell

- (void)awakeFromNib {
   // Initialization code
}

- (void)setBollData:(BollData *)bollData{
	
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
	
	UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(kLeft + (_width + _offset) * index, 0, _width, _width)];
	
	label.textAlignment = NSTextAlignmentCenter;
	
	[label setText:[NSString stringWithFormat:@"%d", (int)number]];
	
	label.layer.cornerRadius = _width * 0.5;
	
	label.clipsToBounds = YES;
	
	label.backgroundColor = [UIColor redColor];
	
	label.center = CGPointMake(label.center.x, self.bounds.size.height * 0.5);
	
	return label;
}

- (UIView*)createBlueBoll:(NSInteger)number index:(NSInteger)index {
	
	UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(kLeft + (_width + _offset) * index, 0, _width, _width)];
	
	label.layer.cornerRadius = _width * 0.5;
	
	label.textAlignment = NSTextAlignmentCenter;
	
	label.backgroundColor = [UIColor blueColor];
	
	[label setText:[NSString stringWithFormat:@"%d", (int)number]];
	
	label.clipsToBounds = YES;
	
	label.center = CGPointMake(label.center.x, self.bounds.size.height * 0.5);
	
	return label;
}

- (void)initSubviews {
	
	if (_showResult) {
	
		_offset = 10;
		
		_width = ([self deviceWidth] - 60 - 8 * _offset - 2 * kLeft)/9.0;
	}
	else {
		
		_offset = 15;
		
		_width = ([self deviceWidth] - 8 * _offset - 2 * kLeft)/9.0;
	}
	
	NSArray *redBolls = [_bollData.redNumbers allObjects];
	
	for (NSInteger i = 0; i < redBolls.count; ++i) {
		
		NSInteger number = [redBolls[i] integerValue];
		
		UIView *boll = [self createRedBoll:number index:i];
		
		[self addSubview:boll];
	}
	
	NSArray *blueBolls = [_bollData.blueNumbers allObjects];
	
	for (NSInteger i = 0; i < blueBolls.count; ++i) {
		
		NSInteger number = [blueBolls[i] integerValue];
		
		UIView *boll = [self createBlueBoll:number index:i + redBolls.count];
		
		[self addSubview:boll];
	}
	
	if (_showResult) {
		
		UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake([self deviceWidth] - 80, 2, 60, 40)];
		
		NSString *result = [[AwardChecking sharedInstance] resultString:_bollData];
		
		[label setText:result];
		
		[self addSubview:label];
	}
}

@end
