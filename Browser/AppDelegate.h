//
//  AppDelegate.h
//  Browser
//
//  Created by apple on 2015/03/22.
//  Copyright (c) 2015年 org. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppContext.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) AppContext* ctx;

@end

