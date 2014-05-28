//
//  HTBodySelectViewController.m
//  J3Dps
//
//  Created by hadn't on 14-5-10.
//  Copyright (c) 2014年 hongtao5. All rights reserved.
//

#import "HTBodySelectViewController.h"
#import "HTMenuView.h"


@interface HTBodySelectViewController ()

@property (nonatomic,retain) UIButton *loli;
@property (nonatomic,retain) UIButton *man;
@property (nonatomic,retain) UIButton *woman;
@property (nonatomic,retain) UIButton *boy;

@property (nonatomic,retain) UIButton *currenctButton;

@end

@implementation HTBodySelectViewController

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
    self.currenctButton = nil;

    // Do any additional setup after loading the view.
    // Create left view
    self.leftView = [HTMenuView sharedView];
    // Create right view
    //    self.rightView = [HTMenuView sharedView];
    
    // Create center view
    self.centerView = [[HTBaseView alloc] initWithFrame:CGRectMake(0, 0, 320, 568)];
    self.centerView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg1"]];
    
    UIImage *loliImg = [UIImage imageNamed:@"loli"];
    self.loli = [UIButton buttonWithType:UIButtonTypeCustom];
    self.loli.backgroundColor = [UIColor colorWithPatternImage:loliImg];
    self.loli.frame = CGRectMake(10, 94, loliImg.size.width, loliImg.size.height);
    [self.loli setImage:[UIImage imageNamed:@"loli-c"] forState:UIControlStateSelected];
    [self.loli addTarget:self action:@selector(bodySelectButtonPress:) forControlEvents:UIControlEventTouchUpInside];
    [self.loli setTag:HTBodyLoli];
    [self.centerView addSubview:self.loli];
    
    UIImage *manImg = [UIImage imageNamed:@"chengnan"];
    self.man = [UIButton buttonWithType:UIButtonTypeCustom];
    self.man.backgroundColor = [UIColor colorWithPatternImage:manImg];
    self.man.frame = CGRectMake(12, 295, manImg.size.width, manImg.size.height);
    [self.man setImage:[UIImage imageNamed:@"chengnan-c"] forState:UIControlStateSelected];
    [self.man addTarget:self action:@selector(bodySelectButtonPress:) forControlEvents:UIControlEventTouchUpInside];
    [self.man setTag:HTBodyMan];
    [self.centerView addSubview:self.man];

    UIImage *womanImg = [UIImage imageNamed:@"chengnv"];
    self.woman = [UIButton buttonWithType:UIButtonTypeCustom];
    self.woman.backgroundColor = [UIColor colorWithPatternImage:womanImg];
    self.woman.frame = CGRectMake(160, 94, womanImg.size.width, womanImg.size.height);
    [self.woman setImage:[UIImage imageNamed:@"chengnv-c"] forState:UIControlStateSelected];
    [self.woman addTarget:self action:@selector(bodySelectButtonPress:) forControlEvents:UIControlEventTouchUpInside];
    [self.woman setTag:HTBodyWoman];
    [self.centerView addSubview:self.woman];

    UIImage *boyImg = [UIImage imageNamed:@"zhengtai"];
    self.boy = [UIButton buttonWithType:UIButtonTypeCustom];
    self.boy.backgroundColor = [UIColor colorWithPatternImage:boyImg];
    self.boy.frame = CGRectMake(162, 295, boyImg.size.width, boyImg.size.height);
    [self.boy setImage:[UIImage imageNamed:@"zhengtai-c"] forState:UIControlStateSelected];
    [self.boy addTarget:self action:@selector(bodySelectButtonPress:) forControlEvents:UIControlEventTouchUpInside];
    [self.boy setTag:HTBodyBoy];
    [self.centerView addSubview:self.boy];

    UIImage *xzImg = [UIImage imageNamed:@"xuanzetixing"];
    UIImageView *xztx = [[UIImageView alloc] initWithImage:xzImg];
    [xztx setFrame:CGRectMake(10, 50, xzImg.size.width, xzImg.size.height)];
    [self.centerView addSubview:xztx];
    
//    UIImage *sureImg = [UIImage imageNamed:@"done1"];
//    UIButton *sureButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    sureButton.backgroundColor = [UIColor colorWithPatternImage:sureImg];
//    sureButton.frame = CGRectMake(240, 518, sureImg.size.width, sureImg.size.height);
//    [sureButton setImage:[UIImage imageNamed:@"done2"] forState:UIControlStateHighlighted];
//    [sureButton addTarget:self action:@selector(sureDown:) forControlEvents:UIControlEventTouchUpInside];
//    [self.centerView addSubview:sureButton];
    
    // Set parameters
    self.leftViewVisibleWidth = 200;
    self.rightViewVisibleWidth = 120;
    self.leftViewCenterX = 70;
    self.rightViewCenterX = 150;
    self.showDrawerMaxTrasitionX = 40;
    
    [self initialDrawerViewController];
    
    if ([[HTSuitManager sharedManager] nowSuit].menpai != HTHS &&
        [[HTSuitManager sharedManager] nowSuit].menpai != HTGB &&
        [[HTSuitManager sharedManager] nowSuit].menpai != HTXX) {
        [self.boy setEnabled:NO];
        [self.boy setAlpha:0.4];
    }
    if ([[HTSuitManager sharedManager] nowSuit].menpai == HTXX)
    {
        [self.man setEnabled:NO];
        [self.man setAlpha:0.4];
    }
    if ([[HTSuitManager sharedManager] nowSuit].menpai == HTHS)
    {
        [self.loli setEnabled:NO];
        [self.loli setAlpha:0.4];
        [self.woman setEnabled:NO];
        [self.woman setAlpha:0.4];
    }
    [self nowSelectWithTag:[[HTSuitManager sharedManager] nowSuit].body];
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
        case HTBodyLoli:
            self.currenctButton = self.loli;
            break;
        case HTBodyBoy:
            self.currenctButton = self.boy;
            break;
        case HTBodyMan:
            self.currenctButton = self.man;
            break;
        case HTBodyWoman:
            self.currenctButton = self.woman;
            break;
        default:
            self.currenctButton = nil;
            break;
    }
    self.currenctButton.selected = YES;
}

- (void)bodySelectButtonPress:(UIButton *)sender
{
    if (sender != [self currenctButton])
    {
        self.currenctButton.selected = NO;
        self.currenctButton = sender;
    }
    self.currenctButton.selected = YES;
    
    [self sureDown:sender];
}

#pragma mark - Test DB
- (void)sureDown:(UIButton *)sender
{
    HTSuit *nowSuit = [[HTSuitManager sharedManager] nowSuit];
    nowSuit.body = self.currenctButton.tag;
    
    [self showLeftView];
    if (nowSuit.isConflict || nowSuit.isNoSelectXinfa)
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
//    UITextField *textField=[alertView textFieldAtIndex:0];
//    NSString *name  = [textField text];
//    NSArray *arr = [[HTEquipManager sharedManager] allEquip];
//    
//    
//    HTEquip *find = nil;
//    for (HTEquip *nowEquip in arr)
//    {
//        if ( [nowEquip.name isEqualToString:name] )
//        {
//            find = nowEquip;
//            break;
//        }
//    }
//    
//    NSString *msg = nil;
//    if (find)
//    {
//        msg = [NSString stringWithFormat:@"%@",find];
//    }
//    else
//    {
//        msg = @"没找到这件装备";
//    }
//    UIAlertView *alert = nil;
//    
//    
//    alert = [[UIAlertView alloc] initWithTitle:@"查找结果"
//                                       message:msg
//                                      delegate:nil
//                             cancelButtonTitle:@"确定"
//                             otherButtonTitles:nil];
//    [alert show];
}
@end
