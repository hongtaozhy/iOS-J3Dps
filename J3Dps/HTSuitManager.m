//
//  HTSuitManager.m
//  J3Dps
//
//  Created by hadn't on 14-5-13.
//  Copyright (c) 2014年 hongtao5. All rights reserved.
//

#import "HTSuitManager.h"

@interface HTSuitManager()
@property (nonatomic,retain) NSString *suitsFileName;
@end

@implementation HTSuitManager

+ (instancetype)sharedManager
{
    static dispatch_once_t onceQueue;
    static HTSuitManager *sharedManager = nil;
    
    dispatch_once(&onceQueue, ^{
        sharedManager = [[self alloc] init];
        sharedManager.allSuit = [NSKeyedUnarchiver unarchiveObjectWithFile:sharedManager.suitsFileName];
        if (sharedManager.allSuit == nil || ![sharedManager.allSuit isKindOfClass:NSMutableDictionary.class])
        {
            sharedManager.allSuit = [[NSMutableDictionary alloc] init];
        }
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

- (void)saveNowSuitWithName:(NSString *)name
{
    [self.nowSuit setSuitName:name];
    [self.allSuit setObject:[self.nowSuit copy] forKey:name];
    [NSKeyedArchiver archiveRootObject:[self allSuit] toFile:self.suitsFileName];
}

- (void)loadSuitWithName:(NSString *)name
{
    self.nowSuit = [[self.allSuit objectForKey:name] copy];
}

- (NSString *)suitsFileName
{
    NSString *Path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *filename = [Path stringByAppendingPathComponent:@"suits.plist"];

    return filename;
}

- (void)loadFirstSuit
{
    if (self.allSuit.count > 0)
    {
        self.nowSuit = [[[[HTSuitManager sharedManager] allSuit] allValues] objectAtIndex:0];
    }
}

@end
