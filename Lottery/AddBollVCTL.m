//
//  AddBollVCTL.m
//  Lottery
//
//  Created by user on 16/2/15.
//  Copyright © 2016年 user. All rights reserved.
//

#import "AddBollVCTL.h"
#import "BollCollectionCell.h"

@interface AddBollVCTL ()<UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, retain) IBOutlet UICollectionView *ibRedCollection;

@end

@implementation AddBollVCTL

- (CGFloat)deviceWidth {
	
	return [[UIScreen mainScreen] bounds].size.width;
}

- (CGFloat)deviceHeight {
	
	return [[UIScreen mainScreen] bounds].size.height;
}

- (void)viewDidLoad {
	
  [super viewDidLoad];
	
	UINib *nib = [UINib nibWithNibName:@"BollCollectionCell" bundle:nil];
	
	[_ibRedCollection registerNib:nib forCellWithReuseIdentifier:@"BollCollectionCell"];
	
	self.automaticallyAdjustsScrollViewInsets = NO;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
	
	return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
	
	return 15;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
	
	static NSString * identifier = @"BollCollectionCell";
	
	BollCollectionCell *cell = (BollCollectionCell *)[collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
	
	[cell setNumber:indexPath.row + 1];

	return cell;
}


@end
