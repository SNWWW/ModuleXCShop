//
//  PublicNetFailedView.m
//  AiteCube
//
//  Created by snlo on 2018/5/22.
//  Copyright © 2018年 AiteCube. All rights reserved.
//

#import "PublicNetFailedView.h"

@implementation PublicNetFailedView

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.isBlankTouchInVisible = YES;
    
    [self addSubview:self.buttonBack];
    [[self.buttonBack rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        [self dismissFromSuperView:nil];
    }];
}

- (IBAction)handleComeButton:(UIButton *)sender {
    
    [self dismissFromSuperView:nil];
	
}

#pragma mark -- getter / setter
- (UIButton *)buttonBack {
    if (!_buttonBack) {
        _buttonBack = [UIButton buttonWithType:UIButtonTypeSystem];
        _buttonBack.frame = CGRectMake(16, kIs_iPhoneX?44:20, 44, 44);
        _buttonBack.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        [_buttonBack setImage:[UIImage imageNamed:@"s_public_return_two"] forState:UIControlStateNormal];
        [_buttonBack setTintColor:COLOR_MAIN];
    } return _buttonBack;
}

@end
