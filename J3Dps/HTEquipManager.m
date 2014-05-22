//
//  HTEquipManager.m
//  J3Dps
//
//  Created by hadn't on 14-5-6.
//  Copyright (c) 2014年 hongtao5. All rights reserved.
//

#import "HTEquipManager.h"
#import "FMDatabase.h"
#import "FMDatabaseAdditions.h"
#import "HTDBManager.h"
#import "HTEquip.h"
#import "HTXiangqian.h"

@implementation HTEquipManager

+ (instancetype)sharedManager
{
    static dispatch_once_t onceQueue;
    static HTEquipManager *sharedManager = nil;
    
    dispatch_once(&onceQueue, ^{
        sharedManager = [[self alloc] init];
        [HTDBManager copyFileDatabase];
        
        sharedManager.allEquip = [[NSArray alloc] init];
    });
    
    return sharedManager;
}

- (void)initData
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [paths objectAtIndex:0];
    NSString *dbPath = [documentDirectory stringByAppendingPathComponent:@"j3dps"];
    FMDatabase *db = [FMDatabase databaseWithPath:dbPath] ;
    if (![db open])
    {
        NSLog(@"Could not open db.");
    }
    
    NSMutableArray *equipArr = [[NSMutableArray alloc] init];
    
    FMResultSet *rs = [db executeQuery:@"select * FROM equipment"];
    while ([rs next])
    {
        HTEquip *now = [[HTEquip alloc] init];
        now.name = [rs stringForColumn:@"name"];
        now.diaoluo = [rs stringForColumn:@"diaoluo"];
        
        now.menpai = [rs intForColumn:@"menpai"];
        now.type = [rs intForColumn:@"xinfatype"];
        now.buWei = [rs intForColumn:@"type"];
        
        now.quality = [rs intForColumn:@"quality"];
        now.score = [rs intForColumn:@"score"];

        now.tizhi = [rs intForColumn:@"body"];
        now.gengu = [rs intForColumn:@"gengu"];
        now.lidao = [rs intForColumn:@"lidao"];
        now.shenfa = [rs intForColumn:@"shenfa"];
        now.yuanqi = [rs intForColumn:@"yuanqi"];
        
        now.gongji = [rs intForColumn:@"attack"];
        now.zhiliaoliang = [rs intForColumn:@"heal"];
        now.huixin = [rs intForColumn:@"crit"];
        now.huixiao = [rs intForColumn:@"critEffect"];
        now.pofang = [rs intForColumn:@"break"];
        now.jiasu = [rs intForColumn:@"jiasu"];
        now.mingzhong = [rs intForColumn:@"mingzhong"];
        now.wushuang = [rs intForColumn:@"wushuang"];
        
        now.yujin = [rs intForColumn:@"yujing"];
        now.huajin = [rs intForColumn:@"huajing"];
        
        now.texiao = [rs intForColumn:@"texiao"];
        
        now.xiangqian = [[HTXiangqian alloc] initWithString:[rs stringForColumn:@"xiangqian"]];
        
        if ([rs intForColumn:@"huajian"] > 0)
        {
            now.tuijian = now.tuijian | HTHHdps ;
        }
        if ([rs intForColumn:@"bingxin"] > 0)
        {
            now.tuijian = now.tuijian | HTXXdps ;
        }
        if ([rs intForColumn:@"dujing"] > 0)
        {
            now.tuijian = now.tuijian | HTWDdps ;
        }
        if ([rs intForColumn:@"zixia"] > 0)
        {
            now.tuijian = now.tuijian | HTQC ;
        }
        if ([rs intForColumn:@"cangjian"] > 0)
        {
            now.tuijian = now.tuijian | HTCJdps ;
        }
        if ([rs intForColumn:@"xiaochen"] > 0)
        {
            now.tuijian = now.tuijian | HTGBdps ;
        }
        if ([rs intForColumn:@"taixu"] > 0)
        {
            now.tuijian = now.tuijian | HTJc ;
        }
        if ([rs intForColumn:@"aoxue"] > 0)
        {
            now.tuijian = now.tuijian | HTTCdps ;
        }
        if ([rs intForColumn:@"tianluo"] > 0)
        {
            now.tuijian = now.tuijian | HTTMdps1 ;
        }
        if ([rs intForColumn:@"jingyu"] > 0)
        {
            now.tuijian = now.tuijian | HTTMdps2 ;
        }
        if ([rs intForColumn:@"yijin"] > 0)
        {
            now.tuijian = now.tuijian | HTHSdps ;
        }
        if ([rs intForColumn:@"fenying"] > 0)
        {
            now.tuijian = now.tuijian | HTMJdps ;
        }
        
        now.jinglianLevel = [rs intForColumn:@"jinglian"];
        
        [equipArr addObject:now];
    }
    self.allEquip = [equipArr copy];
    [rs close];

}

- (NSArray *)searchByBuWei:(HTBuWei)buwei
{
    if (buwei == HTjiezhi +1 )
    {
        buwei = HTjiezhi;
    }
    NSMutableArray *searchResult = [[NSMutableArray alloc] init];
    
    for (HTEquip *nowEquip in self.allEquip)
    {
        if ( nowEquip.buWei == buwei )
        {
            [searchResult addObject:nowEquip];
        }
    }
    return [searchResult copy];
}

- (NSArray *)searchByBuWei:(HTBuWei)buwei xinfa:(HTMenpai)menpai dps:(BOOL)dps
{
    if (buwei == HTjiezhi +1 )
    {
        buwei = HTjiezhi;
    }
    int num = 0;
    switch (menpai)
    {
        case HTXX:
            num = HTXXdps;
            break;
        case HTCY:
            if (dps)
                num = HTJc;
            else
                num = HTQC;
            break;
        case HTHH:
            num = HTHHdps;
            break;
        case HTHS:
            num = HTHSdps;
            break;
        case HTCJ:
            num = HTCJdps;
            break;
        case HTGB:
            num = HTGBdps;
            break;
        case HTMJ:
            num = HTMJdps;
            break;
        case HTTC:
            num = HTTCdps;
            break;
        case HTTM:
            if (dps)
                num = HTTMdps1;
            else
                num = HTTMdps2;
            break;
        case HTWD:
            num = HTWDdps;
        default:
            break;
    }
    NSMutableArray *searchResult = [[NSMutableArray alloc] init];
    
    for (HTEquip *nowEquip in self.allEquip)
    {
        if ( nowEquip.buWei == buwei && nowEquip.tuijian&num )
        {
            [searchResult addObject:nowEquip];
        }
    }
    return [searchResult copy];
}


- (NSArray *)searchByBuWei:(HTBuWei)buwei haveProperty:(HTEquipProType)type
{
    NSMutableArray *searchResult = [[NSMutableArray alloc] init];
    
    NSArray *arr = [self searchByBuWei:buwei];
    if (type == HTALL)
    {
        return arr;
    }
    for (HTEquip *nowEquip in arr)
    {
        if((type == HTHuiXin && nowEquip.huixin > 0)||
           (type == HTPoFang && nowEquip.pofang > 0)||
           (type == HTJiaSu && nowEquip.jiasu > 0)||
           (type == HTMingZhong && nowEquip.mingzhong > 0)||
           (type == HTWuShuang && nowEquip.wushuang > 0)
           )
        {
            [searchResult addObject:nowEquip];
        }
        
    }
    return [searchResult copy];
}

- (NSArray *)searchByBuWei:(HTBuWei)buwei xinfa:(HTMenpai)menpai dps:(BOOL)dps haveProperty:(HTEquipProType)type
{
    NSMutableArray *searchResult = [[NSMutableArray alloc] init];
    
    NSArray *arr = [self searchByBuWei:buwei xinfa:menpai dps:dps];
    if (type == HTALL)
    {
        return arr;
    }
    for (HTEquip *nowEquip in arr)
    {
        if((type == HTHuiXin && nowEquip.huixin > 0)||
           (type == HTPoFang && nowEquip.pofang > 0)||
           (type == HTJiaSu && nowEquip.jiasu > 0)||
           (type == HTMingZhong && nowEquip.mingzhong > 0)||
           (type == HTWuShuang && nowEquip.wushuang > 0)
           )
        {
            [searchResult addObject:nowEquip];
        }
        
    }
    return [searchResult copy];
}
@end
