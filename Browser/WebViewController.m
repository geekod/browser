//
//  WebViewController.m
//  Browser
//
//  Created by apple on 2015/03/19.
//  Copyright (c) 2015年 org. All rights reserved.
//

#import "WebViewController.h"
#import "BrowserViewController.h"

@interface WebViewController ()

@end

@implementation WebViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil parent:(BrowserViewController *)parent
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.parent = parent;
        self.ctx = ((BrowserViewController*)parent).ctx;
        self.settings = self.ctx.settings;
        self.activityIndicatorView.hidesWhenStopped = YES;
        [self.activityIndicatorView stopAnimating];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.model = [[WebModel alloc] init];
    self.addressField.text = self.settings.homeUrlStr;
    self.webView.delegate = self;
    
    [self go];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)settingsButtonTouched:(id)sender
{
    NSLog(@"settingsButton touched");
    [self.parent goToSettingsView];
}

- (IBAction)goButtonTouched:(id)sender
{
    NSLog(@"goButton touched.");
    [self go];
}

- (IBAction)goBackButtonTouched:(id)sender
{
    NSLog(@"goBackButton touched.");
    [[self webView] goBack];
}

- (IBAction)goForwardButtonTouched:(id)sender
{
    NSLog(@"goForwardButton touched.");
    [[self webView] goForward];
}

- (IBAction)goReloadButtonTouched:(id)sender
{
    NSLog(@"goReloadButton touched.");
    [[self webView] reload];
}

- (IBAction)bookmarkButtonTouched:(id)sender
{

}

- (IBAction)createTabButtonTouched:(id)sender
{
    NSLog(@"createTabButton touched, parent %@", self.parentViewController == nil ? @"nil" : @"not nil");
    [self.parent createTab];
}

- (IBAction)switchTabButtonTouched:(id)sender
{
    NSLog(@"switchTabButton touched");
    [self.parent switchTab];
}

- (IBAction)closeTabButtonTouched:(id)sender
{
    NSLog(@"closeTabButton touched");
    [self.parent closeTab];
}

- (void)go
{
    NSLog(@"set address to %@", self.addressField.text);
    self.model.url = [NSURL URLWithString:self.addressField.text];
    [self.webView loadRequest:[NSURLRequest requestWithURL:self.model.url]];
}

- (void)updateAddress:(NSURLRequest*)request
{
    NSURL* url = [request mainDocumentURL];
    self.addressField.text = [url absoluteString];
}

- (void)updateStatusFrom:(id)sender createAvail:(BOOL)createAvail closeAvail:(BOOL)closeAvail
             switchAvail:(BOOL)switchAvail title:(NSString*)title
{
    [self updateButtons];
    self.createTabButton.enabled = createAvail;
    self.closeTabButton.enabled = closeAvail;
    self.switchTabButton.enabled = switchAvail;
}

- (void)updateButtons
{
    self.goBackButton.enabled = self.webView.canGoBack;
    self.goForwardButton.enabled = self.webView.canGoForward;
    self.goButton.enabled = ![self.addressField.text isEqualToString:@""];
    self.reloadButton.enabled = self.webView.request != nil;
}

- (void)updatePageTitle:(UIWebView *)webView
{
    NSString* pageTitle = [webView stringByEvaluatingJavaScriptFromString:@"document.title"];
    self.model.pageTitle = pageTitle;
    self.titleLabel.text = self.model.pageTitle;
}

- (NSString*)pageTitle
{
    return self.model.pageTitle;
}

- (void) webViewDidStartLoad:(UIWebView *)webView
{
    NSLog(@"page load started");
    [self.activityIndicatorView startAnimating];
}

- (void) webViewDidFinishLoad:(UIWebView *)webView
{
    NSLog(@"page load finished.");
    [self.activityIndicatorView stopAnimating];
    [self updateAddress:webView.request];
    [self updatePageTitle:webView];
    [self updateButtons];
}

- (void) webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    NSLog(@"page load failed with error %@", [error localizedDescription]);
    [self.activityIndicatorView stopAnimating];
    [[[UIAlertView alloc] initWithTitle:@"エラー" message:@"ページのロード処理にてエラーが発生しました。" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] show];
}

- (BOOL) webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    [self updateAddress:request];
    return YES;
}

@end
