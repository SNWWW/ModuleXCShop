//
//  MenuViewController.m
//  ModuleXCShop
//
//  Created by snlo on 2019/3/16.
//  Copyright © 2019 XCShop. All rights reserved.
//

#import "MenuViewController.h"

@interface MenuViewController ()

@end

@implementation MenuViewController

#pragma mark -- life cycle
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    // update form data
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // add subviews
    [self configureUserInterface];
    
    // add dataSource configure
    [self configureDataSource];
}

#pragma mark -- <UITableViewDelegate>、、

#pragma mark -- CustomDelegate

#pragma mark -- event response

#pragma mark -- ___VARIABLE_moduleName___ methods

#pragma mark -- private methods
- (void)configureUserInterface {
	CAGradientLayer *gradientLayer =  [CAGradientLayer layer];
	gradientLayer.startPoint = CGPointMake(0, 1);
	gradientLayer.endPoint = CGPointMake(0, 0);
	gradientLayer.locations = @[@(0.5),@(1)];//渐变点
	gradientLayer.colors = [NSArray arrayWithObjects:(id)[[UIColor blueColor] CGColor],(id)[[UIColor greenColor] CGColor], nil];
	gradientLayer.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
	[self.view.layer insertSublayer:gradientLayer atIndex:0];
}
- (void)configureDataSource {
    
    [self updateDataSource];
    
}
- (void)updateDataSource {
	self.labelCook.text = @"精\n品\n好\n菜";
	self.labelToday.text = @"历\n史\n今\n天";
}

#pragma mark -- getter setter

@end
