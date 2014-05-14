//
//  HTSuitManager.h
//  J3Dps
//
//  Created by hadn't on 14-5-13.
//  Copyright (c) 2014年 hongtao5. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HTSuit.h"

@interface HTSuitManager : NSObject

@property (nonatomic,retain) HTSuit *nowSuit;
@property (nonatomic,retain) NSArray *allSuit;

+ (instancetype)sharedManager;

@end
