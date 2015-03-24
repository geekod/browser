//
//  WebViewController.h
//  Browser
//
//  Created by apple on 2015/03/19.
//  Copyright (c) 2015年 org. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WebModel.h"
#import "AppContext.h"
#import "Settings.h"
#import "BrowserViewController.h"

@interface WebViewController : UIViewController<UIWebViewDelegate>

@property (strong, nonatomic) WebModel* model;

@property (weak, nonatomic) AppContext* ctx;
@property (weak, nonatomic) Settings* settings;
@property (weak, nonatomic) BrowserViewController* parent;

@property (weak, nonatomic) IBOutlet UIBarButtonItem* bookmarkButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem* settingsButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem* goBackButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem* goForwardButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem* reloadButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem* goButton;
@property (weak, nonatomic) IBOutlet UITextField* addressField;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView* activityIndicatorView;
@property (weak, nonatomic) IBOutlet UILabel* titleLabel;
@property (weak, nonatomic) IBOutlet UIWebView* webView;

@property (weak, nonatomic) IBOutlet UIBarButtonItem* createTabButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem* switchTabButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem* closeTabButton;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil parent:(BrowserViewController*)parent;
- (void)go;
- (void)updateStatusFrom:(id)sender createAvail:(BOOL)createAvail closeAvail:(BOOL)closeAvail
             switchAvail:(BOOL)switchAvail title:(NSString*)title;
- (void)updatePageTitle:(UIWebView*)webView;
- (NSString*)pageTitle;

@end

