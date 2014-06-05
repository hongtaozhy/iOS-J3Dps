//
//  UIButton+HaveEquip.m
//  J3Dps
//
//  Created by hongtao on 14-6-5.
//  Copyright (c) 2014年 hongtao5. All rights reserved.
//

#import "UIButton+HaveEquip.h"
#import "objc/runtime.h"

static void * haveEquipKey = (void *)@"haveEquipKey";

@implementation UIButton (HaveEquip)
@dynamic haveEquip;

- (NSDictionary *)haveEquip
{
    return objc_getAssociatedObject(self, haveEquipKey);
}

- (void)setHaveEquip:(NSDictionary *)haveEquip
{
    objc_setAssociatedObject(self, haveEquipKey, haveEquip, OBJC_ASSOCIATION_ASSIGN);
}

@end
