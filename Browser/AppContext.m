//
//  ContextModel.m
//  MyBrowser
//
//  Created by apple on 2015/03/20.
//  Copyright (c) 2015年 org. All rights reserved.
//

#import "AppContext.h"

@implementation AppContext

-(id) init
{
    self = [super init];
    if (self != nil) {
        self.settings = [[Settings alloc] init];
    }
    
    return self;
}

@end
