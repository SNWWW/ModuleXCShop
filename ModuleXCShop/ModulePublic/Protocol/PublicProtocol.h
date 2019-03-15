//
//  PublicProtocol.h
//  Module Name: Public
//
//  Created by snlo on 2019/3/15.
//  Copyright © 2019 snlo. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <SNModuleKit.h>

#import "PublicMacroHeader.h"
#import "PublicUtilsHeader.h"
#import "PublicVenderHeader.h"
#import "PublicCategoriesHeader.h"

#import <SNConcreteProtocol.h>

static NSString * const kPublic = @"kPublic";

static NSString * const kNativeFetchPublicViewController = @"nativeFetchPublicViewController";

@protocol PublicProtocol <NSObject>

@concrete

@end
