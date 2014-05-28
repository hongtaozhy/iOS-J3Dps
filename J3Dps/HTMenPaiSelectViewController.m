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
@property (nonatomic,retain) UIButton *currenctXinfaButton;
@end

@implementation HTMenPaiSelectViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
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
    self.centerView = [[HTBaseView alloc] initWithFrame:CGRectMake(0, 0, 320, 568)];
    self.centerView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg2"]];
    
    UIImage *xzImg = [UIImage imageNamed:@"xuanzemenpai"];
    UIImageView *xzmp = [[UIImageView alloc] initWithImage:xzImg];
    [xzmp setFrame:CGRectMake(13, 63, xzImg.size.width, xzImg.size.height)];
    [self.centerView addSubview:xzmp];
    
    UIImage *xzxfImg = [UIImage imageNamed:@"xuanzexinfa"];
    UIImageView *xzxf = [[UIImageView alloc] initWithImage:xzxfImg];
    [xzxf setFrame:CGRectMake(13, 408, xzxfImg.size.width, xzxfImg.size.height)];
    [self.centerView addSubview:xzxf];
    
    UIImage *xxImg = [UIImage imageNamed:@"qixiu"];
    self.xxButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.xxButton.backgroundColor = [UIColor colorWithPatternImage:xxImg];
    self.xxButton.frame = CGRectMake(10, 109, xxImg.size.width, xxImg.size.height);
    [self.xxButton setImage:[UIImage imageNamed:@"qixiu-c"] forState:UIControlStateSelected];
    [self.xxButton addTarget:self action:@selector(menpaiSelectButtonPress:) forControlEvents:UIControlEventTouchUpInside];
    [self.xxButton setTag:HTXX];
    [self.centerView addSubview:self.xxButton];

    UIImage *cyImg = [UIImage imageNamed:@"chunyang"];
    self.cyButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.cyButton.backgroundColor = [UIColor colorWithPatternImage:cyImg];
    self.cyButton.frame = CGRectMake(116, 109, cyImg.size.width, cyImg.size.height);
    [self.cyButton setImage:[UIImage imageNamed:@"chunyang-c"] forState:UIControlStateSelected];
    [self.cyButton addTarget:self action:@selector(menpaiSelectButtonPress:) forControlEvents:UIControlEventTouchUpInside];
    [self.cyButton setTag:HTCY];
    [self.centerView addSubview:self.cyButton];

    UIImage *tcImg = [UIImage imageNamed:@"tiance"];
    self.tcButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.tcButton.backgroundColor = [UIColor colorWithPatternImage:tcImg];
    self.tcButton.frame = CGRectMake(214, 109, tcImg.size.width, tcImg.size.height);
    [self.tcButton setImage:[UIImage imageNamed:@"tiance-c"] forState:UIControlStateSelected];
    [self.tcButton addTarget:self action:@selector(menpaiSelectButtonPress:) forControlEvents:UIControlEventTouchUpInside];
    [self.tcButton setTag:HTTC];
    [self.centerView addSubview:self.tcButton];

    UIImage *whImg = [UIImage imageNamed:@"wanhua"];
    self.whButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.whButton.backgroundColor = [UIColor colorWithPatternImage:whImg];
    self.whButton.frame = CGRectMake(10, 187, whImg.size.width, whImg.size.height);
    [self.whButton setImage:[UIImage imageNamed:@"wanhua-c"] forState:UIControlStateSelected];
    [self.whButton addTarget:self action:@selector(menpaiSelectButtonPress:) forControlEvents:UIControlEventTouchUpInside];
    [self.whButton setTag:HTHH];
    [self.centerView addSubview:self.whButton];

    UIImage *cjImg = [UIImage imageNamed:@"cangjian"];
    self.cjButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.cjButton.backgroundColor = [UIColor colorWithPatternImage:cjImg];
    self.cjButton.frame = CGRectMake(116, 187, cjImg.size.width, cjImg.size.height);
    [self.cjButton setImage:[UIImage imageNamed:@"cangjian-c"] forState:UIControlStateSelected];
    [self.cjButton addTarget:self action:@selector(menpaiSelectButtonPress:) forControlEvents:UIControlEventTouchUpInside];
    [self.cjButton setTag:HTCJ];
    [self.centerView addSubview:self.cjButton];

    UIImage *hsImg = [UIImage imageNamed:@"shaolin"];
    self.slButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.slButton.backgroundColor = [UIColor colorWithPatternImage:hsImg];
    self.slButton.frame = CGRectMake(214, 187, hsImg.size.width, hsImg.size.height);
    [self.slButton setImage:[UIImage imageNamed:@"shaolin-c"] forState:UIControlStateSelected];
    [self.slButton addTarget:self action:@selector(menpaiSelectButtonPress:) forControlEvents:UIControlEventTouchUpInside];
    [self.slButton setTag:HTHS];
    [self.centerView addSubview:self.slButton];

    UIImage *wdImg = [UIImage imageNamed:@"wudu"];
    self.wdButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.wdButton.backgroundColor = [UIColor colorWithPatternImage:wdImg];
    self.wdButton.frame = CGRectMake(10, 262, wdImg.size.width, wdImg.size.height);
    [self.wdButton setImage:[UIImage imageNamed:@"wudu-c"] forState:UIControlStateSelected];
    [self.wdButton addTarget:self action:@selector(menpaiSelectButtonPress:) forControlEvents:UIControlEventTouchUpInside];
    [self.wdButton setTag:HTWD];
    [self.centerView addSubview:self.wdButton];

    UIImage *tmImg = [UIImage imageNamed:@"tangmen"];
    self.tmButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.tmButton.backgroundColor = [UIColor colorWithPatternImage:tmImg];
    self.tmButton.frame = CGRectMake(116, 262, tmImg.size.width, tmImg.size.height);
    [self.tmButton setImage:[UIImage imageNamed:@"tangmen-c"] forState:UIControlStateSelected];
    [self.tmButton addTarget:self action:@selector(menpaiSelectButtonPress:) forControlEvents:UIControlEventTouchUpInside];
    [self.tmButton setTag:HTTM];
    [self.centerView addSubview:self.tmButton];

    UIImage *mjImg = [UIImage imageNamed:@"mingjiao"];
    self.mjButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.mjButton.backgroundColor = [UIColor colorWithPatternImage:mjImg];
    self.mjButton.frame = CGRectMake(214, 262, mjImg.size.width, mjImg.size.height);
    [self.mjButton setImage:[UIImage imageNamed:@"mingjiao-c"] forState:UIControlStateSelected];
    [self.mjButton addTarget:self action:@selector(menpaiSelectButtonPress:) forControlEvents:UIControlEventTouchUpInside];
    [self.mjButton setTag:HTMJ];
    [self.centerView addSubview:self.mjButton];
    
    UIImage *gbImg = [UIImage imageNamed:@"gaibang"];
    self.gbButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.gbButton.backgroundColor = [UIColor colorWithPatternImage:gbImg];
    self.gbButton.frame = CGRectMake(116, 338, gbImg.size.width, gbImg.size.height);
    [self.gbButton setImage:[UIImage imageNamed:@"gaibang-c"] forState:UIControlStateSelected];
    [self.gbButton addTarget:self action:@selector(menpaiSelectButtonPress:) forControlEvents:UIControlEventTouchUpInside];
    [self.gbButton setTag:HTGB];
    [self.centerView addSubview:self.gbButton];
    
    UIImage *xf1Img = [UIImage imageNamed:@"huajian"];
    self.xf1Button = [UIButton buttonWithType:UIButtonTypeCustom];
    self.xf1Button.backgroundColor = [UIColor colorWithPatternImage:xf1Img];
    self.xf1Button.frame = CGRectMake(10, 462, xf1Img.size.width, xf1Img.size.height);
    [self.xf1Button setImage:[UIImage imageNamed:@"huajian-c"] forState:UIControlStateSelected];
    [self.xf1Button addTarget:self action:@selector(xinfaSelectButtonPress:) forControlEvents:UIControlEventTouchUpInside];
    [self.centerView addSubview:self.xf1Button];
    
    UIImage *xf2Img = [UIImage imageNamed:@"lijing"];
    self.xf2Button = [UIButton buttonWithType:UIButtonTypeCustom];
    self.xf2Button.backgroundColor = [UIColor colorWithPatternImage:xf2Img];
    self.xf2Button.frame = CGRectMake(168, 462, xf2Img.size.width, xf2Img.size.height);
    [self.xf2Button setImage:[UIImage imageNamed:@"lijing-c"] forState:UIControlStateSelected];
    [self.xf2Button addTarget:self action:@selector(xinfaSelectButtonPress:) forControlEvents:UIControlEventTouchUpInside];
    [self.centerView addSubview:self.xf2Button];
    
    // Set parameters
    self.leftViewVisibleWidth = 200;
    self.rightViewVisibleWidth = 120;
    self.leftViewCenterX = 70;
    self.rightViewCenterX = 150;
    self.showDrawerMaxTrasitionX = 40;
    
    [self.xf1Button setHidden:YES];
    [self.xf2Button setHidden:YES];
    
    if ( [[HTSuitManager sharedManager] nowSuit].isDefaultXinFa )
    {
        self.currenctXinfaButton = self.xf1Button;
        self.xf1Button.selected = YES;
    }
    else
    {
        self.currenctXinfaButton = self.xf2Button;
        self.xf2Button.selected = YES;
    }
    
    [self nowSelectWithTag:[[HTSuitManager sharedManager] nowSuit].menpai];

    
    [self initialDrawerViewController];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)nowSelectWithTag:(NSInteger)tag
{
    switch (tag)
    {
        case HTXX:
            self.currenctMenPaiButton = self.xxButton;
            break;
        case HTCY:
            self.currenctMenPaiButton = self.cyButton;
            break;
        case HTCJ:
            self.currenctMenPaiButton = self.cjButton;
            break;
        case HTGB:
            self.currenctMenPaiButton = self.gbButton;
            break;
        case HTTC:
            self.currenctMenPaiButton = self.tcButton;
            break;
        case HTWD:
            self.currenctMenPaiButton = self.wdButton;
            break;
        case HTHS:
            self.currenctMenPaiButton = self.slButton;
            break;
        case HTHH:
            self.currenctMenPaiButton = self.whButton;
            break;
        case HTTM:
            self.currenctMenPaiButton = self.tmButton;
            break;
        case HTMJ:
            self.currenctMenPaiButton = self.mjButton;
            break;
        default:
            self.currenctMenPaiButton = nil;
            break;
    }
    if (self.currenctMenPaiButton)
    {
        self.currenctMenPaiButton.selected = YES;
        [self changeXFImgWithTag:[self.currenctMenPaiButton tag]];
        [self.xf1Button setHidden:NO];
        [self.xf2Button setHidden:NO];
    }
}

#pragma mark - Button Press

- (void)backButtonPress
{
}

- (void)xinfaSelectButtonPress:(UIButton *)sender
{
    if (sender != [self currenctXinfaButton])
    {
        self.currenctXinfaButton.selected = NO;
        self.currenctXinfaButton = sender;
    }
    self.currenctXinfaButton.selected = YES;
    
    [self sureDown:sender];
}

- (void)sureDown:(UIButton *)sender
{
    if ([[HTSuitManager sharedManager] nowSuit].menpai != self.currenctMenPaiButton.tag
        || [[HTSuitManager sharedManager] nowSuit].isDefaultXinFa != (sender == self.xf1Button))
    {
        if ([[HTSuitManager sharedManager] nowSuit].menpai >= 0)
        {
            NSString *title = @"切换门派将会清空当前配装，是否切换";
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
                                                            message:nil
                                                           delegate:self
                                                  cancelButtonTitle:@"取消"
                                                  otherButtonTitles:@"确定",nil];
            alert.alertViewStyle = UIAlertViewStyleDefault;
            
            [alert show];
            return;
        }
    }

    //必须先设置心法
    HTSuit *nowSuit = [[HTSuitManager sharedManager] nowSuit];
    nowSuit.isDefaultXinFa = sender == self.xf1Button;
    nowSuit.menpai = self.currenctMenPaiButton.tag;


    [self showLeftView];
    
    if (nowSuit.isConflict || nowSuit.isNoSelectBody)
    {
        [[HTMenuView sharedView] changRowByCode:0 animated:NO];
    }
    else
    {
        [[HTMenuView sharedView] changRowByCode:0 animated:YES];
    }
}

-(void)alertView:(UIAlertView*)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0)
    {
        [self showLeftView];
        HTSuit *nowSuit = [[HTSuitManager sharedManager] nowSuit];
        if (nowSuit.isConflict || nowSuit.isNoSelectBody)
        {
            [[HTMenuView sharedView] changRowByCode:0 animated:NO];
        }
        else
        {
            [[HTMenuView sharedView] changRowByCode:0 animated:YES];
        }
        return;
    }
    else
    {
        //必须先设置心法
        HTSuit *nowSuit = [[HTSuitManager sharedManager] nowSuit];

        [nowSuit clear];
        nowSuit.isDefaultXinFa = self.currenctXinfaButton == self.xf1Button;
        nowSuit.menpai = self.currenctMenPaiButton.tag;
        
        [self showLeftView];

        if (nowSuit.isConflict || nowSuit.isNoSelectBody)
        {
            [[HTMenuView sharedView] changRowByCode:0 animated:NO];
        }
        else
        {
            [[HTMenuView sharedView] changRowByCode:0 animated:YES];
        }
    }
}

- (void)menpaiSelectButtonPress:(UIButton *)sender
{
    CGPoint center1 = self.xf1Button.center;
    CGPoint center2 = self.xf2Button.center;
    
    [self.xf1Button setCenter:CGPointMake(320,center1.y)];
    [self.xf2Button setCenter:CGPointMake(320+158,center2.y)];
    [self.xf1Button setHidden:YES];
    [self.xf2Button setHidden:YES];
    
    if (sender != [self currenctMenPaiButton])
    {
        self.currenctMenPaiButton.selected = NO;
        self.currenctMenPaiButton = sender;
    }
    self.currenctMenPaiButton.selected = YES;
    self.currenctXinfaButton.selected = NO;

    [self changeXFImgWithTag:[sender tag]];
    
    //开始动画
    [UIView beginAnimations:nil context:nil];
    //设定动画持续时间
    [UIView setAnimationDuration:0.5];
    //动画的内容
    [self.xf1Button setHidden:NO];
    if (self.currenctMenPaiButton != self.gbButton)
    {
        [self.xf2Button setHidden:NO];
    }
    
    [self.xf1Button setCenter:center1];
    [self.xf2Button setCenter:center2];
    
    //动画结束
    [UIView commitAnimations];
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


- (void)changeXFImgWithTag:(NSInteger)tag
{
    switch (tag)
    {
        case HTXX:
        {
            self.xf1Button.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bingxin"]];
            [self.xf1Button setImage:[UIImage imageNamed:@"bingxin-c"] forState:UIControlStateSelected];
            
            self.xf2Button.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"yunshang"]];
            [self.xf2Button setImage:[UIImage imageNamed:@"yunshang-c"] forState:UIControlStateSelected];
            
        }
            break;
        case HTCY:
        {
            self.xf1Button.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"taixu"]];
            [self.xf1Button setImage:[UIImage imageNamed:@"taixu-c"] forState:UIControlStateSelected];
            
            self.xf2Button.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"zixia"]];
            [self.xf2Button setImage:[UIImage imageNamed:@"zixia-c"] forState:UIControlStateSelected];
        }
            break;
        case HTTC:
        {
            self.xf1Button.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"aoxue"]];
            [self.xf1Button setImage:[UIImage imageNamed:@"aoxue-c"] forState:UIControlStateSelected];
            
            self.xf2Button.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"tielao"]];
            [self.xf2Button setImage:[UIImage imageNamed:@"tielao-c"] forState:UIControlStateSelected];
        }
            break;
        case HTHH:
        {
            self.xf1Button.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"huajian"]];
            [self.xf1Button setImage:[UIImage imageNamed:@"huajian-c"] forState:UIControlStateSelected];
            
            self.xf2Button.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"lijing"]];
            [self.xf2Button setImage:[UIImage imageNamed:@"lijing-c"] forState:UIControlStateSelected];
        }
            break;
        case HTCJ:
        {
            self.xf1Button.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"shanju"]];
            [self.xf1Button setImage:[UIImage imageNamed:@"shanju-c"] forState:UIControlStateSelected];
            
            self.xf2Button.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"wenshui"]];
            [self.xf2Button setImage:[UIImage imageNamed:@"wenshui-c"] forState:UIControlStateSelected];
        }
            break;
        case HTHS:
        {
            self.xf1Button.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"yijin"]];
            [self.xf1Button setImage:[UIImage imageNamed:@"yijin-c"] forState:UIControlStateSelected];
            
            self.xf2Button.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"xisui"]];
            [self.xf2Button setImage:[UIImage imageNamed:@"xisui-c"] forState:UIControlStateSelected];
        }
            break;
        case HTWD:
        {
            self.xf1Button.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"dujing"]];
            [self.xf1Button setImage:[UIImage imageNamed:@"dujing-c"] forState:UIControlStateSelected];
            
            self.xf2Button.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"butian"]];
            [self.xf2Button setImage:[UIImage imageNamed:@"butian-c"] forState:UIControlStateSelected];
        }
            break;
        case HTTM:
        {
            self.xf1Button.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"tianluo"]];
            [self.xf1Button setImage:[UIImage imageNamed:@"tianluo-c"] forState:UIControlStateSelected];
            
            self.xf2Button.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"jingyu"]];
            [self.xf2Button setImage:[UIImage imageNamed:@"jingyu-c"] forState:UIControlStateSelected];
        }
            break;
        case HTMJ:
        {
            self.xf1Button.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"fenying"]];
            [self.xf1Button setImage:[UIImage imageNamed:@"fenying-c"] forState:UIControlStateSelected];
            
            self.xf2Button.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"mingzun"]];
            [self.xf2Button setImage:[UIImage imageNamed:@"mingzun-c"] forState:UIControlStateSelected];
        }
            break;
        case HTGB:
        {
            self.xf1Button.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"xiaochen"]];
            [self.xf1Button setImage:[UIImage imageNamed:@"xiaochen-c"] forState:UIControlStateSelected];
            
            self.xf2Button.backgroundColor = [UIColor colorWithPatternImage:nil];
            [self.xf2Button setImage:nil forState:UIControlStateSelected];
        }
            break;
        default:
            break;
    }
}
@end
