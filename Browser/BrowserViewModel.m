//
//  BrowserViewModel.m
//  MyBrowser
//
//  Created by apple on 2015/03/21.
//  Copyright (c) 2015年 org. All rights reserved.
//

#import "BrowserViewModel.h"

@implementation BrowserViewModel

-(id) initWithSettings:(Settings*)settings
{
    self = [super init];
    if (self != nil) {
        self.array = [NSMutableArray arrayWithObjects:nil];
        _lastIndex = -1;
        _currentIndex = -1;
        self.settings = settings;
    }
    
    return self;
}

- (NSInteger)count
{
    return self.array.count;
}

- (void)moveFrom:(NSInteger)from to:(NSInteger)to
{
    if (from > to) {
        _moveDirection = false;
        _needMove = true;
    } else if (from < to) {
        _moveDirection = true;
        _needMove = true;
    } else {
        _needMove = false;
    }
}

- (void)add:(id)object
{
    if (self.canAdd) {
        [self.array addObject:object];
        _lastIndex = _currentIndex;
        if (_lastIndex == -1 && _currentIndex == -1) {
            _lastIndex = _currentIndex = 0;
            
        } else {
            _currentIndex = self.array.count - 1;
            [self moveFrom:_lastIndex to:_currentIndex];
        }
    }
}

- (id)remove
{
    id object;
    if (self.canRemove) {
        object = [self.array objectAtIndex:_currentIndex];
        [self.array removeObjectAtIndex:_currentIndex];
        
        if (_currentIndex > 0) {
            _currentIndex--;
        }
        if (_lastIndex > _currentIndex) {
            _lastIndex--;
        }
        
        [self moveFrom:_lastIndex to:_currentIndex];
    }
    return object;
}

- (void)goTo:(NSInteger)index
{
    _lastIndex = _currentIndex;
    _currentIndex = index;
}

- (id)currentObject
{
    return [self.array objectAtIndex:_currentIndex];
}

- (id)lastObject
{
    return [self.array lastObject];
}

- (id)objectAtIndex:(NSInteger)index
{
    return [self.array objectAtIndex:index];
}


- (NSInteger)currentIndex
{
    return _currentIndex;
}

- (NSInteger)lastIndex
{
    return _lastIndex;
}

- (BOOL)canAdd
{
    return self.array.count < self.settings.tabsSize;
}

- (BOOL)canRemove
{
    return self.array.count > 1;
}

- (BOOL)canSwitch
{
    return self.array.count > 1;
}

- (BOOL)needMove
{
    return _needMove;
}

- (BOOL)moveDirection
{
    return _moveDirection;
}


@end

