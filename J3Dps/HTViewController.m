//
//  HTViewController.m
//  J3Dps
//
//  Created by hadn't on 14-5-5.
//  Copyright (c) 2014年 hongtao5. All rights reserved.
//

#import "HTViewController.h"

@interface HTViewController ()
@property (nonatomic,retain) UIButton *currenctButton;
@end

@implementation HTViewController

- (void)viewDidLoad
{
    self.currenctButton = nil;
    [super viewDidLoad];
    [self.loli setImage:[UIImage imageNamed:@"loli-c"] forState:UIControlStateSelected];
    [self.man setImage:[UIImage imageNamed:@"chengnan-c"] forState:UIControlStateSelected];
    [self.woman setImage:[UIImage imageNamed:@"chengnv-c"] forState:UIControlStateSelected];
    [self.boy setImage:[UIImage imageNamed:@"zhengtai-c"] forState:UIControlStateSelected];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)ButtonAction:(UIButton *)sender
{
    if (sender != [self currenctButton])
    {
        self.currenctButton.selected = NO;
        self.currenctButton = sender;
    }
    self.currenctButton.selected = !sender.selected;
}

- (IBAction)sureDown:(UIButton *)sender
{
    
}

@end
