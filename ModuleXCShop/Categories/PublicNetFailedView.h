//
//  PublicNetFailedView.h
//  AiteCube
//
//  Created by snlo on 2018/5/22.
//  Copyright © 2018年 AiteCube. All rights reserved.
//

#import "SNPopupView.h"

@interface PublicNetFailedView : SNPopupView

@property (weak, nonatomic) IBOutlet UIButton *buttonNoNetWork;

/**
 返回按钮
 */
@property (nonatomic, strong) UIButton * buttonBack;

@end
