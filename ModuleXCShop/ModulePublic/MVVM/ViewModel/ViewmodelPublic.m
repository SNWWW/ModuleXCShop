//
//  ViewmodelPublic.m
//  Module Name: Public
//
//  Created by snlo on 2019/3/15.
//  Copyright © 2019 snlo. All rights reserved.
//

#import "ViewmodelPublic.h"

@implementation ViewmodelPublic

#pragma mark -- model`s getter/setter
- (ModelPublic *)modelPublic {
    if (!_modelPublic) {
        _modelPublic = [[ModelPublic alloc] init];
    } return _modelPublic;
}

#pragma mark -- api

#pragma mark -- viewmodel`s command

@end
