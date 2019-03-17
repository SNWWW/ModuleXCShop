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

@interface MainViewController ()

@property (nonatomic, strong) SNDrawerViewController * drawer;

@property (nonatomic, strong) PublicViewController * public;
@property (nonatomic, strong) MenuViewController * menu;

@property (nonatomic, strong) CookViewController * cook;
@property (nonatomic, strong) TodayViewController * today;

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
	
	[self addChildViewController:self.drawer];
	
	[self.cook.subjectMenu subscribeNext:^(id  _Nullable x) {
		[self.drawer openLeftDrawer];
		[self.view endEditing:NO];
	}];
	[self.today.subjectMenu subscribeNext:^(id  _Nullable x) {
		[self.drawer openLeftDrawer];
	}];
	
	[self.drawer.gestureOfOpeningLeftDrawer.rac_gestureSignal subscribeNext:^(__kindof UIGestureRecognizer * _Nullable x) {
		[self.view endEditing:NO];
	}];
	
	[[self.menu.buttonCook rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
		[self.drawer closeLeftDrawer];
		
		[self.public.childViewControllers makeObjectsPerformSelector:@selector(removeFromParentViewController)];
		[self.public.view.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
		
		[self.public addChildViewController:self.cook];
		[self.public.view addSubview:self.cook.view];
//		self.cook.view.alpha = 0;
		self.cook.view.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
//		[UIView animateWithDuration:0.3 animations:^{
//			[self.public.view.subviews makeObjectsPerformSelector:@selector(setAlpha:) withObject:0];
//			self.cook.view.alpha = 1;
//		} completion:^(BOOL finished) {
//
//		}];
		
	}];
	[[self.menu.buttonToday rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
		[self.drawer closeLeftDrawer];
		
		[self.public.childViewControllers makeObjectsPerformSelector:@selector(removeFromParentViewController)];
		[self.public.view.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
		
		[self.public addChildViewController:self.today];
		[self.public.view addSubview:self.today.view];
		self.today.view.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
		[UIView animateWithDuration:0.3 animations:^{
			
		} completion:^(BOOL finished) {
			
		}];
		
	}];
}
- (void)configureDataSource {
	
	[self updateDataSource];
	
}
- (void)updateDataSource {
	
}

#pragma mark -- getter setter

- (SNDrawerViewController *)drawer {
	if (!_drawer) {
		_drawer = [[SNDrawerViewController alloc] initWithMainViewController:self.public leftViewController:self.menu];
		_drawer.drawerWidth = SCREEN_WIDTH*0.2;
		_drawer.drawerScale = 1;
		[self.view addSubview:_drawer.view];
	} return _drawer;
}

- (PublicViewController *)public {
	if (!_public) {
		_public = [[PublicViewController alloc] init];
		_public.cook = self.cook;
		_public.today = self.today;
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


@end
