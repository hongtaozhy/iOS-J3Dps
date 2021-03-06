//
//  UIColor+Helper.h
//  Lianbo
//
//  Created by Kai on 2/28/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#ifndef RGBCOLOR
#define RGBCOLOR(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
#endif

#ifndef RGBACOLOR
#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#endif

#ifndef RGBA
#define RGBA(r,g,b,a) r/255.0, g/255.0, b/255.0, a
#endif

#define FLOATRGBCOLOR(r,g,b) [UIColor colorWithRed:r green:g blue:b alpha:1]
#define FLOATRGBCGCOLOR(r,g,b) [UIColor colorWithRed:r green:g blue:b alpha:1].CGColor

#define FLOATRGBACOLOR(r,g,b,a) [UIColor colorWithRed:r green:g blue:b alpha:a]
#define FLOATRGBACGCOLOR(r,g,b,a) [UIColor colorWithRed:r green:g blue:b alpha:a].CGColor


UIColor *UIColorMakeRGB(CGFloat red, CGFloat green, CGFloat blue);
UIColor *UIColorMakeRGBA(CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha);

@interface UIColor (Helper)
+ (UIColor *)colorWithHexValue:(NSInteger)hex alpha:(CGFloat)alpha;

+ (CGFloat)redColorFromHexRGBColor:(NSInteger)hex;
+ (CGFloat)greenColorFromRGBColor:(NSInteger)hex;
+ (CGFloat)blueColorFromRGBColor:(NSInteger)hex;

- (void)getColorComponentsWithRed:(CGFloat *)red green:(CGFloat *)green blue:(CGFloat *)blue alpha:(CGFloat *)alpha;


@end
