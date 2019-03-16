//
//  CookViewController.m
//  ModuleXCShop
//
//  Created by snlo on 2019/3/16.
//  Copyright © 2019 XCShop. All rights reserved.
//

#import "CookViewController.h"

@interface CookViewController ()

@end

@implementation CookViewController

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
    
}
- (void)configureDataSource {
    
    [self updateDataSource];
    
}
- (void)updateDataSource {
	
//	[[SNNetworking cookmenu:@"菜" pageNumber:@"1" success:^(id responseObject) {
//		NSLog(@"-- -- -%@",responseObject);
//	} failure:^(NSError *error) {
//		NSLog(@" -- %@",error);
//	}] subscribeNext:^(id  _Nullable x) {
//		NSLog(@"%@",x[@"resultcode"]);
//	}];
}

#pragma mark -- getter setter

@end
