//
//  HTEquip.h
//  J3Dps
//
//  Created by hadn't on 14-5-6.
//  Copyright (c) 2014年 hongtao5. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HTXiangqian.h"

#define HT_NO_TAG -10010

typedef NS_ENUM(NSInteger, HTXinfaType)
{
    HTNeiGong   = 0,
    HTWaiGong   = 1,
    HTZhiliao   = 2,
    HTFangyu    = 3
};

typedef NS_ENUM(NSInteger, HTEquipProType)
{
    HTALL       = 0,//全部
    HTHuiXin    = 1,//会心
    HTPoFang    = 2,//破防
    HTJiaSu     = 3,//加速
    HTMingZhong = 4,//命中
    HTWuShuang  = 5,//无双
};

typedef NS_ENUM(NSInteger, HTBody)
{
    HTNoSelect  = -1,
    HTBodyLoli  = 0,
    HTBodyWoman = 1,
    HTBodyMan   = 2,
    HTBodyBoy   = 3
};

typedef NS_ENUM(NSInteger, HTMenpai)
{
    //从2开始是照顾原数据库结构
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

//0	   1	2	3	4	5	6	7	8	9	10	11	12	13	14	15	16	17
//花间 易筋	天罗	焚影	冰心	紫霞	毒经	惊羽	笑尘	傲血	藏剑	太虚	离经	云裳	补天	铁牢	洗髓	明尊
//数字其实是反的。。。。0 就是没选择
typedef NS_ENUM(NSInteger, HTXinFa)
{
    HTMingZun           =   1 << 0,
    HTXiSui             =   1 << 1,
    HTTieLao            =   1 << 2,
    HTBuTian            =   1 << 3,
    HTYunShang          =   1 << 4,
    HTLiJing            =   1 << 5,
    HTTaiXu             =   1 << 6,
    HTWenShuiAndShanju  =   1 << 7,
    HTAoXue             =   1 << 8,
    HTXiaoChen          =   1 << 9,
    HTJingYu            =   1 << 10,
    HTDujing            =   1 << 11,
    HTZiXia             =   1 << 12,
    HTBingXin           =   1 << 13,
    HTFenYing           =   1 << 14,
    HTTianLuo           =   1 << 15,
    HTYiJin             =   1 << 16,
    HTHuaJian           =   1 << 17
};


typedef NS_ENUM(NSInteger, HTBuWei)
{
    HTxianglian     = 0,
    HTyaozhui       = 1,
    HTjiezhi        = 2,
    HTjiezhi2       = 3,
    HTanqi          = 4,
    HTxiezi         = 5,
    HThushou        = 6,
    HTxiazhuang     = 7,
    HTshangyi       = 8,
    HTmaozi         = 9,
    HTyaodai        = 10,
    HTwuqi          = 11,
    HTZhongJian     = 12
};

//typedef NS_ENUM(NSInteger, HTTuiJianMenpai)
//{
//    HTNoTuijian    = 0,      //无推荐门派
//    HTJc           = 1 << 0, //剑纯
//    HTHHdps        = 1 << 1, //万花
//    HTHSdps        = 1 << 2, //少林
//    HTTMdps1       = 1 << 3, //天罗
//    HTTMdps2       = 1 << 4, //鲸鱼
//    HTMJdps        = 1 << 5, //明教
//    HTXXdps        = 1 << 6, //七秀
//    HTWDdps        = 1 << 7, //毒经
//    HTQC           = 1 << 8, //气纯
//    HTTCdps        = 1 << 9, //天策
//    HTGBdps        = 1 << 10,//丐帮
//    HTCJdps        = 1 << 11 //藏剑
//};

@interface HTEquip : NSObject<NSCopying,NSCoding>

@property (nonatomic,assign) NSInteger p_id;//装备ID，自增，此值唯一
@property (nonatomic,assign) NSInteger uiid;//剑网3中该装备的UIID，此值唯一
@property (nonatomic,assign) NSInteger iconID;//剑网3中该装备的图标id

@property (nonatomic,retain) NSString* name;//装备名
//@property (nonatomic,assign) HTMenpai menpai;

//心法
//可转为18位二进制，分别代表可选此装备的心法，分别是元气4职业，根骨3职业，力道3职业，身法2职业，治疗3职业，防御3职业
//0	   1	2	3	4	5	6	7	8	9	10	11	12	13	14	15	16	17
//花间 易筋	天罗	焚影	冰心	紫霞	毒经	惊羽	笑尘	傲血	藏剑	太虚	离经	云裳	补天	铁牢	洗髓	明尊
@property (nonatomic,assign) NSInteger xinfatype;//心法

//0     1	2	3	4	5	6	7	8	9	10	11	12
//项链	腰坠	戒指		暗器	鞋子	护腕	下装	上衣	帽子	腰带	武器	重兵
@property (nonatomic,assign) HTBuWei buWei;//部位类型

@property (nonatomic,assign) NSInteger quality;//品质
@property (nonatomic,assign) NSInteger score;//分数

@property (nonatomic,assign) NSInteger tizhi;//体质
@property (nonatomic,assign) NSInteger gengu;//根骨
@property (nonatomic,assign) NSInteger lidao;//力道
@property (nonatomic,assign) NSInteger shenfa;//身法
@property (nonatomic,assign) NSInteger yuanqi;//元气

@property (nonatomic,assign) NSInteger basicPhysicsSheild;//白字防御
@property (nonatomic,assign) NSInteger basicMagicSheild;//白字内防
@property (nonatomic,assign) NSInteger physicsShield;//外防
@property (nonatomic,assign) NSInteger magicSheild;//内防
@property (nonatomic,assign) NSInteger dodge;//闪避
@property (nonatomic,assign) NSInteger parryBase;//招架
@property (nonatomic,assign) NSInteger parryValue;//拆招

@property (nonatomic,assign) NSInteger yujin;//御劲

@property (nonatomic,assign) NSInteger gongji;//攻击
@property (nonatomic,assign) NSInteger zhiliaoliang;//治疗

@property (nonatomic,assign) NSInteger huixin;//会心
@property (nonatomic,assign) NSInteger huixiao;//会效
@property (nonatomic,assign) NSInteger pofang;//破防
@property (nonatomic,assign) NSInteger jiasu;//加速
@property (nonatomic,assign) NSInteger mingzhong;//命中
@property (nonatomic,assign) NSInteger wushuang;//无双
@property (nonatomic,assign) NSInteger huajin;//化劲
@property (nonatomic,assign) double threat;//威胁

@property (nonatomic,assign) NSInteger texiao;//特效

@property (nonatomic,retain) HTXiangqian *xiangqian;//镶嵌
@property (nonatomic,assign) NSInteger jinglianLevel;//最大强化等级
@property (nonatomic,retain) NSString *diaoluo;//掉落

@end
