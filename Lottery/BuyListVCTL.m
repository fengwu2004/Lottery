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
#import "AwardChecking.h"
#import "AddBollVCTL.h"
#import "BollDataMgr.h"
#import "HttpRequestManager.h"

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
	
	_dataSource = [[BollDataMgr sharedInstance] bollsList];
	
//	[[HttpRequestManager sharedInstance] post:@"http://127.0.0.1:3000/number" data:nil success:^(NSDictionary *data) {
//		
//		NSLog(@"%@", data);
//		
//	} failure:^(NSDictionary *data) {
//		
//		NSLog(@"error");
//	}];
	
	NSSet *red = [NSSet setWithArray:@[@6, @13, @16, @17, @23, @30]];
	
	NSSet *blue = [NSSet setWithArray:@[@10]];
	
	[[AwardChecking sharedInstance] setWinningNumber:[BollData create:red blues:blue]];
	
	[_ibTableView reloadData];
}

- (void)viewDidLoad {
	
  [super viewDidLoad];
	
	UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"addnewitem"] style:UIBarButtonItemStylePlain target:self action:@selector(onNewBolls)];

	self.navigationItem.rightBarButtonItem = rightItem;
}

- (void)viewWillAppear:(BOOL)animated {
	
	[super viewWillAppear:animated];
	
	[self test];
}

- (void)onNewBolls {
	
	AddBollVCTL *vctl = [[AddBollVCTL alloc] init];
	
	[self.navigationController pushViewController:vctl animated:YES];
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
	
	BollCell *cell = (BollCell *)[self cellByClassName:@"BollCell" inNib:@"BollCell" forTableView:tableView];
	
	if (indexPath.section == data_result) {
		
		data = [AwardChecking sharedInstance].winningNumber;
		
		[cell setShowResult:NO];
	}
	else {
		
		data = _dataSource[indexPath.row];
		
		[cell setShowResult:YES];
	}
	
	[cell setBollData:data];
	
	cell.selectionStyle = UITableViewCellSelectionStyleNone;
	
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
