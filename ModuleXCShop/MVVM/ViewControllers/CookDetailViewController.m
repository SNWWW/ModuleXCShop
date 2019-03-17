//
//  CookDetailViewController.m
//  ModuleXCShop
//
//  Created by snlo on 2019/3/17.
//  Copyright © 2019 XCShop. All rights reserved.
//

#import "CookDetailViewController.h"

#import "CookDetailHeaderCell.h"
#import "CookDetailCell.h"

@interface CookDetailViewController () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation CookDetailViewController

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
	return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	if (section == 0) {
		return 1;
	} else {
		NSArray * array = self.dataSource[@"steps"];
		return array.count;
	}
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	switch (indexPath.section) {
		case 0: {
			CookDetailHeaderCell * cell = [CookDetailHeaderCell sn_nibCellWithTabelView:tableView indexPath:indexPath];
			cell.label0.text = self.dataSource[@"imtro"];
			cell.label1.text = self.dataSource[@"ingredients"];
			cell.label2.text = self.dataSource[@"burden"];
			[cell.iamgeviewContent sd_setImageWithURL:[NSURL URLWithString:self.dataSource[@"albums"][0]] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
				
			}];
			return cell;
		} break;
		default: {
			CookDetailCell * cell = [CookDetailCell sn_nibCellWithTabelView:tableView indexPath:indexPath];
			cell.labelTitle.text = self.dataSource[@"steps"][indexPath.row][@"step"];
			[cell.iamgeViewConten sd_setImageWithURL:[NSURL URLWithString:self.dataSource[@"steps"][indexPath.row][@"img"]] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
				
			}];
			return cell;
		} break;
	}
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
	
	[[self.buttonBack rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
		[self dismissViewControllerAnimated:YES completion:^{
			
		}];
	}];
	self.LabelTitle.text = self.dataSource[@"title"];
}
- (void)configureDataSource {
    
    [self updateDataSource];
    
}
- (void)updateDataSource {
    
}

#pragma mark -- getter setter

@end
