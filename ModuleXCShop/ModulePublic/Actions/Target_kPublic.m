//
//  Target_kPublic.m
//  Module Name: Public
//
//  Created by snlo on 2019/3/15.
//  Copyright © 2019 snlo. All rights reserved.
//

#import "Target_kPublic.h"

#import "PublicNavigationBarController.h"

@implementation Target_kPublic

- (UIViewController *)Action_nativeFetchPublicViewController:(NSDictionary *)params {
	
	UIViewController * vc1 = [[UIViewController alloc] init];
	UIViewController * vc2 = [[UIViewController alloc] init];
	vc1.view.backgroundColor = [UIColor redColor];
	vc2.view.backgroundColor = [UIColor greenColor];
	
	PublicNavigationBarController * baseBarVC =
	[PublicNavigationBarController
	 sn_navigationWithTabBarViewControllers:@[vc1, vc2]
	 itemsTitle:@[@"报价",@"商城"]
	 itemsImageNmae:@[@"s_public_Intelligent_quotation_one",@"s_public_shopping_mall_one"]
	 itemsSelectedImageName:@[@"s_public_Intelligent_quotation_two",@"s_public_shopping_mall_two"]];
	
	baseBarVC.navigationBar.hidden = YES;
	
	[UIApplication sharedApplication].delegate.window.rootViewController = baseBarVC;
	[[UIApplication sharedApplication].delegate.window makeKeyAndVisible];
	
	[baseBarVC.sn_tabBarController sn_loadViewsIfNeeded];
	
	return baseBarVC;
}

@end
