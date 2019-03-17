//
//  CFYShowPlaceholderView.h
//  ModuleXCShop
//
//  Created by ModuleXCShop on 2018/11/12.
//  Copyright © 2018 ModuleXCShop---. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CFYShowPlaceholderView : UIView
@property (nonatomic,strong) UIImageView *imageView;
@property (nonatomic,strong) UILabel *labelTitle;

/**
 图片宽度
 同时设置 宽度 高度才有效
 */
@property (nonatomic,assign) CGFloat imageViewW;

/**
 图片高度
 */
@property (nonatomic,assign) CGFloat imageViewH;


/**
 占位图图片 imageName
 */
@property (nonatomic,strong) NSString *placeholderImageName;
/**
 占位文字string
 */
@property (nonatomic,strong) NSString *placeholderTitle;

/**
  文字距离图片的距离
  默认50 不设置为50
 */
@property (nonatomic,assign) CGFloat layoutTitleTop;

/**
 图片Y轴
 默认屏幕中心
 */
@property (nonatomic,assign) CGFloat layoutImageViewOffsetY;

@end

NS_ASSUME_NONNULL_END
