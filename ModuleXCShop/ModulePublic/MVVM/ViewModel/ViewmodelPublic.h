//
//  ViewmodelPublic.h
//  Module Name: Public
//
//  Created by snlo on 2019/3/15.
//  Copyright © 2019 snlo. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "PublicProtocol.h"

#import "ModelPublic.h"

@interface ViewmodelPublic : NSObject <PublicProtocol>

#pragma mark -- model`s getter/setter
@property (nonatomic, strong) ModelPublic * modelPublic;

#pragma mark -- api

#pragma mark -- viewmodel`s command

@end
