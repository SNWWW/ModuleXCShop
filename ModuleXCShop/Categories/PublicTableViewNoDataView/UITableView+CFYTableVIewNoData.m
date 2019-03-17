//
//  UITableView+CFYTableVIewNoData.m
//  ModuleXCShop
//
//  Created by ModuleXCShop on 2018/11/8.
//  Copyright © 2018 ModuleXCShop---. All rights reserved.
//

#import "UITableView+CFYTableVIewNoData.h"
#import <objc/runtime.h>


@implementation UITableView (CFYTableVIewNoData)

- (void)cfy_showPlaceholderWithDataSourceCount:(NSInteger)dataSourceCount imageName:(NSString *)imageName title:(NSString *)title placeholderView:(void(^)(CFYShowPlaceholderView *view))placeholderView
{
    
    switch (dataSourceCount) {
        case 0:{
            [self addPlaceholderImageName:imageName titleStr:title placeholderView:placeholderView];
        } break;
        default:{
            [self removePlaceholder];
        } break;
    }
}
- (void)addPlaceholderImageName:(NSString *)imageName titleStr:(NSString *)titleStr placeholderView:(void(^)(CFYShowPlaceholderView *view))placeholderView
{

    for (UIView *view in self.subviews) {
        if ([view isKindOfClass:[CFYShowPlaceholderView class]]) {
            CFYShowPlaceholderView *placeView  =(CFYShowPlaceholderView *)view;
            placeView.imageView.image =[UIImage imageNamed:imageName];
            placeView.labelTitle.text =titleStr;
            return;
        }
    }
    CFYShowPlaceholderView *view = [[CFYShowPlaceholderView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    view.placeholderImageName = imageName;
    view.placeholderTitle = titleStr;
    if (placeholderView) {
        placeholderView(view);
    }
    [self addSubview:view];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self insertSubview:view atIndex:0];
    });
    
    
}
- (void)removePlaceholder
{
    for (UIView *view in self.subviews) {
        if ([view isKindOfClass:[CFYShowPlaceholderView class]]) {
            [view removeFromSuperview];
        }
    }
}





@end
