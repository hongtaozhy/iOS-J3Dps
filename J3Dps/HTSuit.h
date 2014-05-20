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

@property (nonatomic,assign) NSInteger suitScores;
@property (nonatomic,assign) NSInteger mainProperty;
@property (nonatomic,assign) NSInteger attackValue;
@property (nonatomic,assign) NSInteger baseAttackValue;
@property (nonatomic,assign) double    mingzhongValue;
@property (nonatomic,assign) double    huixinValue;
@property (nonatomic,assign) double    huixiaoValue;
@property (nonatomic,assign) double    jiasuValue;
@property (nonatomic,assign) double    wushuangValue;
@property (nonatomic,assign) NSInteger pofangValue;
@property (nonatomic,assign) NSInteger bloodValue;

@property (nonatomic,assign) NSInteger tizhi;
@property (nonatomic,assign) NSInteger gengu;
@property (nonatomic,assign) NSInteger lidao;
@property (nonatomic,assign) NSInteger shenfa;
@property (nonatomic,assign) NSInteger yuanqi;

@property (nonatomic,assign) NSInteger basetizhi;
@property (nonatomic,assign) NSInteger basegengu;
@property (nonatomic,assign) NSInteger baselidao;
@property (nonatomic,assign) NSInteger baseshenfa;
@property (nonatomic,assign) NSInteger baseyuanqi;

@property (nonatomic,retain) HTEquip *hushou;
@property (nonatomic,retain) HTEquip *shangyi;
@property (nonatomic,retain) HTEquip *yaodai;
@property (nonatomic,retain) HTEquip *maozi;
@property (nonatomic,retain) HTEquip *xiazhuang;
@property (nonatomic,retain) HTEquip *xiezi;
@property (nonatomic,retain) HTEquip *wuqi;
@property (nonatomic,retain) HTEquip *wuqi2;
@property (nonatomic,retain) HTEquip *jiezhi1;
@property (nonatomic,retain) HTEquip *jiezhi2;
@property (nonatomic,retain) HTEquip *yaozhui;
@property (nonatomic,retain) HTEquip *xianglian;
@property (nonatomic,retain) HTEquip *anqi;


@property (nonatomic,retain) NSString *suitName;

@property (nonatomic,retain,readonly) NSString *bodyString;
@property (nonatomic,retain,readonly) NSString *xinFaString;
@property (nonatomic,retain,readonly) NSString *mainPropertyString;

- (void)setBodyStringWithHTBody:(HTBody)body;
- (void)setxinFaStringWithHTMenpai:(HTMenpai)menpai isDefaultXinfa:(BOOL)isDefault;

@end
