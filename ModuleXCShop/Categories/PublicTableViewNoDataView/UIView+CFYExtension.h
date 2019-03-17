//
//  UIView+CFYExtension.h
//  ModuleXCShop
//
//  Created by ModuleXCShop on 16/6/4.
//  Copyright © 2016年 ModuleXCShop. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (CFYExtension)
@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
/**
 * 判断一个控件是否真正显示在主窗口
 */
- (BOOL)isShowingOnKeyWindow;
@end
