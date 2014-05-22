//
//  HTMenuView.h
//  J3Dps
//
//  Created by hadn't on 14-5-10.
//  Copyright (c) 2014年 hongtao5. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HTCenterViewDelegate <NSObject>

- (void)changedViewContorller:(NSInteger)index;

@optional
- (void)changedEquip;
@end

@interface HTMenuView : UITableView<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,assign) id<HTCenterViewDelegate> centerDelegate;

+ (instancetype)sharedView;

- (void)changRowByCode:(NSInteger)index;

@end
