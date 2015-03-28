//
//  BrowserViewController.m
//  MyBrowser
//
//  Created by apple on 2015/03/20.
//  Copyright (c) 2015年 org. All rights reserved.
//

#import "BrowserViewController.h"
#import "AppDelegate.h"
#import "WebViewController.h"
#import "SettingsViewController.h"

@interface BrowserViewController ()

@end

@implementation BrowserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    self.ctx = ((AppDelegate*)[[UIApplication sharedApplication] delegate]).ctx;
    self.webViewControllerArray = [[NSMutableArray alloc] init];
    self.model = [[BrowserViewModel alloc] initWithSettings:self.ctx.settings];
    currentWebViewIndex = -1;
    [self createTab];

    // for acceptance test only
    self.ctx.browserViewController = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void) updateStatus
{
    [(WebViewController*)[self.model currentObject]
     updateStatusFrom:self
     createAvail:self.model.canAdd
     closeAvail:self.model.canRemove
     switchAvail:self.model.canSwitch
     title:[NSString stringWithFormat:@""]];
}

- (void)updateStatusWithNeedMove:(BOOL)needMove moveDirection:(BOOL)direction
{
    if (needMove) {
//        UIView* view = [[self.view subviews] objectAtIndex:0];
//        [view removeFromSuperview];
//        
//        WebViewController* webViewController = [self.model currentObject];
//        [self.view addSubview:webViewController.view];

        
        
//        [(WebViewController*)self.model.currentObject view].alpha = 0.0f;
//        UIView* view = [[self.view subviews] objectAtIndex:0];
//        [view removeFromSuperview];
//        [UIView beginAnimations:@"animation" context:nil];
//        [UIView setAnimationDuration:1.0f];
//        [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
//        [UIView
//         setAnimationTransition:direction ? UIViewAnimationTransitionFlipFromLeft : UIViewAnimationTransitionFlipFromRight
//         forView:view cache:YES];
//        [(WebViewController*)self.model.currentObject view].alpha = 100.0f;
//        [UIView commitAnimations];
//        WebViewController* webViewController = [self.model currentObject];
//        [self.view bringSubviewToFront:webViewController.view];
        //view.hidden = YES;
    }
    [self updateStatus];
}

- (void)goToSettingsView
{
    self.settingsViewController = [[SettingsViewController alloc] initWithNibName:@"SettingsViewController" bundle:nil];
    [self.view addSubview:self.settingsViewController.view];
}

- (void)createTab
{
    WebViewController* webViewController = [[WebViewController alloc]
                                            initWithNibName:@"WebViewController" bundle:nil parent:self];
    [self.model add:webViewController];
    if([[self.view subviews] count] > 0) {
        [[[self.view subviews] objectAtIndex:0] removeFromSuperview];
    }
    [self.view addSubview:webViewController.view];
    
    [self updateStatus];
}

- (void)switchTab
{
    [self updateStatusWithNeedMove:self.model.needMove moveDirection:self.model.moveDirection];
    
    UIActionSheet* actionSheet = [[UIActionSheet alloc]
                                  initWithTitle:@"タブを選択してください" delegate:self cancelButtonTitle:nil
                                  destructiveButtonTitle:nil otherButtonTitles:nil];
    for (NSInteger i = 0; i < self.model.count; i++) {
        WebViewController* viewController = [self.model objectAtIndex:i];
        [actionSheet addButtonWithTitle:[NSString stringWithFormat:@"%i: %@", i,
                                         viewController.pageTitle]];
    }
    [actionSheet addButtonWithTitle:@"キャンセル"];
    actionSheet.cancelButtonIndex = actionSheet.numberOfButtons - 1;
    [actionSheet showInView:self.view];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex != actionSheet.cancelButtonIndex) {
        [self.model goTo:buttonIndex];
        if([[self.view subviews] count] > 0) {
            [[[self.view subviews] objectAtIndex:0] removeFromSuperview];
        }
        WebViewController* webViewController = [self.model objectAtIndex:buttonIndex];
        [self.view addSubview:webViewController.view];
        
        [self updateStatus];
    }
}

- (void)closeTab
{
    [[[self.view subviews] objectAtIndex:0] removeFromSuperview];
    [self.model remove];
    [self.view addSubview:[(WebViewController*)self.model.currentObject view]];
    [self updateStatus];
//    [self updateStatusWithNeedMove:self.model.needMove moveDirection:self.model.moveDirection];
//    [webViewController.view removeFromSuperview];
}

- (void)closeSettings
{
    [[[self.view subviews] objectAtIndex:0] removeFromSuperview];
}

@end
