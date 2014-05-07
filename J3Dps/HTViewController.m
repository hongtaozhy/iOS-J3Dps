//
//  HTViewController.m
//  J3Dps
//
//  Created by hadn't on 14-5-5.
//  Copyright (c) 2014年 hongtao5. All rights reserved.
//

#import "HTViewController.h"
#import "HTEquipManager.h"
#import "HTEquip.h"

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
    self.currenctButton.selected = YES;
}

- (IBAction)sureDown:(UIButton *)sender
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
    UITextField *textField=[alertView textFieldAtIndex:0];
    NSString *name  = [textField text];
    NSArray *arr = [[HTEquipManager sharedManager] allEquip];
    

    HTEquip *find = nil;
    for (HTEquip *nowEquip in arr)
    {
        if ( [nowEquip.name isEqualToString:name] )
        {
            find = nowEquip;
            break;
        }
    }
    
    NSString *msg = nil;
    if (find)
    {
        msg = [NSString stringWithFormat:@"%@",find];
    }
    else
    {
        msg = @"没找到这件装备";
    }
    UIAlertView *alert = nil;
    
    
    alert = [[UIAlertView alloc] initWithTitle:@"查找结果"
                                       message:msg
                                      delegate:nil
                             cancelButtonTitle:@"确定"
                             otherButtonTitles:nil];
    [alert show];
}

@end
