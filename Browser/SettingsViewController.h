//
//  SettingsViewController.h
//  MyBrowser
//
//  Created by apple on 2015/03/20.
//  Copyright (c) 2015年 org. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "BrowserViewController.h"

@interface SettingsViewController : UIViewController

@property (weak, nonatomic) AppContext* ctx;
@property (weak, nonatomic) Settings* settings;

@property (weak, nonatomic) IBOutlet UITextField* homeUrlStrText;
@property (weak, nonatomic) IBOutlet UITextField* tabsSizeText;
@property (weak, nonatomic) IBOutlet UIBarButtonItem* closeButton;

@end
