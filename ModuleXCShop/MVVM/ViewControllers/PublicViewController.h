//
//  PublicViewController.h
//  ModuleXCShop
//
//  Created by snlo on 2019/3/16.
//  Copyright © 2019 XCShop. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CookViewController.h"
#import "TodayViewController.h"

@interface PublicViewController : UIViewController

@property (nonatomic, strong) CookViewController * cook;
@property (nonatomic, strong) TodayViewController * today;

@end

