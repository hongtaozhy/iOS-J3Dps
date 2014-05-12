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
        // Custom initialization
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
    self.centerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 568)];
    self.centerView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg1"]];
    
    
    // Set parameters
    self.leftViewVisibleWidth = 200;
    self.rightViewVisibleWidth = 120;
    self.leftViewCenterX = 70;
    self.rightViewCenterX = 150;
    self.showDrawerMaxTrasitionX = 40;
    
    [self initialDrawerViewController];
 
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

- (void)bodySelectButtonPress:(UIButton *)sender
{
    if (sender != [self currenctButton])
    {
        self.currenctButton.selected = NO;
        self.currenctButton = sender;
    }
    self.currenctButton.selected = YES;
}

#pragma mark - Test DB
- (void)sureDown:(UIButton *)sender
{
    //    NSString *title = @"请输入装备名称";
    //    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
    //                                                    message:nil
    //                                                   delegate:self
    //                                          cancelButtonTitle:@"确定"
    //                                          otherButtonTitles:nil];
    //    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    //
    //    [alert show];
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
