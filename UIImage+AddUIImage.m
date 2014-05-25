//
//  UIImage+AddUIImage.m
//  J3Dps
//
//  Created by hadn't on 14-5-15.
//  Copyright (c) 2014年 hongtao5. All rights reserved.
//

#import "UIImage+AddUIImage.h"

@implementation UIImage (AddUIImage)

- (UIImage *)addImageView:(UIImage *)image_2
{
    UIImage *image_1 = self;
    CGSize size= CGSizeMake( image_1.size.width+image_2.size.width,image_1.size.height);
    
    UIGraphicsBeginImageContext(size);
    
    // Draw image1
    
    [image_2 drawInRect:CGRectMake(0, 0, image_2.size.width, image_2.size.height)];
    
    // Draw image2
    
    [image_1 drawInRect:CGRectMake(image_2.size.width, 0, image_1.size.width, image_1.size.height)];
    
    UIImage *resultingImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return resultingImage;
}

+ (UIImage *)imageWithUIView:(UIView*)view
{
    // 创建一个bitmap的context
    // 并把它设置成为当前正在使用的context
    UIGraphicsBeginImageContext(view.bounds.size);
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    //[view.layer drawInContext:ctx];
    [view.layer renderInContext:ctx];
    
    // 从当前context中创建一个改变大小后的图片
    UIImage* tImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    
    //    [self removeRightMaskView];
    //    UIImage *imgCenter = [self imageWithUIView:self.centerView];
    //    UIImage *imgRight = [self imageWithUIView:self.rightView];
    //    UIImageWriteToSavedPhotosAlbum([imgRight addImageView:imgCenter], nil, nil, nil);

    return tImage;
}
@end
