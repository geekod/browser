//
//  SettingsViewController.m
//  MyBrowser
//
//  Created by apple on 2015/03/20.
//  Copyright (c) 2015年 org. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.ctx = ((AppDelegate*)[[UIApplication sharedApplication] delegate]).ctx;
    self.settings = self.ctx.settings;
    
    self.homeUrlStrText.text = self.settings.homeUrlStr;
    self.tabsSizeText.text = [NSString stringWithFormat:@"%i", self.settings.tabsSize];
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

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog(@"The segue id is %@", segue.identifier);
    UIViewController *destination = segue.destinationViewController;
    if ([destination respondsToSelector:@selector(setData:)]) {
        [destination setValue:@"DataToSend" forKey:@"data"];
    }
}

- (IBAction)closeSettigns:(id)sender
{
    [self saveSettings];
    [self.view removeFromSuperview];
}

- (void)saveSettings
{
    self.settings.homeUrlStr = self.homeUrlStrText.text;
    self.settings.tabsSize = [self.tabsSizeText.text integerValue];
}

@end
