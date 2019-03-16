//
//  SNNetworking+Group.h
//  ModuleXCShop
//
//  Created by snlo on 2019/3/16.
//  Copyright © 2019 XCShop. All rights reserved.
//

#import "SNNetworking.h"

@interface SNNetworking (Group)

//http://apis.juhe.cn/cook/query.php


/**
 菜谱

 @param menu 类目
 @param pn 当前页
 */
+ (RACSignal *)cookmenu:(NSString *)menu pageNumber:(NSString *)pn success:(void(^)(id responseObject))success failure:(void(^)(NSError *error))failure;

@end

