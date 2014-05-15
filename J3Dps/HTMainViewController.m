//
//  HTMainViewController.m
//  J3Dps
//
//  Created by hadn't on 14-5-10.
//  Copyright (c) 2014年 hongtao5. All rights reserved.
//

#import "HTMainViewController.h"
#import "HTMenuView.h"
#import "HTUILabel.h"

@interface HTMainViewController ()

@end

@implementation HTMainViewController

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
    self.centerView = [[HTBaseView alloc] initWithFrame:CGRectMake(0, 0, 320, 568)];
    self.centerView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg4"]];
    
    UIImage *menu = [UIImage imageNamed:@"caidan"];
    UIButton *menuBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [menuBtn setBackgroundColor:[UIColor colorWithPatternImage:menu]];
    [menuBtn setFrame:CGRectMake(0, 25, menu.size.width, menu.size.height)];
    [menuBtn addTarget:self action:@selector(menuBtnPress) forControlEvents:UIControlEventTouchUpInside];
    [self.centerView addSubview:menuBtn];
    
    UIImage *previewImg = [UIImage imageNamed:@"zonglan"];
    UIButton *previewBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [previewBtn setBackgroundColor:[UIColor colorWithPatternImage:previewImg]];
    [previewBtn setFrame:CGRectMake(261, 25, previewImg.size.width, previewImg.size.height)];
    [previewBtn addTarget:self action:@selector(previewBtnPress) forControlEvents:UIControlEventTouchUpInside];
    [self.centerView addSubview:previewBtn];
    
    UIImage *xftImg = [UIImage imageNamed:@"xinfatiao"];
    UIImageView *xztx = [[UIImageView alloc] initWithImage:xftImg];
    [xztx setFrame:CGRectMake(60.5, 52, xftImg.size.width, xftImg.size.height)];
    [self.centerView addSubview:xztx];
    
    HTUILabel *tixingLabel = [[HTUILabel alloc] initWithFrame:CGRectMake(0, 59, 320, 60)];
    [tixingLabel setCenter:CGPointMake(160, 58.5)];
    [tixingLabel setBackgroundColor:[UIColor clearColor]];
    [tixingLabel setTextColor:[UIColor whiteColor]];
    [tixingLabel setFont:[UIFont fontWithName:@"STHeitiSC-Medium" size:17.0]];
    tixingLabel.text = [NSString stringWithFormat:@"%@·%@",[[HTSuitManager sharedManager] nowSuit].bodyString,[[HTSuitManager sharedManager] nowSuit].xinFaString];
    [tixingLabel setTextAlignment:NSTextAlignmentCenter];
    [self.centerView addSubview:tixingLabel];
    
  
    // Set parameters
    self.leftViewVisibleWidth = 200;
    self.rightViewVisibleWidth = 120;
    self.leftViewCenterX = 70;
    self.rightViewCenterX = 150;
    self.showDrawerMaxTrasitionX = 40;

    [self initialDrawerViewController];

//    [self disableGestureForDrawerView];

}

- (void)dealloc
{
    return;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
#pragma mark - Btn Press

- (void)menuBtnPress
{
    [self showLeftView];
}

- (void)previewBtnPress
{
    [self showRightView];
}
@end
