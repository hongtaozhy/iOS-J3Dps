//
//  HTEquipManager.h
//  J3Dps
//
//  Created by hadn't on 14-5-6.
//  Copyright (c) 2014年 hongtao5. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HTEquipManager : NSObject

@property (nonatomic,retain) NSArray *allEquip;

+ (instancetype)sharedManager;

- (void)initData;

- (NSArray *)searchByBuWei:(HTBuWei)buwei;

- (NSArray *)searchByBuWei:(HTBuWei)buwei xinfa:(HTXinFa)xinfa;

- (NSArray *)searchByBuWei:(HTBuWei)buwei haveProperty:(HTEquipProType)type;

- (NSArray *)searchByBuWei:(HTBuWei)buwei xinfa:(HTXinFa)xinfa haveProperty:(HTEquipProType)type;

- (NSString *)typeName:(HTBuWei)buwei;
@end
