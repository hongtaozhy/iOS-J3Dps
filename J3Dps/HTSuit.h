//
//  HTSuit.h
//  J3Dps
//
//  Created by hadn't on 14-5-13.
//  Copyright (c) 2014年 hongtao5. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HTSuit : NSObject<NSCoding,NSCopying>

//原始属性需要存
@property (nonatomic,assign) HTBody body;
@property (nonatomic,assign) HTMenpai menpai;
@property (nonatomic,assign) BOOL isDefaultXinFa;
@property (nonatomic,retain) NSString *suitName;

@property (nonatomic,copy) HTEquip *hushou;
@property (nonatomic,copy) HTEquip *shangyi;
@property (nonatomic,copy) HTEquip *yaodai;
@property (nonatomic,copy) HTEquip *maozi;
@property (nonatomic,copy) HTEquip *xiazhuang;
@property (nonatomic,copy) HTEquip *xiezi;
@property (nonatomic,copy) HTEquip *wuqi;
@property (nonatomic,copy) HTEquip *wuqi2;
@property (nonatomic,copy) HTEquip *jiezhi1;
@property (nonatomic,copy) HTEquip *jiezhi2;
@property (nonatomic,copy) HTEquip *yaozhui;
@property (nonatomic,copy) HTEquip *xianglian;
@property (nonatomic,copy) HTEquip *anqi;


//私有计算用属性是定值 不需要存 走如下两方法
// setBaseValueWithMenpai:isDefaultXinfa:
// setBasePropertyWithBody:
@property (nonatomic,assign) NSInteger basetizhi;
@property (nonatomic,assign) NSInteger basegengu;
@property (nonatomic,assign) NSInteger baselidao;
@property (nonatomic,assign) NSInteger baseshenfa;
@property (nonatomic,assign) NSInteger baseyuanqi;

@property (nonatomic,retain,readonly) NSString *bodyString;
@property (nonatomic,retain,readonly) NSString *xinFaString;


//计算出来的属性不存
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

@property (nonatomic,retain,readonly) NSString *mainPropertyString;

- (void)setBasePropertyWithBody:(HTBody)body;
- (void)setBaseValueWithMenpai:(HTMenpai)menpai isDefaultXinfa:(BOOL)isDefault;

- (void)clear;

- (HTEquip *)equipWithBuwei:(HTBuWei)buwei;

@end
