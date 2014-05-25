//
//  UIDevice+Extension.h
//  DrawerNavDemo
//
//  Created by Zhao yang on 10/31/13.
//  Copyright (c) 2013 maize. All rights reserved.
//

#import <UIKit/UIKit.h>

#define isRetina ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)

#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)

#define isPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

@interface UIDevice (Extension)

+ (BOOL)systemVersionIsMoreThanOrEuqal7;

@end
