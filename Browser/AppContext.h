//
//  ContextModel.h
//  MyBrowser
//
//  Created by apple on 2015/03/20.
//  Copyright (c) 2015年 org. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Settings.h"

@interface AppContext : NSObject

@property (strong, nonatomic) Settings* settings;

@end
