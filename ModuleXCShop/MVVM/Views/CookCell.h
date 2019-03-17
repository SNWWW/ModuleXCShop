//
//  CookCell.h
//  ModuleXCShop
//
//  Created by snlo on 2019/3/17.
//  Copyright © 2019 XCShop. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CookCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageViewContent;
@property (weak, nonatomic) IBOutlet UILabel *labelTitle;
@property (weak, nonatomic) IBOutlet UILabel *labelContent;

@end
