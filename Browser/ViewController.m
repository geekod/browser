//
//  ViewController.m
//  Browser
//
//  Created by apple on 2015/03/22.
//  Copyright (c) 2015年 org. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    self.browserViewController = [[BrowserViewController alloc] initWithNibName:@"BrowserViewController" bundle:nil];
    [self addChildViewController:self.browserViewController];
    [self.view addSubview:self.browserViewController.view];
    [self.browserViewController didMoveToParentViewController:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
