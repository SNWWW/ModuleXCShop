//
//  CookViewController.m
//  ModuleXCShop
//
//  Created by snlo on 2019/3/16.
//  Copyright © 2019 XCShop. All rights reserved.
//

#import "CookViewController.h"

#import "CookCell.h"

#import "CookDetailViewController.h"

@interface CookViewController () <UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate>

@property (weak, nonatomic) IBOutlet UIButton *buttonMenu;

@property (nonatomic, strong) NSArray * dataSource;

@end

@implementation CookViewController

#pragma mark -- life cycle
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    // update form data
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // add subviews
    [self configureUserInterface];
    
    // add dataSource configure
    [self configureDataSource];
}

#pragma mark -- <UITableViewDelegate, UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return self.dataSource.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	CookCell * cell = [CookCell sn_nibCellWithTabelView:tableView indexPath:indexPath];
	cell.selectionStyle = UITableViewCellSelectionStyleNone;
	cell.labelTitle.text = self.dataSource[indexPath.row][@"title"];
	cell.labelContent.text = self.dataSource[indexPath.row][@"tags"];
	[cell.imageViewContent sd_setImageWithURL:[NSURL URLWithString:self.dataSource[indexPath.row][@"albums"][0]] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {

	}];
	
	return cell;
}
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
	return 48;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
	return 64;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
	return 0.0001;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
	UIView * view = [[UIView alloc] init];
	view.backgroundColor = [UIColor whiteColor];
	UILabel * label = [[UILabel alloc] init];
	label.font = [UIFont systemFontOfSize:24 weight:UIFontWeightMedium];
	label.textColor = COLOR_MAIN;
	label.frame = CGRectMake(16, 0, SCREEN_WIDTH, 64);
	label.text = @"今日推荐";
	[view addSubview:label];
	return view;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
	return [UIView new];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
	CookDetailViewController * VC = [[CookDetailViewController alloc] init];
	VC.dataSource = self.dataSource[indexPath.row];
	[self presentViewController:VC animated:YES completion:^{
		
	}];
	
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark -- <UISearchBarDelegate>
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
	
	[self.view endEditing:NO];
	[self updateDataSourceWith:self.searchBar.text];
}
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
	[self.view endEditing:NO];
	self.searchBar.text = @"";
}

#pragma mark -- CustomDelegate

#pragma mark -- event response

#pragma mark -- ___VARIABLE_moduleName___ methods

#pragma mark -- private methods
- (void)configureUserInterface {
	
	self.tableView.delegate = self;
	self.tableView.dataSource = self;
	self.tableView.showsVerticalScrollIndicator = NO; //隐藏滚动条
	self.tableView.separatorStyle = NO;
	self.tableView.delaysContentTouches = NO; //延迟（能让cell上的事件响应灵敏，但也会带来交互误触的弊端）
	
	[[self.buttonMenu rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
		[self.subjectMenu sendNext:x];
	}];
	
	self.searchBar.delegate = self;
	self.searchBar.showsCancelButton = YES;
	
}
- (void)configureDataSource {
    
    [self updateDataSourceWith:@"健康"];
	[self reloadDataSource:^{
		[self updateDataSourceWith:@"健康"];
	}];
    
}
- (void)updateDataSourceWith:(NSString *)menu {
	
	[[SNNetworking cookmenu:menu pageNumber:@"1" success:nil failure:nil] subscribeNext:^(id  _Nullable x) {
		NSLog(@" - -%@",x);
		if ([SNString(@"%@",x[@"error_code"]) isEqualToString:@"0"] && [SNString(@"%@",x[@"resultcode"]) isEqualToString:@"200"]) {
			NSArray * data = x[@"result"][@"data"];
			if (data.count > 0) {
				self.dataSource = data;
				[self.tableView cfy_showPlaceholderWithDataSourceCount:self.dataSource.count imageName:@"s_blic_no_network" title:@"暂无相关数据" placeholderView:^(CFYShowPlaceholderView * _Nonnull view) {
					view.mj_y = 130;
					view.layoutImageViewOffsetY = -130;
				}];
				[self.tableView reloadData];
				return ;
			}
		}
		[self.tableView cfy_showPlaceholderWithDataSourceCount:0 imageName:@"s_blic_no_network" title:@"暂无相关数据" placeholderView:^(CFYShowPlaceholderView * _Nonnull view) {
			view.mj_y = 130;
			view.layoutImageViewOffsetY = -130;
		}];
		self.dataSource = @[];
		[self.tableView reloadData];
	}];
}

#pragma mark -- getter setter

- (RACSubject *)subjectMenu {
	if (!_subjectMenu) {
		_subjectMenu = [RACSubject subject];
	} return _subjectMenu;
}

@end
