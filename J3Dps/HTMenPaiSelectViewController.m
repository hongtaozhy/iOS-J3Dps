//
//  HTMenPaiSelectViewController.m
//  J3Dps
//
//  Created by hadn't on 14-5-7.
//  Copyright (c) 2014年 hongtao5. All rights reserved.
//

#import "HTMenPaiSelectViewController.h"
#import "HTMainViewController.h"

@interface HTMenPaiSelectViewController ()
@property (nonatomic,retain) UIButton *currenctMenPaiButton;

@end

@implementation HTMenPaiSelectViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Create left view
    self.leftView = [HTMenuView sharedView];
    // Create right view
    //    self.rightView = [HTMenuView sharedView];
    
    // Create center view
    self.centerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 568)];
    self.centerView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg2"]];
    
    
    // Set parameters
    self.leftViewVisibleWidth = 200;
    self.rightViewVisibleWidth = 120;
    self.leftViewCenterX = 70;
    self.rightViewCenterX = 150;
    self.showDrawerMaxTrasitionX = 40;
    
    [self initialDrawerViewController];

    
    [self.xxButton setImage:[UIImage imageNamed:@"qixiu-c"] forState:UIControlStateSelected];
    [self.cjButton setImage:[UIImage imageNamed:@"cangjian-c"] forState:UIControlStateSelected];
    [self.cyButton setImage:[UIImage imageNamed:@"chunyang-c"] forState:UIControlStateSelected];
    [self.gbButton setImage:[UIImage imageNamed:@"gaibang-c"] forState:UIControlStateSelected];
    [self.mjButton setImage:[UIImage imageNamed:@"mingjiao-c"] forState:UIControlStateSelected];
    [self.slButton setImage:[UIImage imageNamed:@"shaolin-c"] forState:UIControlStateSelected];
    [self.tmButton setImage:[UIImage imageNamed:@"tangmen-c"] forState:UIControlStateSelected];
    [self.tcButton setImage:[UIImage imageNamed:@"tiance-c"] forState:UIControlStateSelected];
    [self.whButton setImage:[UIImage imageNamed:@"wanhua-c"] forState:UIControlStateSelected];
    [self.wdButton setImage:[UIImage imageNamed:@"wudu-c"] forState:UIControlStateSelected];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)backButtonPress
{
}

- (void)menpaiSelectButtonPress:(UIButton *)sender
{
    if (sender != [self currenctMenPaiButton])
    {
        self.currenctMenPaiButton.selected = NO;
        self.currenctMenPaiButton = sender;
    }
    self.currenctMenPaiButton.selected = YES;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
