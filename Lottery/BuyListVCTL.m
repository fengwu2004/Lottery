//
//  BuyListVCTL.m
//  Lottery
//
//  Created by user on 16/2/5.
//  Copyright © 2016年 user. All rights reserved.
//

#import "BuyListVCTL.h"
#import "BollData.h"

typedef NS_ENUM(NSInteger, dataType){
 
	data_result,
	data_myBolls,
	data_max,
};

@interface BuyListVCTL () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, retain) IBOutlet UITableView *ibTableView;
@property (nonatomic, retain) NSArray<__kindof BollData*> *dataSource;

@end

@implementation BuyListVCTL

- (void)viewDidLoad {
	
  [super viewDidLoad];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	
	if (section == data_result) {
		
		return 1;
	}
	
	return _dataSource.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	
	return data_max;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	
}

- (NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	
	if (section == data_result) {
		
		return @"开奖号码";
	}
	
	return @"我的彩票";
}


@end
