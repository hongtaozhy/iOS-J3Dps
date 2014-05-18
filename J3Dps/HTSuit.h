//
//  HTSuit.h
//  J3Dps
//
//  Created by hadn't on 14-5-13.
//  Copyright (c) 2014年 hongtao5. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HTSuit : NSObject

@property (nonatomic,assign) HTBody body;
@property (nonatomic,assign) HTMenpai menpai;
@property (nonatomic,assign) BOOL isDefaultXinFa;

@property (nonatomic,retain) NSString *suitName;

@property (nonatomic,retain,readonly) NSString *bodyString;
@property (nonatomic,retain,readonly) NSString *xinFaString;

- (void)setBodyStringWithHTBody:(HTBody)body;
- (void)setxinFaStringWithHTMenpai:(HTMenpai)menpai isDefaultXinfa:(BOOL)isDefault;

@end
