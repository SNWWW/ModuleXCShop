//
//  UIViewController+Public.m
//  ModuleXCShop
//
//  Created by snlo on 2019/3/17.
//  Copyright © 2019 XCShop. All rights reserved.
//

#import "UIViewController+Public.h"

#import "PublicNetFailedView.h"

typedef void(^kPublicDataSourceBlock)(void);

@interface UIViewController ()

@property (nonatomic, strong) PublicNetFailedView * viewNetfailed;

@property (nonatomic, copy) kPublicDataSourceBlock kPublic_DataSourceBlock;

@end

@implementation UIViewController (Public)

+ (void)load {
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		sn_replaceMethodFromNew(self, @selector(viewWillAppear:), @selector(public_viewWillAppear:));
	});
}
- (void)public_viewWillAppear:(BOOL)animated {
	
	[SNNetworking brokenSource:^{
		[self.viewNetfailed showin:nil withViewController:[SNTool rootViewController]];
	}];
	[SNNetworking timeOutSource:^{
		[self.viewNetfailed showin:nil withViewController:[SNTool rootViewController]];
	}];
	[self public_viewWillAppear:animated];
}

- (void)reloadDataSource:(void(^)(void))dataSourceBlock {
	if (dataSourceBlock) {
		self.kPublic_DataSourceBlock = dataSourceBlock;
	}
}

- (void)setViewNetfailed:(PublicNetFailedView *)viewNetfailed {
	objc_setAssociatedObject(self, @selector(viewNetfailed), viewNetfailed, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (PublicNetFailedView *)viewNetfailed {
	PublicNetFailedView * view = objc_getAssociatedObject(self, _cmd);
	if (!view) {
		view = [PublicNetFailedView sn_viewWithNib];
		[[view.buttonNoNetWork rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
			if (self.kPublic_DataSourceBlock) {
				self.kPublic_DataSourceBlock();
			} else {
				if ([self respondsToSelector:NSSelectorFromString(@"updateDataSource")]) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
					[self performSelector:NSSelectorFromString(@"updateDataSource")];
#pragma clang diagnostic pop
				}
			}
		}];
		objc_setAssociatedObject(self, @selector(viewNetfailed), view, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
	}
	return view;
}

- (void)setKPublic_DataSourceBlock:(kPublicDataSourceBlock)kPublic_DataSourceBlock {
	objc_setAssociatedObject(self, @selector(kPublic_DataSourceBlock), kPublic_DataSourceBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
- (kPublicDataSourceBlock)kPublic_DataSourceBlock {
	return objc_getAssociatedObject(self, _cmd);
}

@end
