//
//  NSString+descption.h
//  J3Dps
//
//  Created by hadn't on 14-5-19.
//  Copyright (c) 2014年 hongtao5. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (descption)

+ (NSString *)descriptionWithInt:(NSInteger)value baseString:(NSString *)string;

+ (NSString *)descriptionWithDouble:(double)value baseString:(NSString *)string;

@end
