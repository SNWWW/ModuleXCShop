//
//  CFYShowPlaceholderView.m
//  ModuleXCShop
//
//  Created by ModuleXCShop on 2018/11/12.
//  Copyright © 2018 ModuleXCShop---. All rights reserved.
//

#import "CFYShowPlaceholderView.h"
#import "UIView+CFYExtension.h"
#define IS_IPHONEX ([[UIScreen mainScreen] bounds].size.height == 812)
//#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
//#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)


@implementation CFYShowPlaceholderView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self initialize];
    }
    return self;
}

- (void)initialize
{

    _imageView = [[UIImageView alloc]init];
    [self addSubview:self.imageView];
    
    _labelTitle = [[UILabel alloc]init];
    _labelTitle.frame = CGRectMake(50, 0, self.width-100, 60);
    _labelTitle.numberOfLines = 0;
    _labelTitle.font = [UIFont systemFontOfSize:16];
    _labelTitle.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1];
    [self addSubview:self.labelTitle];
}


 - (void)layoutSubviews
{

    [self installImageViewAndTitle];
   
}
- (void)installImageViewAndTitle
{
    
#pragma mark --label间距
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:self.placeholderTitle];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:10];//调整行间距
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [self.placeholderTitle length])];
    self.labelTitle.attributedText = attributedString;
    self.labelTitle.textAlignment = NSTextAlignmentCenter;

    
    if (!self.placeholderImageName.length) {
        //没传图片进来 隐藏图片
        self.imageView.hidden = YES;
        self.labelTitle.centerY =self.centerY-(IS_IPHONEX?88:64)+self.layoutTitleTop;
    }else{
        
        if (self.imageViewH &&self.imageViewW) {
            //自己设置图片宽高
            self.imageView.frame = CGRectMake(0, 0,self.imageViewW , self.imageViewH);
            self.imageView.centerX = self.centerX;
            self.imageView.centerY = self.centerY- (IS_IPHONEX?88:64)+(self.layoutImageViewOffsetY?self.layoutImageViewOffsetY:0)-self.imageViewH/2;
        }else{
#pragma mark --计算图片显示比例
            CGFloat imageW = CGImageGetWidth([UIImage imageNamed:self.placeholderImageName].CGImage);
            CGFloat imageH = CGImageGetHeight([UIImage imageNamed:self.placeholderImageName].CGImage);
            CGFloat viewW = self.size.width;
            CGFloat imageVieWW =(viewW-100)*imageH/imageW;
            CGFloat imageViewH =(viewW-100)*imageH/imageW/(imageW/imageH);
            self.imageView.frame = CGRectMake(0, 0,imageVieWW , imageViewH);
            self.imageView.centerX = self.centerX;
            self.imageView.centerY = self.centerY- (IS_IPHONEX?88:64)+(self.layoutImageViewOffsetY?self.layoutImageViewOffsetY:0)-imageViewH/2;
            
        }
        
        self.imageView.image = [UIImage imageNamed:self.placeholderImageName];

        self.labelTitle.y = CGRectGetMaxY(self.imageView.frame)+(self.layoutTitleTop==0?50:self.layoutTitleTop);

        
    }
    
    
    

}
#pragma mark -- set

- (void)setPlaceholderImageName:(NSString *)placeholderImageName
{
    _placeholderImageName = placeholderImageName;
}
- (void)setPlaceholderTitle:(NSString *)placeholderTitle
{
    _placeholderTitle = placeholderTitle;
    self.labelTitle.hidden = placeholderTitle.length>0?NO:YES;
}
- (void)setLayoutTitleTop:(CGFloat)layoutTitleTop
{
    _layoutTitleTop = layoutTitleTop;
    
}
- (void)setLayoutImageViewOffsetY:(CGFloat)layoutImageViewOffsetY
{
    _layoutImageViewOffsetY = layoutImageViewOffsetY;
}
- (void)setImageViewW:(CGFloat)imageViewW
{
    _imageViewW = imageViewW;
}
- (void)setImageViewH:(CGFloat)imageViewH
{
    _imageViewH = imageViewH;
}
@end
