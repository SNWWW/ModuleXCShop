//
//  CookDetailHeaderCell.m
//  ModuleXCShop
//
//  Created by snlo on 2019/3/17.
//  Copyright © 2019 XCShop. All rights reserved.
//

#import "CookDetailHeaderCell.h"

@implementation CookDetailHeaderCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
	self.iamgeviewContent.clipsToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
