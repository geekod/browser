//
//  BrowserViewModelTests.m
//  Browser
//
//  Created by apple on 2015/03/22.
//  Copyright (c) 2015年 org. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "BrowserViewModel.h"
#import "AppContext.h"

@interface BrowserViewModelTests : XCTestCase

@property (strong, nonatomic) BrowserViewModel* model;
@property (strong, nonatomic) AppContext* ctx;
@property (weak, nonatomic) UIViewController* obj1;
@property (weak, nonatomic) UIViewController* obj2;

@property (assign, nonatomic) NSInteger origCount;
@property (assign, nonatomic) NSInteger origCurrentIndex;
@property (assign, nonatomic) NSInteger origLastIndex;
@property (weak, nonatomic) id origCurrentObject;

@end

@implementation BrowserViewModelTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.ctx = [[AppContext alloc] init];
    self.model = [[BrowserViewModel alloc] initWithSettings:self.ctx.settings];
    self.ctx.settings.tabsSize = 5;

    [self.model add:[[UIViewController alloc] init]];
    [self.model add:[[UIViewController alloc] init]];
    [self.model add:[[UIViewController alloc] init]];
    [self.model goTo:1];
    
    self.origCount = self.model.count;
    self.origCurrentIndex = self.model.currentIndex;
    self.origLastIndex = self.model.lastIndex;
    self.origCurrentObject = self.model.currentObject;
    
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    self.model = nil;
}

- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

- (void)testAdd {
    id obj = [[UIViewController alloc] init];
    [self.model add:obj];
    
    XCTAssertEqual(self.model.count, 4);
    XCTAssertEqual([self.model objectAtIndex:3], obj);
    XCTAssertEqual(self.model.currentIndex, 3);
    XCTAssertEqual(self.model.lastIndex, self.origCurrentIndex);
}

- (void)testRemove {
    id obj = [self.model remove];
    
    XCTAssertEqual(obj, self.origCurrentObject);
    XCTAssertEqual(self.model.count, 2);
    XCTAssertEqual(self.model.currentIndex, 0);
    XCTAssertEqual(self.model.lastIndex, 1);
    
    self.origCurrentObject = self.model.currentObject;
    obj = [self.model remove];
    
    XCTAssertEqual(obj, self.origCurrentObject);
    XCTAssertEqual(self.model.count, 1);
    XCTAssertEqual(self.model.currentIndex, 0);
    XCTAssertEqual(self.model.lastIndex, 0);
}

- (void)testGoTo {
    [self.model goTo:0];
    
    XCTAssertEqual(self.model.currentIndex, 0);
    XCTAssertEqual(self.model.lastIndex, self.origCurrentIndex);
}

- (void)testCount {
    XCTAssertEqual(self.model.count, 3);
}

- (void)testCurrentObject {
    XCTAssertEqual(self.model.currentObject, [self.model.array objectAtIndex:self.origCurrentIndex]);
}

- (void)testLastObject {
    XCTAssertEqual(self.model.lastObject, [self.model.array objectAtIndex:self.origLastIndex]);
}

- (void)testObjectAtIndex {
    XCTAssertEqual([self.model objectAtIndex:0], [self.model.array objectAtIndex:0]);
    XCTAssertEqual([self.model objectAtIndex:0], [self.model.array objectAtIndex:0]);
    XCTAssertEqual([self.model objectAtIndex:0], [self.model.array objectAtIndex:0]);
}

- (void)testCurrentIndex {
    [self.model goTo:0];
    
    XCTAssertEqual(self.model.currentIndex, 0);
}

- (void)testLastIndex {
    [self.model goTo:2];
    
    XCTAssertEqual(self.model.lastIndex, 1);
}

- (void)testCanAdd {
    self.ctx.settings.tabsSize = 4;
    XCTAssert([self.model canAdd]);
    self.ctx.settings.tabsSize = 3;
    XCTAssertFalse([self.model canAdd]);
}

- (void)testCanRemove {
    self.ctx.settings.tabsSize = 4;
    XCTAssert([self.model canAdd]);
    self.ctx.settings.tabsSize = 3;
    XCTAssertFalse([self.model canAdd]);
}

- (void)testCanSwitch {
    XCTAssert([self.model canSwitch]);}

- (void)testNeedMove {
    XCTAssertEqual(self.model.needMove, self.model.currentIndex != self.model.lastIndex);
}

- (void)testMoveDirection {
    XCTAssertEqual(self.model.moveDirection, self.model.currentIndex < self.model.lastIndex);
}


@end
