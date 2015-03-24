//
//  BrowserViewController.h
//  MyBrowser
//
//  Created by apple on 2015/03/20.
//  Copyright (c) 2015年 org. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppContext.h"
#import "BrowserViewModel.h"

@interface BrowserViewController : UIViewController<UIActionSheetDelegate>
{
    NSInteger currentWebViewIndex;
    NSInteger lastWebViewIndex;
}
@property (strong, nonatomic) NSMutableArray* webViewControllerArray;
@property (strong, nonatomic) BrowserViewModel* model;
@property (strong, nonatomic) UIViewController* settingsViewController;

@property (weak, nonatomic) AppContext* ctx;

- (void)createTab;
- (void)switchTab;
- (void)closeTab;
- (void)goToSettingsView;
- (void)closeSettings;


@end

