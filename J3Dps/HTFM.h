//
//  HTFM.h
//  J3Dps
//
//  Created by hongtao on 14-6-6.
//  Copyright (c) 2014年 hongtao5. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HTFM : NSObject

@property (nonatomic,retain) NSString *type;
@property (nonatomic,retain) NSString *name;

@property (nonatomic,assign) NSInteger tizhi;//体质
@property (nonatomic,assign) NSInteger mainPro;//主属性
@property (nonatomic,assign) NSInteger gongji;//攻击

@property (nonatomic,assign) NSInteger huixin;//会心
@property (nonatomic,assign) NSInteger huixiao;//会效
@property (nonatomic,assign) NSInteger mingzhong;//命中
@property (nonatomic,assign) NSInteger wushuang;//无双
@property (nonatomic,assign) NSInteger pofang;//破防
@property (nonatomic,assign) NSInteger jiasu;//加速

@property (nonatomic,assign) BOOL canUseByNeiGong;//内功是否可以用
@property (nonatomic,assign) BOOL canUseByWaigong;//外功是否可以用
@property (nonatomic,assign) BOOL canUseByZhiliao;//治疗是否可以用

@property (nonatomic,assign) BOOL canUseByTianluo;//天罗是否可以用

@end
