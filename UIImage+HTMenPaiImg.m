//
//  UIImage+HTMenPaiImg.m
//  J3Dps
//
//  Created by hadn't on 14-5-17.
//  Copyright (c) 2014年 hongtao5. All rights reserved.
//

#import "UIImage+HTMenPaiImg.h"

@implementation UIImage (HTMenPaiImg)

+ (UIImage *)imageWithMenPai:(HTMenpai)menpai
{
    switch (menpai)
    {
        case HTXX:
            return [self imageNamed:@"sqixiu"];
        case HTCJ:
            return [self imageNamed:@"scangjian"];
        case HTCY:
            return [self imageNamed:@"schunyang"];
        case HTWD:
            return [self imageNamed:@"swudu"];
        case HTHH:
            return [self imageNamed:@"swanhua"];
        case HTGB:
            return [self imageNamed:@"sgaibang"];
        case HTHS:
            return [self imageNamed:@"sshaolin"];
        case HTTC:
            return [self imageNamed:@"stiance"];
        case HTTM:
            return [self imageNamed:@"stangmeng"];
        case HTMJ:
            return [self imageNamed:@"smingjiao"];
        default:
            return nil;
            break;
    }
    return nil;
}

@end
