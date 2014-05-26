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
        self.p_id = 0;
        self.uiid = 0;
        self.iconID = 0;
        self.quality = 0;
        self.score = 0;
        
        self.basicPhysicsSheild = 0;
        self.basicMagicSheild = 0;
        self.physicsShield = 0;
        self.magicSheild = 0;
        self.dodge = 0;
        self.parryBase = 0;
        self.parryValue = 0;
        
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
        self.jinglianLevel = 0;
        self.tizhi = 0;
        self.lidao = 0;
        self.shenfa = 0;
        self.yuanqi = 0;
        self.gengu = 0;
        
        self.threat = 0.0;
        self.texiao = 0;
    }
    return self;
}

- (id)copyWithZone:(NSZone *)zone
{
    HTEquip *result = [[[self class] allocWithZone:zone] init];
    result.p_id = self.p_id;
    result.uiid = self.uiid;
    result.iconID = self.iconID;
    result.name = [self.name copy];
    result.xinfatype = self.xinfatype;
    result.buWei = self.buWei;
    
    result.quality = self.quality;
    result.score = self.score;

    result.tizhi = self.tizhi;
    result.gengu = self.gengu;
    result.lidao = self.lidao;
    result.shenfa = self.shenfa;
    result.yuanqi = self.yuanqi;
    
    result.basicPhysicsSheild = self.basicPhysicsSheild;
    result.basicMagicSheild = self.basicMagicSheild;
    result.physicsShield = self.physicsShield;
    result.magicSheild = self.magicSheild;
    result.dodge = self.dodge;
    result.parryBase = self.parryBase;
    result.parryValue = self.parryValue;
    
    result.gongji = self.gongji;
    result.zhiliaoliang = self.zhiliaoliang;
    
    result.huixin = self.huixin;
    result.huixiao = self.huixiao;
    result.pofang = self.pofang;
    result.mingzhong = self.mingzhong;
    result.wushuang = self.wushuang;
    result.jiasu = self.jiasu;
    
    result.yujin = self.yujin;
    result.huajin = self.huajin;
    
    result.threat = self.threat;
    result.xiangqian = [self.xiangqian copy];
    result.jinglianLevel = self.jinglianLevel;
    result.diaoluo = [self.diaoluo copy];
    result.texiao = self.texiao;
    
    return result;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeInteger:self.p_id forKey:@"p_id"];
    [aCoder encodeInteger:self.uiid forKey:@"uiid"];
    [aCoder encodeInteger:self.iconID forKey:@"iconid"];
    
    [aCoder encodeObject:self.name forKey:@"name"];
//    [aCoder encodeInteger:self.menpai forKey:@"menpai"];
    [aCoder encodeInteger:self.xinfatype forKey:@"xinfatype"];
    [aCoder encodeInteger:self.buWei forKey:@"buwei"];
    
    [aCoder encodeInteger:self.quality forKey:@"quality"];
    [aCoder encodeInteger:self.score forKey:@"score"];
    
    [aCoder encodeInteger:self.tizhi forKey:@"tizhi"];
    [aCoder encodeInteger:self.gengu forKey:@"gengu"];
    [aCoder encodeInteger:self.lidao forKey:@"lidao"];
    [aCoder encodeInteger:self.shenfa forKey:@"shenfa"];
    [aCoder encodeInteger:self.yuanqi forKey:@"yuanqi"];
    
    [aCoder encodeInteger:self.basicPhysicsSheild forKey:@"basicPhysicsSheild"];
    [aCoder encodeInteger:self.basicMagicSheild forKey:@"basicMagicSheild"];
    [aCoder encodeInteger:self.physicsShield forKey:@"physicsShield"];
    [aCoder encodeInteger:self.magicSheild forKey:@"magicSheild"];
    [aCoder encodeInteger:self.dodge forKey:@"dodge"];
    [aCoder encodeInteger:self.parryBase forKey:@"parryBase"];
    [aCoder encodeInteger:self.parryValue forKey:@"parryValue"];
    
    [aCoder encodeInteger:self.gongji forKey:@"gongji"];
    [aCoder encodeInteger:self.zhiliaoliang forKey:@"zhiliaoliang"];
    
    [aCoder encodeDouble:self.threat forKey:@"threat"];
    
    [aCoder encodeInteger:self.huixin forKey:@"huixin"];
    [aCoder encodeInteger:self.huixiao forKey:@"huixiao"];
    [aCoder encodeInteger:self.pofang forKey:@"pofang"];
    [aCoder encodeInteger:self.mingzhong forKey:@"mingzhong"];
    [aCoder encodeInteger:self.wushuang forKey:@"wushuang"];
    [aCoder encodeInteger:self.jiasu forKey:@"jiasu"];
    
    [aCoder encodeInteger:self.yujin forKey:@"yujin"];
    [aCoder encodeInteger:self.huajin forKey:@"huajin"];
    
    [aCoder encodeObject:self.xiangqian forKey:@"xiangqian"];
    [aCoder encodeInteger:self.jinglianLevel forKey:@"jinglianLevel"];
    [aCoder encodeObject:self.diaoluo forKey:@"diaoluo"];
    [aCoder encodeInteger:self.texiao forKey:@"texiao"];

}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init])
    {
        self.p_id = [aDecoder decodeIntegerForKey:@"p_id"];
        self.uiid = [aDecoder decodeIntegerForKey:@"uiid"];
        self.iconID = [aDecoder decodeIntegerForKey:@"iconid"];
        
        self.name = [aDecoder decodeObjectForKey:@"name"];
//        self.menpai = [aDecoder decodeIntegerForKey:@"menpai"];
        self.xinfatype = [aDecoder decodeIntegerForKey:@"xinfatype"];
        self.buWei = [aDecoder decodeIntegerForKey:@"buwei"];
        
        self.quality = [aDecoder decodeIntegerForKey:@"quality"];
        self.score = [aDecoder decodeIntegerForKey:@"score"];
        
        self.tizhi = [aDecoder decodeIntegerForKey:@"tizhi"];
        self.gengu = [aDecoder decodeIntegerForKey:@"gengu"];
        self.lidao = [aDecoder decodeIntegerForKey:@"lidao"];
        self.shenfa = [aDecoder decodeIntegerForKey:@"shenfa"];
        self.yuanqi = [aDecoder decodeIntegerForKey:@"yuanqi"];
        
        self.basicPhysicsSheild = [aDecoder decodeIntegerForKey:@"basicPhysicsSheild"];
        self.basicMagicSheild = [aDecoder decodeIntegerForKey:@"basicMagicSheild"];
        self.physicsShield = [aDecoder decodeIntegerForKey:@"physicsShield"];
        self.magicSheild = [aDecoder decodeIntegerForKey:@"magicSheild"];
        self.dodge = [aDecoder decodeIntegerForKey:@"dodge"];
        self.parryBase = [aDecoder decodeIntegerForKey:@"parryBase"];
        self.parryValue = [aDecoder decodeIntegerForKey:@"parryValue"];
        self.threat = [aDecoder decodeDoubleForKey:@"threat"];
        
        self.gongji = [aDecoder decodeIntegerForKey:@"gongji"];
        self.zhiliaoliang = [aDecoder decodeIntegerForKey:@"zhiliaoliang"];
        
        self.huixin = [aDecoder decodeIntegerForKey:@"huixin"];
        self.huixiao = [aDecoder decodeIntegerForKey:@"huixiao"];
        self.pofang = [aDecoder decodeIntegerForKey:@"pofang"];
        self.mingzhong = [aDecoder decodeIntegerForKey:@"mingzhong"];
        self.wushuang = [aDecoder decodeIntegerForKey:@"wushuang"];
        self.jiasu = [aDecoder decodeIntegerForKey:@"jiasu"];
        
        self.yujin = [aDecoder decodeIntegerForKey:@"yujin"];
        self.huajin = [aDecoder decodeIntegerForKey:@"huajin"];
        
        self.xiangqian = [aDecoder decodeObjectForKey:@"xiangqian"];
        self.jinglianLevel = [aDecoder decodeIntegerForKey:@"jinglianLevel"];
        self.diaoluo = [aDecoder decodeObjectForKey:@"diaoluo"];
        self.texiao = [aDecoder decodeIntegerForKey:@"texiao"];
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
