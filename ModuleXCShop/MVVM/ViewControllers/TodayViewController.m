//
//  TodayViewController.m
//  ModuleXCShop
//
//  Created by snlo on 2019/3/16.
//  Copyright © 2019 XCShop. All rights reserved.
//

#import "TodayViewController.h"

#import "TodayCell.h"

#import "ViewModel.h"

@interface TodayViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UIButton *buttonMenu;

@property (nonatomic, strong) ViewModel * viewmodel;

@property (nonatomic, strong) NSArray * dataSource;

@end

@implementation TodayViewController

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
	TodayCell * cell = [TodayCell sn_nibCellWithTabelView:tableView indexPath:indexPath];
	cell.labelTitle.text = self.dataSource[indexPath.row][@"title"];
	cell.labelContent.text = self.dataSource[indexPath.row][@"des"];
	return cell;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
	return 48;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
	return 0.0001;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
	return 0.0001;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
	return [UIView new];
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
	return [UIView new];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
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
	self.tableView.allowsSelection = NO; //cell交互
	self.tableView.delaysContentTouches = NO; //延迟（能让cell上的事件响应灵敏，但也会带来交互误触的弊端）
	
	[[self.buttonMenu rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
		[self.subjectMenu sendNext:x];
	}];
}
- (void)configureDataSource {
	
	NSString * string = @"";
	NSDateComponents * date = [self.viewmodel date:&string];
	self.labelDay.text = SNString(@"%ld年%ld月%ld日-%@",date.year,date.month,date.day,string);
	
    [self updateDataSourceWithM:SNString(@"%ld",date.month) D:SNString(@"%ld",date.day)];
	[self reloadDataSource:^{
		[self updateDataSourceWithM:SNString(@"%ld",date.month) D:SNString(@"%ld",date.day)];
	}];
    
}
- (void)updateDataSourceWithM:(NSString *)M D:(NSString *)D {
	[[SNNetworking todaymonth:M day:D success:nil failure:nil] subscribeNext:^(id  _Nullable x) {
		if ([SNString(@"%@",x[@"error_code"]) isEqualToString:@"0"]) {
			NSArray * result = x[@"result"];
			if (result.count > 0) {
				self.dataSource = result;
				[self.tableView reloadData];
				return ;
			}
		}
		[self.tableView cfy_showPlaceholderWithDataSourceCount:0 imageName:@"s_blic_no_network" title:@"暂无相关数据" placeholderView:^(CFYShowPlaceholderView * _Nonnull view) {
			view.mj_y = 130;
			view.layoutImageViewOffsetY = -130;
		}];
		
	}];
}

#pragma mark -- getter setter
- (RACSubject *)subjectMenu {
	if (!_subjectMenu) {
		_subjectMenu = [RACSubject subject];
	}
	return _subjectMenu;
}
- (ViewModel *)viewmodel {
	if (!_viewmodel) {
		_viewmodel = [[ViewModel alloc] init];
	} return _viewmodel;
}
- (NSArray *)dataSource {
	if (!_dataSource) {
		_dataSource = [[NSArray alloc] init];
	} return _dataSource;
}
@end
