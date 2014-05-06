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

@end
