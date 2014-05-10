//
//  UIDevice+Extension.m
//  DrawerNavDemo
//
//  Created by Zhao yang on 10/31/13.
//  Copyright (c) 2013 maize. All rights reserved.
//

#import "UIDevice+Extension.h"

@implementation UIDevice (Extension)

+ (BOOL)systemVersionIsMoreThanOrEuqal7 {
    return [UIDevice currentDevice].systemVersion.floatValue >= 7.0;
}

@end
