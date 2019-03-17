//
//  SNNetworking+Group.m
//  ModuleXCShop
//
//  Created by snlo on 2019/3/16.
//  Copyright © 2019 XCShop. All rights reserved.
//

#import "SNNetworking+Group.h"

@implementation SNNetworking (Group)

+ (RACSignal *)cookmenu:(NSString *)menu pageNumber:(NSString *)pn success:(void(^)(id responseObject))success failure:(void(^)(NSError *error))failure {
	RACSignal * signal = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
		[SNNetworking postWithUrl:@"http://apis.juhe.cn/cook/query.php" parameters:@{@"menu":menu,@"key":COOK_KEY,@"dtype":@"json",@"pn":pn,@"rn":@"10"} progress:nil success:^(id responseObject) {
			[subscriber sendNext:responseObject];
			[subscriber sendCompleted];
		} failure:^(NSError *error) {
			[subscriber sendError:error];
		}];
		return nil;
	}];
	return signal;
}

+ (RACSignal *)todaymonth:(NSString *)month day:(NSString *)day success:(void(^)(id responseObject))success failure:(void(^)(NSError *error))failure {
	RACSignal * signal = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
		[SNNetworking getWithUrl:@"http://api.juheapi.com/japi/toh" parameters:@{@"month":month,@"key":TODAY_KEY,@"day":day,@"v":@"1.0"} progress:nil success:^(id responseObject) {
			[subscriber sendNext:responseObject];
			[subscriber sendCompleted];
		} failure:^(NSError *error) {
			[subscriber sendError:error];
		}];
		return nil;
	}];
	return signal;
}

@end
