//
//  HTSuitManager.m
//  J3Dps
//
//  Created by hadn't on 14-5-13.
//  Copyright (c) 2014年 hongtao5. All rights reserved.
//

#import "HTSuitManager.h"

@implementation HTSuitManager

+ (instancetype)sharedManager
{
    static dispatch_once_t onceQueue;
    static HTSuitManager *sharedManager = nil;
    
    dispatch_once(&onceQueue, ^{
        sharedManager = [[self alloc] init];
        sharedManager.allSuit = [[NSArray alloc] init];
    });
    
    return sharedManager;
}

- (HTSuit *)nowSuit
{
    if (_nowSuit == nil)
    {
        _nowSuit = [[HTSuit alloc] init];
    }
    return _nowSuit;
}

@end
