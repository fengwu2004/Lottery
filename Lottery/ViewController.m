//
//  ViewController.m
//  Lottery
//
//  Created by user on 16/2/5.
//  Copyright © 2016年 user. All rights reserved.
//

#import "ViewController.h"
#import "BuyListVCTL.h"

@interface ViewController ()

@property (nonatomic, retain) IBOutlet UIButton *ibBtnShuangSeQiu;//双色球
@property (nonatomic, retain) IBOutlet UIButton *ibBtnDaLeTou;//大乐透

@end

@implementation ViewController

- (void)viewDidLoad {
	
	[super viewDidLoad];
}

- (IBAction)onShuangeSeQiu:(id)sender {
	
	BuyListVCTL *vctl = [[BuyListVCTL alloc] init];
	
	[self.navigationController pushViewController:vctl animated:YES];
}

- (IBAction)OnDaLeTou:(id)sender {
	
	
}


@end
