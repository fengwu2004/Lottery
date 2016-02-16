//
//  BollCollectionCell.m
//  Lottery
//
//  Created by user on 16/2/15.
//  Copyright © 2016年 user. All rights reserved.
//

#import "BollCollectionCell.h"

@interface BollCollectionCell()

@property (nonatomic, retain) IBOutlet UILabel *ibNum;

@end

@implementation BollCollectionCell

- (void)awakeFromNib {
	
	[super awakeFromNib];
	
	self.layer.cornerRadius = 20;
	
	self.clipsToBounds = YES;
	
	self.layer.borderColor = [_color CGColor];
	
	self.layer.borderWidth = 1;
	
	self.backgroundColor = [UIColor grayColor];
}

- (void)setNumber:(NSInteger)number {
	
	[_ibNum setText:[NSString stringWithFormat:@"%d", (int)number]];
}

- (void)setSelected:(BOOL)selected {
	
	[super setSelected:selected];

	if (selected) {
		
		self.backgroundColor = _color;
	}
	else {
		
		self.backgroundColor = [UIColor grayColor];
	}
}

@end
