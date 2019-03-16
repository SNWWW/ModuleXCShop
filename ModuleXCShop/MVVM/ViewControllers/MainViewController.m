//
//  MainViewController.m
//  ModuleXCShop
//
//  Created by snlo on 2019/3/16.
//  Copyright © 2019 XCShop. All rights reserved.
//

#import "MainViewController.h"

#import "PublicViewController.h"
#import "MenuViewController.h"

#import "CookViewController.h"
#import "TodayViewController.h"

@interface MainViewController ()

@property (nonatomic, strong) PublicViewController * public;
@property (nonatomic, strong) MenuViewController * menu;

@property (nonatomic, strong) CookViewController * cook;
@property (nonatomic, strong) TodayViewController * today;

@property (nonatomic, strong) UIButton * buttonMenu;

@end

@implementation MainViewController

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

#pragma mark -- <UITableViewDelegate>、、

#pragma mark -- CustomDelegate

#pragma mark -- event response

#pragma mark -- ___VARIABLE_moduleName___ methods

#pragma mark -- private methods
- (void)configureUserInterface {
	
	SNDrawerViewController * drawer = [[SNDrawerViewController alloc] initWithMainViewController:self.public leftViewController:self.menu];
	[self addChildViewController:drawer];
	[self.view addSubview:drawer.view];
	
	[self.view addSubview:self.buttonMenu];
	
	
	[[self.buttonMenu rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
		[self.view endEditing:NO];
		if (x.selected) {
			x.selected = NO;
			[drawer closeLeftDrawer];
		} else {
			x.selected = YES;
			[drawer openLeftDrawer];
		}
	}];
	[RACObserve(drawer, drawerState) subscribeNext:^(id  _Nullable x) {
		if (drawer.drawerState == SNDrawerViewStateNone) {
			self.buttonMenu.selected = NO;
		} else {
			self.buttonMenu.selected = YES;
		}
	}];
	[drawer.gestureOfOpeningLeftDrawer.rac_gestureSignal subscribeNext:^(__kindof UIGestureRecognizer * _Nullable x) {
		[self.view endEditing:NO];
	}];
	[[self.menu.button rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
		[drawer closeLeftDrawer];
		self.buttonMenu.selected = NO;
		
		if (x.selected) {
			x.selected = NO;
			
			[self.public addChildViewController:self.today];
			[self.public.view addSubview:self.today.view];
			self.today.view.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
		} else {
			x.selected = YES;
			
			[self.public addChildViewController:self.cook];
			[self.public.view addSubview:self.cook.view];
			self.cook.view.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
		}
	}];
	
	
	
}
- (void)configureDataSource {
	
	[self updateDataSource];
	
}
- (void)updateDataSource {
	
}

#pragma mark -- getter setter

- (PublicViewController *)public {
	if (!_public) {
		_public = [[PublicViewController alloc] init];
	} return _public;
}
- (MenuViewController *)menu {
	if (!_menu) {
		_menu = [[MenuViewController alloc] init];
	} return _menu;
}


- (CookViewController *)cook {
	if (!_cook) {
		_cook = [[CookViewController alloc] init];
	} return _cook;
}
- (TodayViewController *)today {
	if (!_today) {
		_today = [[TodayViewController alloc] init];
	} return _today;
}

- (UIButton *)buttonMenu {
	if (!_buttonMenu) {
		_buttonMenu = [UIButton buttonWithType:UIButtonTypeCustom];
		_buttonMenu.frame = CGRectMake(0, 0, 100, 100);
		_buttonMenu.center = CGPointMake(100, 100);
		_buttonMenu.backgroundColor = [UIColor redColor];
	} return _buttonMenu;
}

@end
