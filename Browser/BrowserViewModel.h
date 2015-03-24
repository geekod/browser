//
//  BrowserViewModel.h
//  MyBrowser
//
//  Created by apple on 2015/03/21.
//  Copyright (c) 2015年 org. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Settings.h"

@interface BrowserViewModel : NSObject
{
    NSInteger _currentIndex;
    NSInteger _lastIndex;
    BOOL _needMove;
    BOOL _moveDirection;
}
@property (strong, nonatomic) NSMutableArray* array;

@property (weak, nonatomic) Settings* settings;

- (id)initWithSettings:(Settings*)settings;

- (void)add:(id)object;
- (id)remove;
- (void)goTo:(NSInteger)index;

- (NSInteger)count;
- (id)currentObject;
- (id)lastObject;
- (id)objectAtIndex:(NSInteger)index;
- (NSInteger)currentIndex;
- (NSInteger)lastIndex;

- (BOOL)canAdd;
- (BOOL)canRemove;
- (BOOL)canSwitch;
- (BOOL)needMove;
- (BOOL)moveDirection;

@end
