//
//  HTSuit.m
//  J3Dps
//
//  Created by hadn't on 14-5-13.
//  Copyright (c) 2014年 hongtao5. All rights reserved.
//

#import "HTSuit.h"

@interface HTSuit ()
//私有计算用属性是定值 不需要存 走如下两方法
// setBaseValueWithMenpai:isDefaultXinfa:
// setBasePropertyWithBody:
@property (nonatomic,assign) double bloodCoefficient;
@property (nonatomic,assign) double attack;
@property (nonatomic,assign) double huixin;
@property (nonatomic,assign) double mingzhong;
@property (nonatomic,assign) HTXinfaType xinfaType;
@property (nonatomic,assign) double attackMainPCoefficient;
@property (nonatomic,assign) double huixinMainPCoefficient;
@property (nonatomic,assign) double huixiaoMainPCoefficient;
@property (nonatomic,assign) double pofangMainPCoefficient;

@end

@implementation HTSuit
@synthesize bodyString = _bodyString;
@synthesize body = _body;
@synthesize xinFaString = _xinFaString;
@synthesize mainPropertyString = _mainPropertyString;

- (id)copyWithZone:(NSZone *)zone
{
    HTSuit *result = [[[self class] allocWithZone:zone] init];
    HTBody body = self.body;
    [result setBody:body];
    result.isDefaultXinFa = self.isDefaultXinFa;
    HTMenpai menpai = self.menpai;
    [result setMenpai:menpai];
    
    result.suitName = [self.suitName copy];
    result.hushou = [self.hushou copy];
    result.shangyi = [self.shangyi copy];
    result.yaodai = [self.yaodai copy];
    result.xiezi = [self.xiezi copy];
    result.xiazhuang = [self.xiazhuang copy];
    result.maozi = [self.maozi copy];
    
    result.jiezhi1 = [self.jiezhi1 copy];
    result.jiezhi2 = [self.jiezhi2 copy];
    result.yaozhui = [self.yaozhui copy];
    result.xianglian = [self.xianglian copy];
    result.wuqi = [self.wuqi copy];
    result.anqi = [self.anqi copy];
    return result;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
//    [aCoder encodeDouble:_bloodCoefficient forKey:@"bloodCoefficient"];
//    [aCoder encodeDouble:_attack forKey:@"attack"];
//    [aCoder encodeDouble:_huixin forKey:@"huixin"];
//    [aCoder encodeDouble:_mingzhong forKey:@"mingzhong"];
//    [aCoder encodeInteger:_xinfaType forKey:@"xinfatype"];
//    [aCoder encodeDouble:_attackMainPCoefficient forKey:@"attackMainPCoefficient"];
//    [aCoder encodeDouble:_huixinMainPCoefficient forKey:@"huixinMainPCoefficient"];
//    [aCoder encodeDouble:_huixiaoMainPCoefficient forKey:@"huixiaoMainPCoefficient"];
//    [aCoder encodeDouble:_pofangMainPCoefficient forKey:@"pofangMainPCoefficient"];
    [aCoder encodeInteger:self.body forKey:@"body"];
    [aCoder encodeBool:self.isDefaultXinFa forKey:@"isdefaultxinfa"];
    [aCoder encodeInteger:self.menpai forKey:@"menpai"];
    
    [aCoder encodeObject:self.suitName forKey:@"suitname"];
    [aCoder encodeObject:self.hushou forKey:@"hushou"];
    [aCoder encodeObject:self.shangyi forKey:@"shangyi"];
    [aCoder encodeObject:self.yaodai forKey:@"yaodai"];
    [aCoder encodeObject:self.xiezi forKey:@"xiezi"];
    [aCoder encodeObject:self.xiazhuang forKey:@"xiazhuang"];
    [aCoder encodeObject:self.maozi forKey:@"maozi"];
    
    [aCoder encodeObject:self.jiezhi1 forKey:@"jiezhi1"];
    [aCoder encodeObject:self.jiezhi2 forKey:@"jiezhi2"];
    [aCoder encodeObject:self.yaozhui forKey:@"yaozhui"];
    [aCoder encodeObject:self.xianglian forKey:@"xianglian"];
    [aCoder encodeObject:self.wuqi forKey:@"wuqi"];
    [aCoder encodeObject:self.anqi forKey:@"anqi"];

}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init])
    {
//        _bloodCoefficient = [aDecoder decodeDoubleForKey:@"bloodCoefficient"];
//        _attack = [aDecoder decodeDoubleForKey:@"attack"];
//        _huixin = [aDecoder decodeDoubleForKey:@"huixin"];
//        _mingzhong = [aDecoder decodeDoubleForKey:@"mingzhong"];
//        _xinfaType = [aDecoder decodeIntegerForKey:@"xinfatype"];
//        _attackMainPCoefficient = [aDecoder decodeDoubleForKey:@"attackMainPCoefficient"];
//        _huixinMainPCoefficient = [aDecoder decodeDoubleForKey:@"huixinMainPCoefficient"];
//        _huixiaoMainPCoefficient = [aDecoder decodeDoubleForKey:@"huixiaoMainPCoefficient"];
//        _pofangMainPCoefficient = [aDecoder decodeDoubleForKey:@"pofangMainPCoefficient"];
        
        HTBody body = [aDecoder decodeIntegerForKey:@"body"];
        [self setBody:body];
        self.isDefaultXinFa = [aDecoder decodeBoolForKey:@"isdefaultxinfa"];
        HTMenpai menpai = [aDecoder decodeIntegerForKey:@"menpai"];
        [self setMenpai:menpai];
        
        self.suitName = [aDecoder decodeObjectForKey:@"suitname"];
        self.hushou = [aDecoder decodeObjectForKey:@"hushou"];
        self.shangyi = [aDecoder decodeObjectForKey:@"shangyi"];
        self.yaodai = [aDecoder decodeObjectForKey:@"yaodai"];
        self.xiezi = [aDecoder decodeObjectForKey:@"xiezi"];
        self.xiazhuang = [aDecoder decodeObjectForKey:@"xiazhuang"];
        self.maozi = [aDecoder decodeObjectForKey:@"maozi"];
        
        self.jiezhi1 = [aDecoder decodeObjectForKey:@"jiezhi1"];
        self.jiezhi2 = [aDecoder decodeObjectForKey:@"jiezhi2"];
        self.yaozhui = [aDecoder decodeObjectForKey:@"yaozhui"];
        self.xianglian = [aDecoder decodeObjectForKey:@"xianglian"];
        self.wuqi = [aDecoder decodeObjectForKey:@"wuqi"];
        self.anqi = [aDecoder decodeObjectForKey:@"anqi"];
        
    }
    return self;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _bodyString = @"未选择体型";//属性采用loli值
        self.basetizhi = 95;
        self.basegengu = 98;
        self.baselidao = 96;
        self.baseshenfa = 99;
        self.baseyuanqi = 97;
        _body = HTNoSelect;
        _xinfa = 0;
        _xinFaString = @"未选择心法";
        self.suitName = @"未命名配装";
        _bloodCoefficient = 1.0;
        _xinfaType = HTWaiGong;
        _attackMainPCoefficient = 0;
        _huixin = 0;
        _menpai = -1;
    }
    return self;
}

- (void)setMenpai:(HTMenpai)menpai
{
    _menpai = menpai;
    [self setBaseValueWithMenpai:menpai isDefaultXinfa:self.isDefaultXinFa];
}

- (void)setBody:(HTBody)body
{
    _body = body;
    [self setBasePropertyWithBody:body];
}

- (void)setBasePropertyWithBody:(HTBody)body;
{
    switch (body) {
        case HTBodyLoli:
        {
            _bodyString = @"萝莉";
            self.basetizhi = 95;
            self.basegengu = 98;
            self.baselidao = 96;
            self.baseshenfa = 99;
            self.baseyuanqi = 97;
        }
            break;
        case HTBodyWoman:
        {
            _bodyString = @"御姐";
            self.basetizhi = 96;
            self.basegengu = 98;
            self.baselidao = 97;
            self.baseshenfa = 98;
            self.baseyuanqi = 96;
        }
            break;
        case HTBodyMan:
        {
            _bodyString = @"成男";
            self.basetizhi = 99;
            self.basegengu = 96;
            self.baselidao = 98;
            self.baseshenfa = 97;
            self.baseyuanqi = 95;
        }
            break;
        case HTBodyBoy:
        {
            _bodyString = @"正太";
            self.basetizhi = 96;
            self.basegengu = 98;
            self.baselidao = 96;
            self.baseshenfa = 98;
            self.baseyuanqi = 95;
        }
            break;
        default:
            self.basetizhi = 95;
            self.basegengu = 98;
            self.baselidao = 96;
            self.baseshenfa = 99;
            self.baseyuanqi = 97;
            
            _bodyString = @"未选择体型";
            break;
    }
}

- (void)setBaseValueWithMenpai:(HTMenpai)menpai isDefaultXinfa:(BOOL)isDefault
{
    switch (menpai) {
        case HTXX:
        {
            if (isDefault)
            {
                _xinfa = HTBingXin;
                _pofangMainPCoefficient = 0;
                _mingzhong = 119.0;
                _huixiaoMainPCoefficient = 0.02;
                _huixin = 0;
                _huixinMainPCoefficient = 0.08;
                _attackMainPCoefficient = 2.85;
                _xinfaType = HTNeiGong;
                _attack = 1719;
                _bloodCoefficient = 1.56;
                _xinFaString = @"冰心诀";
            }
            else
            {
                _xinfa = HTYunShang;
                _pofangMainPCoefficient = 0;
                _mingzhong = 0;
                _huixiaoMainPCoefficient = 0.02;
                _huixin = 0;
                _huixinMainPCoefficient = 0.08;
                _attackMainPCoefficient = 0;
                _xinfaType = HTZhiliao;
                _attack = 0;
                _bloodCoefficient = 1.56;
                _xinFaString = @"云裳心经";
            }
        }
            break;
        case HTCY:
        {
            if (isDefault)
            {
                _xinfa = HTTaiXu;
                _pofangMainPCoefficient = 0;
                _mingzhong = 109.0;
                _huixiaoMainPCoefficient = 0.05;
                _huixin = 20;
                _huixinMainPCoefficient = 0.15;
                _attackMainPCoefficient = 2.25;
                _xinfaType = HTWaiGong;
                _attack = 1551;
                _bloodCoefficient = 1.6;
                _xinFaString = @"太虚剑意";
            }
            else
            {
                _xinfa = HTZiXia;
                _pofangMainPCoefficient = 0;
                _mingzhong = 119.0;
                _huixiaoMainPCoefficient = 0.05;
                _huixin = 23;
                _huixinMainPCoefficient = 0.15;
                _attackMainPCoefficient = 2.7;
                _xinfaType = HTNeiGong;
                _attack = 1726;
                _bloodCoefficient = 1.56;
                _xinFaString = @"紫霞功";
            }
        }
            break;
        case HTTC:
        {
            if (isDefault)
            {
                _xinfa = HTAoXue;
                _pofangMainPCoefficient = 0.08;
                _mingzhong = 94.0;
                _huixiaoMainPCoefficient = 0;
                _huixin = 0;
                _huixinMainPCoefficient = 0;
                _attackMainPCoefficient = 2.4;
                _xinfaType = HTWaiGong;
                _attack = 1488;
                _bloodCoefficient = 1.64;
                _xinFaString = @"傲血战意";
            }
            else
            {
                _xinfa = HTTieLao;
                _pofangMainPCoefficient = 0;
                _mingzhong = 0;
                _huixiaoMainPCoefficient = 0;
                _huixin = 0;
                _huixinMainPCoefficient = 0;
                _attackMainPCoefficient = 0;
                _attack = 0;
                _xinfaType = HTFangyu;
                _bloodCoefficient = 1.96;
                _xinFaString = @"铁牢律";
            }
        }
            break;
        case HTHH:
        {
            if (isDefault)
            {
                _xinfa = HTHuaJian;
                _pofangMainPCoefficient = 0.08;
                _mingzhong = 117.0;
                _huixiaoMainPCoefficient = 0;
                _huixin = 0;
                _huixinMainPCoefficient = 0;
                _attackMainPCoefficient = 2.85;
                _xinfaType = HTNeiGong;
                _attack = 1727;
                _bloodCoefficient = 1.56;
                _xinFaString = @"花间游";
            }
            else
            {
                _xinfa = HTLiJing;
                _pofangMainPCoefficient = 0;
                _mingzhong = 0;
                _huixiaoMainPCoefficient = 0.05;
                _huixin = 0;
                _huixinMainPCoefficient = 0.15;
                _attackMainPCoefficient = 0;
                _attack = 0;
                _xinfaType = HTZhiliao;
                _bloodCoefficient = 1.56;
                _xinFaString = @"离经易道";
            }
        }
            break;
        case HTCJ:
        {
            if (isDefault)
            {
                _xinfa = HTWenShuiAndShanju;
                _pofangMainPCoefficient = 0.08;
                _mingzhong = 99.0;
                _huixiaoMainPCoefficient = 0;
                _huixin = 14;
                _huixinMainPCoefficient = 0;
                _attackMainPCoefficient = 2.4;
                _xinfaType = HTWaiGong;
                _attack = 1609;
                _bloodCoefficient = 1.6;
                _xinFaString = @"山居剑意";
            }
            else
            {
                _xinfa = HTWenShuiAndShanju;
                _pofangMainPCoefficient = 0.08;
                _mingzhong = 96.0;
                _huixiaoMainPCoefficient = 0;
                _huixin = 23;
                _huixinMainPCoefficient = 0;
                _attackMainPCoefficient = 2.4;
                _xinfaType = HTWaiGong;
                _attack = 1609;
                _bloodCoefficient = 1.6;
                _xinFaString = @"问水诀";
            }
        }
            break;
        case HTHS:
        {
            if (isDefault)
            {
                _xinfa = HTYiJin;
                _pofangMainPCoefficient = 0;
                _mingzhong = 119.0;
                _huixiaoMainPCoefficient = 0.05;
                _huixin = 0;
                _huixinMainPCoefficient = 0.15;
                _attackMainPCoefficient = 2.7;
                _xinfaType = HTNeiGong;
                _attack = 1711;
                _bloodCoefficient = 1.8;
                _xinFaString = @"易筋经";
            }
            else
            {
                _xinfa = HTXiSui;
                _pofangMainPCoefficient = 0;
                _mingzhong = 0;
                _huixiaoMainPCoefficient = 0;
                _huixin = 0;
                _huixinMainPCoefficient = 0;
                _attackMainPCoefficient = 0;
                _attack = 0;
                _xinfaType = HTFangyu;
                _bloodCoefficient = 1.96;
                _xinFaString = @"洗髓经";
            }
        }
            break;
        case HTWD:
        {
            if (isDefault)
            {
                _xinfa = HTDujing;
                _pofangMainPCoefficient = 0.08;
                _mingzhong = 115.0;
                _huixiaoMainPCoefficient = 0;
                _huixin = 0;
                _huixinMainPCoefficient = 0;
                _attackMainPCoefficient = 2.85;
                _xinfaType = HTNeiGong;
                _attack = 1723;
                _bloodCoefficient = 1.56;
                _xinFaString = @"毒经";
            }
            else
            {
                _xinfa = HTBuTian;
                _pofangMainPCoefficient = 0;
                _mingzhong = 0;
                _huixiaoMainPCoefficient = 0;
                _huixin = 0;
                _huixinMainPCoefficient = 0;
                _attackMainPCoefficient = 0;
                _attack = 0;
                _xinfaType = HTZhiliao;
                _bloodCoefficient = 1.56;
                _xinFaString = @"补天诀";
            }
        }
            break;
        case HTTM:
        {
            if (isDefault)
            {
                _xinfa = HTTianLuo;
                _pofangMainPCoefficient = 0;
                _mingzhong = 116.0;
                _huixiaoMainPCoefficient = 0.08;
                _huixin = 0;
                _huixinMainPCoefficient = 0.2;
                _attackMainPCoefficient = 2.6;
                _xinfaType = HTNeiGong;
                _attack = 1730;
                _bloodCoefficient = 1.56;
                _xinFaString = @"天罗诡道";
            }
            else
            {
                _xinfa = HTJingYu;
                _pofangMainPCoefficient = 0;
                _mingzhong = 96.0;
                _huixiaoMainPCoefficient = 0.05;
                _huixin = 0;
                _huixinMainPCoefficient = 0.15;
                _attackMainPCoefficient = 2.25;
                _xinfaType = HTWaiGong;
                _attack = 1550;
                _bloodCoefficient = 1.56;
                _xinFaString = @"惊羽诀";
            }
        }
            break;
        case HTMJ:
        {
            if (isDefault)
            {
                _xinfa = HTFenYing;
                _pofangMainPCoefficient = 0;
                _mingzhong = 117.0;
                _huixiaoMainPCoefficient = 0.02;
                _huixin = 0;
                _huixinMainPCoefficient = 0.08;
                _attackMainPCoefficient = 2.85;
                _xinfaType = HTNeiGong;
                _attack = 1727;
                _bloodCoefficient = 1.6;
                _xinFaString = @"焚影圣决";
            }
            else
            {
                _xinfa = HTMingZun;
                _pofangMainPCoefficient = 0;
                _mingzhong = 0;
                _huixiaoMainPCoefficient = 0;
                _huixin = 0;
                _huixinMainPCoefficient = 0;
                _attackMainPCoefficient = 0;
                _attack = 0;
                _xinfaType = HTFangyu;
                _bloodCoefficient = 1.96;
                _xinFaString = @"明尊琉璃体";
            }
        }
            break;
        case HTGB:
        {
            _xinfa = HTXiaoChen;
            _pofangMainPCoefficient = 0.15;
            _mingzhong = 50.0;
            _huixiaoMainPCoefficient = 0;
            _huixin = 0;
            _huixinMainPCoefficient = 0;
            _attackMainPCoefficient = 2.3;
            _xinfaType = HTWaiGong;
            _attack = 1738;
            _bloodCoefficient = 1.6;
            _xinFaString = @"笑尘诀";
        }
            break;
        default:
            _xinfa = 0;
            _xinFaString = @"未选择心法";
            _bloodCoefficient = 1.0;
            _xinfaType = HTWaiGong;
            _attackMainPCoefficient = 0;
            _huixin = 0;
            break;
    }
}

- (NSInteger)mainProperty
{
    BOOL isDefault = self.isDefaultXinFa;
    
    if (self.menpai == HTXX
        || self.menpai == HTWD
        || (self.menpai == HTCY && !isDefault)
        || (self.menpai == HTHH && !isDefault))
    {
        _mainProperty = self.gengu;
    }
    else if ((self.menpai == HTCY && isDefault)
             || self.menpai == HTCJ)
    {
        _mainProperty = self.shenfa;
    }
    else if ((self.menpai == HTTC && isDefault)
             || (self.menpai == HTTM && !isDefault)
             || (self.menpai == HTGB))
    {
        _mainProperty = self.lidao;
    }
    else if ((self.menpai == HTHH && isDefault)
             || (self.menpai == HTHS && isDefault)
             || (self.menpai == HTTM && isDefault)
             || (self.menpai == HTMJ && isDefault))
    {
        _mainProperty = self.yuanqi;
    }
    else
    {
        _mainProperty = self.tizhi;
    }
    return _mainProperty;
}

- (NSString *)mainPropertyString
{
    BOOL isDefault = self.isDefaultXinFa;
   
    if (self.menpai == HTXX
        || self.menpai == HTWD
        || (self.menpai == HTCY && !isDefault)
        || (self.menpai == HTHH && !isDefault))
    {
        _mainPropertyString = @"根\x20\x20\x20\x20\x20\x20\x20\x20骨";
    }
    else if ((self.menpai == HTCY && isDefault)
             || self.menpai == HTCJ)
    {
        _mainPropertyString = @"身\x20\x20\x20\x20\x20\x20\x20\x20法";
    }
    else if ((self.menpai == HTTC && isDefault)
             || (self.menpai == HTTM && !isDefault)
             || (self.menpai == HTGB))
    {
        _mainPropertyString = @"力\x20\x20\x20\x20\x20\x20\x20\x20道";
    }
    else if ((self.menpai == HTHH && isDefault)
             || (self.menpai == HTHS && isDefault)
             || (self.menpai == HTTM && isDefault)
             || (self.menpai == HTMJ && isDefault))
    {
        _mainPropertyString = @"元\x20\x20\x20\x20\x20\x20\x20\x20气";
    }
    else
    {
        _mainPropertyString = @"体\x20\x20\x20\x20\x20\x20\x20\x20质";
    }
    return _mainPropertyString;
}

- (NSInteger)suitScores
{
    return _hushou.score+_maozi.score+_shangyi.score+_xiazhuang.score+_yaodai.score+_xiezi.score
            +_jiezhi1.score+_jiezhi2.score+_xianglian.score+_yaozhui.score
            +_wuqi.score+_anqi.score;
}

- (NSInteger)tizhi
{
    return self.basetizhi +
    _hushou.tizhi+_maozi.tizhi+_shangyi.tizhi+_xiazhuang.tizhi+_yaodai.tizhi+_xiezi.tizhi
    +_jiezhi1.tizhi+_jiezhi2.tizhi+_xianglian.tizhi+_yaozhui.tizhi
    +_wuqi.tizhi+_anqi.tizhi;
}

- (NSInteger)gengu
{
    return self.basegengu +
    _hushou.gengu+_maozi.gengu+_shangyi.gengu+_xiazhuang.gengu+_yaodai.gengu+_xiezi.gengu
    +_jiezhi1.gengu+_jiezhi2.gengu+_xianglian.gengu+_yaozhui.gengu
    +_wuqi.gengu+_anqi.gengu;
}

- (NSInteger)lidao
{
    return self.baselidao +
    _hushou.lidao+_maozi.lidao+_shangyi.lidao+_xiazhuang.lidao+_yaodai.lidao+_xiezi.lidao
    +_jiezhi1.lidao+_jiezhi2.lidao+_xianglian.lidao+_yaozhui.lidao
    +_wuqi.lidao+_anqi.lidao;
}

- (NSInteger)shenfa
{
    return self.baseshenfa +
    _hushou.shenfa+_maozi.shenfa+_shangyi.shenfa+_xiazhuang.shenfa+_yaodai.shenfa+_xiezi.shenfa
    +_jiezhi1.shenfa+_jiezhi2.shenfa+_xianglian.shenfa+_yaozhui.shenfa
    +_wuqi.shenfa+_anqi.shenfa;
}

- (NSInteger)yuanqi
{
    return self.baseyuanqi +
    _hushou.yuanqi+_maozi.yuanqi+_shangyi.yuanqi+_xiazhuang.yuanqi+_yaodai.yuanqi+_xiezi.yuanqi
    +_jiezhi1.yuanqi+_jiezhi2.yuanqi+_xianglian.yuanqi+_yaozhui.yuanqi
    +_wuqi.yuanqi+_anqi.yuanqi;
}

- (NSInteger)bloodValue
{
    return (self.tizhi*10.0+2860.0)*self.bloodCoefficient
        + 0 ;//镶嵌的气血未填
}

- (NSInteger)baseAttackValue
{
    int property = 0;
    
    if (self.xinfaType == HTWaiGong || self.menpai == HTTC)//外功心法或者铁牢
    {
        property = self.lidao * 0.25;
    }
    else
    {
        property = self.yuanqi * 0.3;
    }
    return self.attack + property +
    _hushou.gongji+_maozi.gongji+_shangyi.gongji+_xiazhuang.gongji+_yaodai.gongji+_xiezi.gongji
    +_jiezhi1.gongji+_jiezhi2.gongji+_xianglian.gongji+_yaozhui.gongji
    +_wuqi.gongji+_anqi.gongji;
}

- (NSInteger)attackValue
{
    return self.baseAttackValue + (int)(self.mainProperty * self.attackMainPCoefficient);
}

- (double)huixinValue
{
    int huixinDj = 0;
    int property = 0;
    
    if (self.xinfaType == HTWaiGong || self.menpai == HTTM || self.menpai == HTTC)//外功心法或者天罗或者铁牢
    {
        property = 0.3 * self.shenfa;
    }
    else
    {
        property = 0.3 * self.gengu;
    }
    huixinDj = self.huixin + property +
    _hushou.huixin+_maozi.huixin+_shangyi.huixin+_xiazhuang.huixin+_yaodai.huixin+_xiezi.huixin
    +_jiezhi1.huixin+_jiezhi2.huixin+_xianglian.huixin+_yaozhui.huixin
    +_wuqi.huixin+_anqi.huixin
    + (self.mainProperty * self.huixinMainPCoefficient)
    ;
    
    return huixinDj/45.0;
}

- (double)huixiaoValue
{
    int huixiaoDj = 0;
    int property = 0;
    
    if (self.xinfaType == HTWaiGong || self.menpai == HTTM || self.menpai == HTTC)//外功心法或者天罗或者铁牢
    {
        property = 0.15 * self.shenfa;
    }
    else
    {
        property = 0.15 * self.gengu;
    }
    
    huixiaoDj = property +
    _hushou.huixiao+_maozi.huixiao+_shangyi.huixiao+_xiazhuang.huixiao+_yaodai.huixiao+_xiezi.huixiao
    +_jiezhi1.huixiao+_jiezhi2.huixiao+_xianglian.huixiao+_yaozhui.huixiao
    +_wuqi.huixiao+_anqi.huixiao
    +(self.mainProperty * self.huixiaoMainPCoefficient)
    ;
    
    return huixiaoDj/18.0+1.75*100.0;
}

- (double)mingzhongValue
{
    int mingzhongDj = 0;
    
    mingzhongDj = self.mingzhong +
    _hushou.mingzhong+_maozi.mingzhong+_shangyi.mingzhong+_xiazhuang.mingzhong+_yaodai.mingzhong+_xiezi.mingzhong
    +_jiezhi1.mingzhong+_jiezhi2.mingzhong+_xianglian.mingzhong+_yaozhui.mingzhong
    +_wuqi.mingzhong+_anqi.mingzhong
    ;
    return mingzhongDj/45.0 + 90;
}

- (double)wushuangValue
{
    return (_hushou.wushuang+_maozi.wushuang+_shangyi.wushuang+_xiazhuang.wushuang+_yaodai.wushuang+_xiezi.wushuang
    +_jiezhi1.wushuang+_jiezhi2.wushuang+_xianglian.wushuang+_yaozhui.wushuang
            +_wuqi.wushuang+_anqi.wushuang)/33.75;
    
}

- (NSInteger)pofangValue
{
    int property = 0;
    
    if (self.xinfaType == HTWaiGong || self.menpai == HTTC)//外功心法或者铁牢
    {
        property = self.lidao * 0.25;
    }
    else
    {
        property = self.yuanqi * 0.25;
    }
    return property +
    _hushou.pofang+_maozi.pofang+_shangyi.pofang+_xiazhuang.pofang+_yaodai.pofang+_xiezi.pofang
    +_jiezhi1.pofang+_jiezhi2.pofang+_xianglian.pofang+_yaozhui.pofang
    +_wuqi.pofang+_anqi.pofang
    + (self.mainProperty * self.pofangMainPCoefficient);
}

- (double)jiasuValue
{
    return (_hushou.jiasu+_maozi.jiasu+_shangyi.jiasu+_xiazhuang.jiasu+_yaodai.jiasu+_xiezi.jiasu
            +_jiezhi1.jiasu+_jiezhi2.jiasu+_xianglian.jiasu+_yaozhui.jiasu
            +_wuqi.jiasu+_anqi.jiasu)/54.782;
    
}

- (void)clear
{
    self.maozi = nil;
    self.xiezi = nil;
    self.wuqi = nil;
    self.wuqi2 = nil;
    self.jiezhi1 = nil;
    self.jiezhi2 = nil;
    self.xianglian = nil;
    self.yaozhui = nil;
    self.yaodai = nil;
    self.shangyi = nil;
    self.xiazhuang = nil;
    self.hushou = nil;
    self.anqi = nil;
}

- (HTEquip *)equipWithBuwei:(HTBuWei)buwei
{
    switch (buwei)
    {
        case HTxianglian:
            return self.xianglian;
            break;
        case HTanqi:
            return self.anqi;
            break;
        case HThushou:
            return self.hushou;
            break;
        case HTjiezhi:
            return self.jiezhi1;
            break;
        case HTjiezhi2:
            return self.jiezhi2;
            break;
        case HTmaozi:
            return self.maozi;
            break;
        case HTshangyi:
            return self.shangyi;
            break;
        case HTwuqi:
            return self.wuqi;
            break;
        case HTxiazhuang:
            return self.xiazhuang;
            break;
        case HTxiezi:
            return self.xiezi;
            break;
        case HTyaodai:
            return self.yaodai;
            break;
        case HTyaozhui:
            return self.yaozhui;
            break;
        default:
            return nil;
            break;
    }
    return nil;
}

@end
