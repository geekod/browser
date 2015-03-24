//
//  WebModel.h
//  MyBrowser
//
//  Created by apple on 2015/03/20.
//  Copyright (c) 2015年 org. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WebModel : NSObject

@property (strong, nonatomic) NSString* urlStr;
@property (strong, nonatomic) NSURL* url;
@property (strong, nonatomic) NSString* pageTitle;

@end
