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
	
	self.layer.cornerRadius = 15;
	
	self.clipsToBounds = YES;
	
	self.backgroundColor = [UIColor redColor];
}

- (void)setNumber:(NSInteger)number {
	
	[_ibNum setText:[NSString stringWithFormat:@"%d", (int)number]];
}

@end
