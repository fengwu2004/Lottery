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
@property (nonatomic, retain) IBOutlet UICollectionView *ibBlueCollection;
@property (nonatomic, retain) NSMutableSet *redNumbers;
@property (nonatomic, retain) NSMutableSet *blueNumbers;

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
	
	[_ibBlueCollection registerNib:nib forCellWithReuseIdentifier:@"BollCollectionCell"];
	
	_ibRedCollection.allowsMultipleSelection = YES;
	
	_ibBlueCollection.allowsMultipleSelection = YES;
	
	self.automaticallyAdjustsScrollViewInsets = NO;
	
	_redNumbers = [[NSMutableSet alloc] init];
	
	_blueNumbers = [[NSMutableSet alloc] init];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
	
	return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
	
	if (_ibRedCollection == collectionView) {
		
		return 33;
	}
	
	return 16;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
	
	static NSString * identifier = @"BollCollectionCell";
	
	BollCollectionCell *cell = (BollCollectionCell *)[collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
	
	[cell setNumber:indexPath.row + 1];
	
	if (collectionView == _ibRedCollection) {
		
		[cell setColor:[UIColor redColor]];
	}
	else {
		
		[cell setColor:[UIColor blueColor]];
	}

	return cell;
}

- (BOOL)collectionView:(UICollectionView *)collectionView shouldDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
	
	NSNumber *num = [NSNumber numberWithInteger:indexPath.row];
	
	if (collectionView == _ibRedCollection) {
		
		[_redNumbers removeObject:num];
	}
	else {

		[_blueNumbers removeObject:num];
	}
	
	return YES;
}

- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
	
	NSNumber *num = [NSNumber numberWithInteger:indexPath.row];
	
	if (collectionView == _ibRedCollection) {
		
		[_redNumbers addObject:num];
	}
	else {
		
		[_blueNumbers addObject:num];
	}
	
	return YES;
}

@end
