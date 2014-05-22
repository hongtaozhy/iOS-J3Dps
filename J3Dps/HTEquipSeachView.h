//
//  HTEquipSeachView.h
//  J3Dps
//
//  Created by hadn't on 14-5-18.
//  Copyright (c) 2014年 hongtao5. All rights reserved.
//

#import "HTBaseView.h"
#import "HTMenuView.h"

@interface HTEquipSeachView : HTBaseView<UITextFieldDelegate,UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,retain) UITextField *searchView;
@property (nonatomic,retain) UIButton *currentCategoryBtn;
@property (nonatomic,retain) UITableView *resultTable;

@property (nonatomic,assign) id<HTCenterViewDelegate> centerDelegate;
@end
