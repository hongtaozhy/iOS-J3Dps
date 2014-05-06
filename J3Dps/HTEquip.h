//
//  HTEquip.h
//  J3Dps
//
//  Created by hadn't on 14-5-6.
//  Copyright (c) 2014年 hongtao5. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HTXiangqian.h"

typedef NS_ENUM(NSInteger, HTMenpai)
{
    HTCommon    = 0, //通用类
    HTJingjian  = 1, //精简类
    HTHH        = 2, //万花
    HTHS        = 3, //少林
    HTTM        = 4, //唐门
    HTMJ        = 5, //明教
    HTXX        = 6, //七秀
    HTWD        = 7, //毒经
    HTCY        = 8, //纯阳
    HTTC        = 9, //天策
    HTGB        = 10,//丐帮
    HTCJ        = 11 //藏剑
};

typedef NS_ENUM(NSInteger, HTType)
{
    HTNjj       = 0,//内功精简（当字段「门派」不为1时用于区分内外功心法）
    HTWjj       = 1,//外功精简（当字段「门派」不为1时用于区分内外功心法）
    HTYQ        = 2,//元气通用Spunk
    HTGG        = 3,//根骨通用
    HTLD        = 4,//力道
    HTSF        = 5,//身法
    HTTherapy   = 6,//治疗
    HTVitality  = 7 //防御
};

typedef NS_ENUM(NSInteger, HTBuWei)
{
    HTxianglian     = 0,
    HTyaozhui       = 1,
    HTjiezhi        = 2,
    HTanqi          = 4,
    HTxiezi         = 5,
    HThushou        = 6,
    HTxiazhuang     = 7,
    HTshangyi       = 8,
    HTmaozi         = 9,
    HTyaodai        = 10,
    HTwuqi          = 11,
};

typedef NS_ENUM(NSInteger, HTTuiJianMenpai)
{
    HTNoTuijian    = 0,      //无推荐门派
    HTJc           = 1 << 0, //剑纯
    HTHHdps        = 1 << 1, //万花
    HTHSdps        = 1 << 2, //少林
    HTTMdps1       = 1 << 3, //天罗
    HTTMdps2       = 1 << 4, //鲸鱼
    HTMJdps        = 1 << 5, //明教
    HTXXdps        = 1 << 6, //七秀
    HTWDdps        = 1 << 7, //毒经
    HTQC           = 1 << 8, //气纯
    HTTCdps        = 1 << 9, //天策
    HTGBdps        = 1 << 10,//丐帮
    HTCJdps        = 1 << 11 //藏剑
};

@interface HTEquip : NSObject

@property (nonatomic,retain) NSString* name;
@property (nonatomic,assign) HTMenpai menpai;
@property (nonatomic,assign) HTType type;
@property (nonatomic,assign) HTBuWei buWei;

@property (nonatomic,assign) NSInteger quality;
@property (nonatomic,assign) NSInteger score;

@property (nonatomic,assign) NSInteger tizhi;
@property (nonatomic,assign) NSInteger gengu;
@property (nonatomic,assign) NSInteger lidao;
@property (nonatomic,assign) NSInteger shenfa;
@property (nonatomic,assign) NSInteger yuanqi;


@property (nonatomic,assign) NSInteger gongji;
@property (nonatomic,assign) NSInteger zhiliaoliang;

@property (nonatomic,assign) NSInteger huixin;
@property (nonatomic,assign) NSInteger huixiao;
@property (nonatomic,assign) NSInteger mingzhong;
@property (nonatomic,assign) NSInteger pofang;
@property (nonatomic,assign) NSInteger wushuang;
@property (nonatomic,assign) NSInteger jiasu;

@property (nonatomic,assign) NSInteger yujin;
@property (nonatomic,assign) NSInteger huajin;

@property (nonatomic,retain) HTXiangqian *xiangqian;
@property (nonatomic,assign) NSInteger tuijian;// A|B

@property (nonatomic,assign) NSInteger jinglianLevel;
@property (nonatomic,retain) NSString *diaoluo;

@property (nonatomic,assign) NSInteger texiao;
@end
