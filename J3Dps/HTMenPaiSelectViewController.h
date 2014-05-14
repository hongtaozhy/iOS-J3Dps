//
//  HTMenPaiSelectViewController.h
//  J3Dps
//
//  Created by hadn't on 14-5-7.
//  Copyright (c) 2014年 hongtao5. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DrawerViewController.h"

@interface HTMenPaiSelectViewController : DrawerViewController

@property (nonatomic,retain) UIButton *xxButton;
@property (nonatomic,retain) UIButton *cyButton;
@property (nonatomic,retain) UIButton *gbButton;
@property (nonatomic,retain) UIButton *cjButton;
@property (nonatomic,retain) UIButton *tmButton;
@property (nonatomic,retain) UIButton *wdButton;
@property (nonatomic,retain) UIButton *slButton;
@property (nonatomic,retain) UIButton *tcButton;
@property (nonatomic,retain) UIButton *whButton;
@property (nonatomic,retain) UIButton *mjButton;

@property (nonatomic,retain) UIButton *xf1Button;
@property (nonatomic,retain) UIButton *xf2Button;

- (void)menpaiSelectButtonPress:(UIButton *)sender;

@end
