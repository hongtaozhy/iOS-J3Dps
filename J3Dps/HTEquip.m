//
//  HTEquip.m
//  J3Dps
//
//  Created by hadn't on 14-5-6.
//  Copyright (c) 2014年 hongtao5. All rights reserved.
//

#import "HTEquip.h"

@implementation HTEquip

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        self.quality = 0;
        self.score = 0;
        
        self.huixin = 0;
        self.huixiao = 0;
        self.mingzhong = 0;
        self.pofang = 0;
        self.wushuang = 0;
        self.jiasu = 0;
        
        self.gongji = 0;
        self.zhiliaoliang = 0;
        self.yujin = 0;
        self.huajin = 0;
        
        self.tuijian  = HTNoTuijian;
        self.jinglianLevel = 0;
        
        self.tizhi = 0;
        self.lidao = 0;
        self.shenfa = 0;
        self.yuanqi = 0;
        self.gengu = 0;
        
        self.texiao = 0;
    }
    return self;
}

- (NSString *)description
{
    return  [NSString stringWithFormat:@"%@\n掉落:%@\n体质+%d\n根骨+%d\n力道+%d\n身法+%d\n元气+%d\n攻击+%d\n破防+%d\n会心+%d\n会效+%d\n命中+%d\n无双+%d\n御劲+%d\n化劲+%d\n",
             self.name,
             self.diaoluo,
             (int)self.tizhi,
             (int)self.gengu,
             (int)self.lidao,
             (int)self.shenfa,
             (int)self.yuanqi,
             (int)self.gongji,
             (int)self.pofang,
             (int)self.huixin,
             (int)self.huixiao,
             (int)self.mingzhong,
             (int)self.wushuang,
             (int)self.yujin,
             (int)self.huajin];
}
@end
