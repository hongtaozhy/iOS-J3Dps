//
//  NSString+descption.m
//  J3Dps
//
//  Created by hadn't on 14-5-19.
//  Copyright (c) 2014年 hongtao5. All rights reserved.
//

#import "NSString+descption.h"

@implementation NSString (descption)

+ (NSString *)descriptionWithInt:(NSInteger)value baseString:(NSString *)string
{
    return [NSString stringWithFormat:@"%@：%d",string,(int)value];
}

+ (NSString *)descriptionWithDouble:(double)value baseString:(NSString *)string
{
    return [NSString stringWithFormat:@"%@：%.2lf",string,value];
}

@end
