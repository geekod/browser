//
//  SettingsModel.h
//  MyBrowser
//
//  Created by apple on 2015/03/20.
//  Copyright (c) 2015年 org. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Settings : NSObject

@property (strong, nonatomic) NSString* homeUrlStr;
@property (assign, nonatomic) NSInteger tabsSize;

@end
