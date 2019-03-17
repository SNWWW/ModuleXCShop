//
//  CookCell.m
//  ModuleXCShop
//
//  Created by snlo on 2019/3/17.
//  Copyright © 2019 XCShop. All rights reserved.
//

#import "CookCell.h"

@implementation CookCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
	
	self.labelTitle.text = @"青蛙水煮蛋";
	self.labelContent.text = @"延缓衰老;高血压;儿童;抗癌;降血压;增强抵抗力;抗衰老;抗氧化;提高免疫力;宝宝辅食;健脾养胃;补硒";
	[self.imageViewContent sd_setImageWithURL:[NSURL URLWithString:@"http://juheimg.oss-cn-hangzhou.aliyuncs.com/cookbook/t/20/19885_517664.jpg"] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
		
	}];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
//	"http://juheimg.oss-cn-hangzhou.aliyuncs.com/cookbook/t/21/20219_320208.jpg"
	
	
}

@end
