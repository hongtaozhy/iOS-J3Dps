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
    NSString *dbPath = [documentDirectory stringByAppendingPathComponent:@"jx3_sqlite3"];
    FMDatabase *db = [FMDatabase databaseWithPath:dbPath] ;
    if (![db open])
    {
        NSLog(@"Could not open db.");
    }
    
    NSMutableArray *equipArr = [[NSMutableArray alloc] init];
    
    FMResultSet *rs = [db executeQuery:@"select * FROM equip"];
    while ([rs next])
    {
        HTEquip *now = [[HTEquip alloc] init];
        now.p_id = [rs intForColumn:@"P_ID"];
        now.uiid = [rs intForColumn:@"uiID"];
        now.iconID = [rs intForColumn:@"iconID"];
        
        now.name = [rs stringForColumn:@"name"];
        now.xinfatype = [rs intForColumn:@"xinfatype"];
        now.buWei = [rs intForColumn:@"type"];
        
        now.quality = [rs intForColumn:@"quality"];
        now.score = [rs intForColumn:@"score"];

        now.tizhi = [rs intForColumn:@"body"];
        now.gengu = [rs intForColumn:@"spirit"];
        now.lidao = [rs intForColumn:@"strength"];
        now.shenfa = [rs intForColumn:@"agility"];
        now.yuanqi = [rs intForColumn:@"spunk"];
        
        now.basicPhysicsSheild = [rs intForColumn:@"basicPhysicsSheild"];
        now.basicMagicSheild = [rs intForColumn:@"basicMagicSheild"];
        now.physicsShield = [rs intForColumn:@"physicsShield"];
        now.magicSheild = [rs intForColumn:@"magicSheild"];
        now.dodge = [rs intForColumn:@"dodge"];
        now.parryBase = [rs intForColumn:@"parryBase"];
        now.parryValue = [rs intForColumn:@"parryValue"];
        now.yujin = [rs intForColumn:@"toughness"];
        
        now.gongji = [rs intForColumn:@"attack"];
        now.zhiliaoliang = [rs intForColumn:@"heal"];
        now.huixin = [rs intForColumn:@"crit"];
        now.huixiao = [rs intForColumn:@"critEffect"];
        now.pofang = [rs intForColumn:@"overcome"];
        now.jiasu = [rs intForColumn:@"acce"];
        now.mingzhong = [rs intForColumn:@"hit"];
        now.wushuang = [rs intForColumn:@"strain"];
        now.huajin = [rs intForColumn:@"huajing"];
        now.threat = [rs doubleForColumn:@"threat"];
        now.texiao = [rs intForColumn:@"texiao"];
        
        now.xiangqian = [[HTXiangqian alloc] initWithString:[rs stringForColumn:@"xiangqian"]];
        
        now.jinglianLevel = [rs intForColumn:@"strengthen"];
        now.diaoluo = [rs stringForColumn:@"dropSource"];

        [equipArr addObject:now];
    }
    self.allEquip = [equipArr copy];
    [rs close];

}

- (NSArray *)searchByBuWei:(HTBuWei)buwei
{
    if (buwei == HTjiezhi2 )
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

- (NSArray *)searchByBuWei:(HTBuWei)buwei xinfa:(HTXinFa)xinfa
{
    if (buwei == HTjiezhi2 )
    {
        buwei = HTjiezhi;
    }
    NSMutableArray *searchResult = [[NSMutableArray alloc] init];
    
    for (HTEquip *nowEquip in self.allEquip)
    {
        if ( nowEquip.buWei == buwei && nowEquip.xinfatype&xinfa )
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

- (NSArray *)searchByBuWei:(HTBuWei)buwei xinfa:(HTXinFa)xinfa haveProperty:(HTEquipProType)type
{
    NSMutableArray *searchResult = [[NSMutableArray alloc] init];
    
    NSArray *arr = [self searchByBuWei:buwei xinfa:xinfa];
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
