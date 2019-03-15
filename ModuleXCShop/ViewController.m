//
//  ViewController.m
//  ModuleXCShop
//
//  Created by snlo on 2019/3/15.
//  Copyright © 2019 XCShop. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
	UIViewController * vc = [[UIViewController alloc] init];
	vc.view.backgroundColor = [UIColor yellowColor];
	UIViewController * vc2 = [[UIViewController alloc] init];
	vc2.view.backgroundColor = [UIColor orangeColor];
	SNDrawerViewController *SNDrawerVC = [[SNDrawerViewController alloc] initWithMainViewController:vc leftViewController:vc2];
	/* configure your drawer */
	
	[self addChildViewController:SNDrawerVC];
	[self.view addSubview:SNDrawerVC.view];
	
	
	
}


@end
