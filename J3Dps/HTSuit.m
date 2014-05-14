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

- (instancetype)init
{
    self = [super init];
    if (self) {
        _bodyString = @"未选择体型";
        _body = -1;
        _xinFaString = @"未选择心法";
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
        }
            break;
        case HTBodyWoman:
        {
            _bodyString = @"御姐";
        }
            break;
        case HTBodyMan:
        {
            _bodyString = @"成男";
        }
            break;
        case HTBodyBoy:
        {
            _bodyString = @"正太";
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

@end
