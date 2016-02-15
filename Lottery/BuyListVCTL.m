//
//  BuyListVCTL.m
//  Lottery
//
//  Created by user on 16/2/5.
//  Copyright © 2016年 user. All rights reserved.
//

#import "BuyListVCTL.h"
#import "BollData.h"
#import "BollCell.h"

typedef NS_ENUM(NSInteger, dataType){
 
	data_result,
	data_myBolls,
	data_max,
};

@interface BuyListVCTL () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, retain) IBOutlet UITableView *ibTableView;
@property (nonatomic, retain) NSMutableArray<__kindof BollData*> *dataSource;

@end

@implementation BuyListVCTL

- (void)test {
	
	if (_dataSource) {
		
		return;
	}
	
	_dataSource = [[NSMutableArray alloc] init];
	
	BollData *boll1 = [BollData create:@[@5, @8, @9, @5, @6, @7] blues:@[@32]];
	
	BollData *boll2 = [BollData create:@[@5, @8, @9, @5, @6, @7] blues:@[@31]];
	
	BollData *boll3 = [BollData create:@[@5, @8, @9, @5, @6, @7] blues:@[@33]];
	
	BollData *boll4 = [BollData create:@[@5, @8, @9, @5, @6, @7] blues:@[@34]];
	
	BollData *boll5 = [BollData create:@[@5, @8, @9, @5, @6, @7] blues:@[@35]];
	
	[_dataSource addObject:boll1];
	
	[_dataSource addObject:boll2];
	
	[_dataSource addObject:boll3];
	
	[_dataSource addObject:boll4];
	
	[_dataSource addObject:boll5];
}

- (void)viewDidLoad {
	
  [super viewDidLoad];
	
	[self test];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	
	if (section == data_result) {
		
		return 1;
	}
	
	return _dataSource.count;
}

- (UITableViewCell *)cellByClassName:(NSString *)className inNib:(NSString *)nibName forTableView:(UITableView *)tableView {
	
	Class cellClass = NSClassFromString(className);
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:className];
	
	if (cell == nil) {
		
		NSArray *nib = [[NSBundle mainBundle] loadNibNamed:nibName owner:self options:nil];
		
		for (id oneObject in nib) {
			
			if ([oneObject isMemberOfClass:cellClass]) {
				
				return oneObject;
			}
		}
	}
	
	return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	
	return data_max;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	BollData *data;
	
	if (indexPath.section == data_result) {
		
		data = [BollData create:@[@1, @2, @3, @4, @5, @6] blues:@[@33]];
	}
	else {
		
		data = _dataSource[indexPath.row];
	}
	
	BollCell *cell = (BollCell *)[self cellByClassName:@"BollCell" inNib:@"BollCell" forTableView:tableView];
	
	[cell setBollData:data];
	
	return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	return 44;
}

- (NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	
	if (section == data_result) {
		
		return @"开奖号码";
	}
	
	return @"我的彩票";
}


@end
