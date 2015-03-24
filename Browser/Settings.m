//
//  SettingsModel.m
//  MyBrowser
//
//  Created by apple on 2015/03/20.
//  Copyright (c) 2015年 org. All rights reserved.
//

#import "Settings.h"

@implementation Settings

-(id) init
{
    self = [super init];
    if (self != nil) {
        self.homeUrlStr = @"http://yahoo.jp";
        self.tabsSize = 5;
    }
    
    return self;
}

@end
