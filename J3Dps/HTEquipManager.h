//
//  HTEquipManager.h
//  J3Dps
//
//  Created by hadn't on 14-5-6.
//  Copyright (c) 2014年 hongtao5. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HTEquipManager : NSObject

@property (nonatomic,retain) NSArray *allEquip;

+ (instancetype)sharedManager;

- (void)initData;

@end
