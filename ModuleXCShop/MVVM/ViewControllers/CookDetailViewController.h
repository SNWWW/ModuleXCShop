//
//  CookDetailViewController.h
//  ModuleXCShop
//
//  Created by snlo on 2019/3/17.
//  Copyright © 2019 XCShop. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CookDetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIButton *buttonBack;
@property (weak, nonatomic) IBOutlet UILabel *LabelTitle;

@property (nonatomic, strong) NSDictionary * dataSource;

@end
