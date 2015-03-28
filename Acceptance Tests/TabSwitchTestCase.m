//
//  TabSwitchTestCase.m
//  Browser
//
//  Created by apple on 2015/03/28.
//  Copyright (c) 2015年 org. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import <KIF/KIF.h>
#import "AppDelegate.h"
#import "BrowserViewController.h"
#import "WebViewController.h"

@interface TabSwitchTestCase : KIFTestCase

@property (weak, nonatomic) BrowserViewController* browserViewController;

@end

@implementation TabSwitchTestCase

- (void)beforeEach
{
    self.browserViewController = ((AppDelegate*)[[UIApplication sharedApplication] delegate]).ctx.browserViewController;
    [tester clearTextFromAndThenEnterText:@"http://yahoo.jp/" intoViewWithAccessibilityLabel:@"Address Field"];
    [tester tapViewWithAccessibilityLabel:@"Play"];
    [tester waitForTimeInterval:2];
}

- (void)afterEach
{
    while (self.browserViewController.model.count > 1) {
        [self.browserViewController closeTab];
    }
}

- (void)testAdd
{
    [tester tapViewWithAccessibilityLabel:@"Add"];
    XCTAssertEqual(self.browserViewController.model.count, 2);
    
    [tester waitForTimeInterval:5];
    XCTAssertEqualObjects(@"Yahoo! JAPAN", ((WebViewController*)self.browserViewController.model.currentObject).model.pageTitle);
}

- (void)testClose
{
    // Prepare a tab to close
    [tester tapViewWithAccessibilityLabel:@"Add"];
    XCTAssertEqual(self.browserViewController.model.count, 2);
    
    // Close
    [tester tapViewWithAccessibilityLabel:@"Stop"];
    XCTAssertEqual(self.browserViewController.model.count, 1);

}

- (void)testSwitch
{
    // Prepare a tab to close
    [tester tapViewWithAccessibilityLabel:@"Add"];
    XCTAssertEqual(self.browserViewController.model.count, 2);
    
    // Switch
    [tester tapViewWithAccessibilityLabel:@"Reply"];
    [tester tapViewWithAccessibilityLabel:@"0: Yahoo! JAPAN"];
    XCTAssertEqual(self.browserViewController.model.currentIndex, 0);
    
    [tester waitForTimeInterval:5];
    [tester tapViewWithAccessibilityLabel:@"Reply"];
    [tester tapViewWithAccessibilityLabel:@"1: Yahoo! JAPAN"];
    XCTAssertEqual(self.browserViewController.model.currentIndex, 1);
}

- (void)testGo
{
    [tester clearTextFromAndThenEnterText:@"http://search.yahoo.co.jp/" intoViewWithAccessibilityLabel:@"Address Field"];
    [tester tapViewWithAccessibilityLabel:@"Play"];

    // Verify that the login succeeded
    //    [tester waitForTappableViewWithAccessibilityLabel:@"Welcome"];
    [tester waitForTimeInterval:5];
    XCTAssertEqualObjects(@"Yahoo!検索", ((WebViewController*)self.browserViewController.model.currentObject).model.pageTitle);
    
}

@end
