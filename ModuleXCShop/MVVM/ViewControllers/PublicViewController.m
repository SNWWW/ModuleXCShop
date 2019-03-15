//
//  PublicViewController.m
//  ModuleXCShop
//
//  Created by snlo on 2019/3/16.
//  Copyright © 2019 XCShop. All rights reserved.
//

#import "PublicViewController.h"
#import "CookViewController.h"
#import "TodayViewController.h"
@interface PublicViewController ()
@property (nonatomic, strong) CookViewController * cook;
@property (nonatomic, strong) TodayViewController * today;
@end

@implementation PublicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	
	
	[self addChildViewController:self.cook];
	[self.view addSubview:self.cook.view];
	self.cook.view.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
	
	
}


- (CookViewController *)cook {
	if (!_cook) {
		_cook = [[CookViewController alloc] init];
	} return _cook;
}
- (TodayViewController *)today {
	if (!_today) {
		_today = [[TodayViewController alloc] init];
	} return _today;
}

@end
