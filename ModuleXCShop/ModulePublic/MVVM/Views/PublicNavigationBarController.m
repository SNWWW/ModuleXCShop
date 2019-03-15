//
//  PublicNavigationBarController.m
//  ModuleXCShop
//
//  Created by MacBook Pro on 2017/10/11.
//  Copyright © 2017年 ModuleXCShop. All rights reserved.
//

#import "PublicNavigationBarController.h"

@interface PublicNavigationBarController () <UITabBarControllerDelegate>

@end

@implementation PublicNavigationBarController

#pragma mark -- life methods
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.sn_tabBarController.delegate = self;
    self.sn_tabBarController.selectedIndex = 0;
    
    [self sn_setTabBarItemTitleTextColor:COLOR_TITLE normalfont:[UIFont systemFontOfSize:12.0f] forState:UIControlStateNormal];
    [self sn_setTabBarItemTitleTextColor:COLOR_HINT normalfont:[UIFont systemFontOfSize:12.0f] forState:UIControlStateSelected];
    
    self.navigationBar.hidden = YES;
}

#pragma mark -- <UITabBarControllerDelegate>

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {

    return YES;
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
	
}


@end
