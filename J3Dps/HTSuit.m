//
//  HTSuit.m
//  J3Dps
//
//  Created by hadn't on 14-5-13.
//  Copyright (c) 2014年 hongtao5. All rights reserved.
//

#import "HTSuit.h"

@implementation HTSuit
@synthesize bodyString = _bodyString;
@synthesize body = _body;
@synthesize xinFaString = _xinFaString;
@synthesize mainPropertyString = _mainPropertyString;

- (instancetype)init
{
    self = [super init];
    if (self) {
        _bodyString = @"未选择体型";
        _body = -1;
        _xinFaString = @"未选择心法";
        self.suitName = @"未命名配装";
        self.suitScores = 0;
        
        self.mingzhongValue = 0;
        self.huixiaoValue = 0;
        self.bloodValue = 0;
    }
    return self;
}

- (void)setMenpai:(HTMenpai)menpai
{
    _menpai = menpai;
    [self setxinFaStringWithHTMenpai:menpai isDefaultXinfa:self.isDefaultXinFa];
}

- (void)setBody:(HTBody)body
{
    _body = body;
    [self setBodyStringWithHTBody:body];
}

- (void)setBodyStringWithHTBody:(HTBody)body;
{
    switch (body) {
        case HTBodyLoli:
        {
            _bodyString = @"萝莉";
            self.tizhi = 95;
            self.gengu = 98;
            self.lidao = 96;
            self.shenfa = 99;
            self.yuanqi = 97;
        }
            break;
        case HTBodyWoman:
        {
            _bodyString = @"御姐";
            self.tizhi = 96;
            self.gengu = 98;
            self.lidao = 97;
            self.shenfa = 98;
            self.yuanqi = 96;
        }
            break;
        case HTBodyMan:
        {
            _bodyString = @"成男";
            self.tizhi = 99;
            self.gengu = 96;
            self.lidao = 98;
            self.shenfa = 97;
            self.yuanqi = 95;
        }
            break;
        case HTBodyBoy:
        {
            _bodyString = @"正太";
            self.tizhi = 96;
            self.gengu = 98;
            self.lidao = 96;
            self.shenfa = 98;
            self.yuanqi = 95;
        }
            break;
        default:
            break;
    }
}

- (void)setxinFaStringWithHTMenpai:(HTMenpai)menpai isDefaultXinfa:(BOOL)isDefault
{
    switch (menpai) {
        case HTXX:
        {
            if (isDefault)
            {
                _xinFaString = @"冰心诀";
            }
            else
            {
                _xinFaString = @"云裳心经";
            }
        }
            break;
        case HTCY:
        {
            if (isDefault)
            {
                _xinFaString = @"太虚剑意";
            }
            else
            {
                _xinFaString = @"紫霞功";
            }
        }
            break;
        case HTTC:
        {
            if (isDefault)
            {
                _xinFaString = @"傲血战意";
            }
            else
            {
                _xinFaString = @"铁牢律";
            }
        }
            break;
        case HTHH:
        {
            if (isDefault)
            {
                _xinFaString = @"花间游";
            }
            else
            {
                _xinFaString = @"离经易道";
            }
        }
            break;
        case HTCJ:
        {
            if (isDefault)
            {
                _xinFaString = @"山居剑意";
            }
            else
            {
                _xinFaString = @"问水诀";
            }
        }
            break;
        case HTHS:
        {
            if (isDefault)
            {
                _xinFaString = @"易筋经";
            }
            else
            {
                _xinFaString = @"洗髓经";
            }
        }
            break;
        case HTWD:
        {
            if (isDefault)
            {
                _xinFaString = @"毒经";
            }
            else
            {
                _xinFaString = @"补天诀";
            }
        }
            break;
        case HTTM:
        {
            if (isDefault)
            {
                _xinFaString = @"天罗诡道";
            }
            else
            {
                _xinFaString = @"惊羽诀";
            }
        }
            break;
        case HTMJ:
        {
            if (isDefault)
            {
                _xinFaString = @"焚影圣决";
            }
            else
            {
                _xinFaString = @"明尊琉璃体";
            }
        }
            break;
        case HTGB:
        {
            _xinFaString = @"笑尘诀";
        }
            break;
        default:
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

@end
