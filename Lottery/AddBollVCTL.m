//
//  AddBollVCTL.m
//  Lottery
//
//  Created by user on 16/2/15.
//  Copyright © 2016年 user. All rights reserved.
//

#import "AddBollVCTL.h"
#import "BollCollectionCell.h"
#import "BollDataMgr.h"
#import "BollData.h"

@interface AddBollVCTL ()<UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, retain) IBOutlet UICollectionView *ibRedCollection;
@property (nonatomic, retain) IBOutlet UICollectionView *ibBlueCollection;
@property (nonatomic, retain) NSMutableSet *redNumbers;
@property (nonatomic, retain) NSMutableSet *blueNumbers;
@property (nonatomic, retain) IBOutlet NSLayoutConstraint *ibRedHeight;
@property (nonatomic, retain) IBOutlet NSLayoutConstraint *ibBlueHeight;
@property (nonatomic, retain) UIBarButtonItem *rightBarItem;

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
	
	[self updateConstraint];
	
	_ibRedCollection.allowsMultipleSelection = YES;
	
	_ibBlueCollection.allowsMultipleSelection = YES;
	
	self.automaticallyAdjustsScrollViewInsets = NO;
	
	_redNumbers = [[NSMutableSet alloc] init];
	
	_blueNumbers = [[NSMutableSet alloc] init];
	
	_rightBarItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"addnewitem"] style:UIBarButtonItemStylePlain target:self action:@selector(onNewBolls)];
	
	self.navigationItem.rightBarButtonItem = _rightBarItem;
	
	_rightBarItem.enabled = NO;
}

- (void)clearCurrentBolls {
	
	NSArray *reds = [_redNumbers allObjects];
	
	for (NSNumber *num in reds) {
		
		NSIndexPath *indexPath = [NSIndexPath indexPathForItem:[num integerValue] - 1 inSection:0];
		
		[_ibRedCollection deselectItemAtIndexPath:indexPath animated:NO];
	}
	
	[_redNumbers removeAllObjects];
	
	NSArray *blues = [_blueNumbers allObjects];
	
	for (NSNumber *num in blues) {
		
		NSIndexPath *indexPath = [NSIndexPath indexPathForItem:[num integerValue]- 1 inSection:0];
		
		[_ibBlueCollection deselectItemAtIndexPath:indexPath animated:NO];
	}
	
	[_blueNumbers removeAllObjects];
	
	_rightBarItem.enabled = NO;
}

- (void)saveToDB {

	BollData *boll = [BollData create:_redNumbers blues:_blueNumbers];
	
	[[BollDataMgr sharedInstance] save:boll];
}

- (void)onNewBolls {
	
	[self saveToDB];
	
	[self clearCurrentBolls];
}

- (void)updateConstraint {
	
	NSInteger redCol = ([self deviceWidth]- 10)/50;
	
	NSInteger redRow = ceil(33.0/redCol);
	
	_ibRedHeight.constant = 10 + redRow * 50;
	
	NSInteger blueCol = ([self deviceWidth]- 10)/50;
	
	NSInteger blueRow = ceil(33.0/blueCol);
	
	_ibBlueHeight.constant = 10 + blueRow * 50;
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
	
	NSNumber *num = [NSNumber numberWithInteger:indexPath.row + 1];
	
	NSLog(@"%d", (int)(indexPath.row));
	
	if (collectionView == _ibRedCollection) {
		
		[_redNumbers removeObject:num];
	}
	else {

		[_blueNumbers removeObject:num];
	}
	
	_rightBarItem.enabled = _redNumbers.count >= 6 && _blueNumbers.count >= 1;
	
	return YES;
}

- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
	
	NSNumber *num = [NSNumber numberWithInteger:indexPath.row + 1];
	
	NSLog(@"%d", (int)(indexPath.row));
	
	if (collectionView == _ibRedCollection) {
		
		[_redNumbers addObject:num];
	}
	else {
		
		[_blueNumbers addObject:num];
	}
	
	_rightBarItem.enabled = _redNumbers.count >= 6 && _blueNumbers.count >= 1;
	
	return YES;
}

@end
