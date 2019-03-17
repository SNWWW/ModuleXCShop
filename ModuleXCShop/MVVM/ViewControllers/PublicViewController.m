//
//  PublicViewController.m
//  ModuleXCShop
//
//  Created by snlo on 2019/3/16.
//  Copyright © 2019 XCShop. All rights reserved.
//

#import "PublicViewController.h"

@interface PublicViewController ()

@end

@implementation PublicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	
	[self addChildViewController:self.cook];
	[self.view addSubview:self.cook.view];
	self.cook.view.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
	
	self.view.backgroundColor = [UIColor whiteColor];
}

@end
