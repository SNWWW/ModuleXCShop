//
//  UITableView+CFYTableVIewNoData.h
//  ModuleXCShop
//
//  Created by ModuleXCShop on 2018/11/8.
//  Copyright © 2018 ModuleXCShop---. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CFYShowPlaceholderView.h"

NS_ASSUME_NONNULL_BEGIN

@interface UITableView (CFYTableVIewNoData)

/**
  ListArr 数据源数组 如果为数量为0 则不会显示图片和占位文字
  placeholderImageName 占位图
  titleStr  占位图下面文字  默认隐藏
  placeholderView 配置placeholderView
 */
- (void)cfy_showPlaceholderWithDataSourceCount:(NSInteger)dataSourceCount imageName:(NSString *)imageName title:(NSString *)title placeholderView:(void(^)(CFYShowPlaceholderView *view))placeholderView;
@end

NS_ASSUME_NONNULL_END
