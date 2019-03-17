//
//  CookViewController.h
//  ModuleXCShop
//
//  Created by snlo on 2019/3/16.
//  Copyright © 2019 XCShop. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CookViewController : UIViewController

@property (nonatomic, strong) RACSubject * subjectMenu;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
