//
//  TodayViewController.h
//  ModuleXCShop
//
//  Created by snlo on 2019/3/16.
//  Copyright © 2019 XCShop. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TodayViewController : UIViewController

@property (nonatomic, strong) RACSubject * subjectMenu;
@property (weak, nonatomic) IBOutlet UILabel *labelDay;
@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end
