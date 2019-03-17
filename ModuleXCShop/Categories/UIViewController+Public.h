//
//  UIViewController+Public.h
//  ModuleXCShop
//
//  Created by snlo on 2019/3/17.
//  Copyright © 2019 XCShop. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Public)

- (void)reloadDataSource:(void(^)(void))dataSourceBlock;

@end


