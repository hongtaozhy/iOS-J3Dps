//
//  UIImage+Draw.m
//  Weibo
//
//  Created by Wade Cheng on 12/13/11.
//  Copyright (c) 2011 Sina. All rights reserved.
//

#import "UIImage+Draw.h"

@implementation UIImage (Draw)

- (UIImage *)drawText:(NSString *)text
{
    UIImage *watermarkedImage = nil;
    UIGraphicsBeginImageContext(self.size);
    [self drawAtPoint: CGPointZero];
    [text drawAtPoint: CGPointMake(10, 10) withFont: [UIFont systemFontOfSize: 12]];
    watermarkedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return watermarkedImage;
}
@end
