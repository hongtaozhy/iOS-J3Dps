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
#import "HTPreviewView.h"
#import "UIImage+AddUIImage.h"
#import "UIImage+HTMenPaiImg.h"
#import "HTEquipSeachView.h"

@interface HTMainViewController ()
@property (nonatomic,retain) UIButton *currenctButton;
@property (nonatomic,retain) HTEquipSeachView *serachEquipView;
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
    self.rightView = [[HTPreviewView alloc] initWithFrame:CGRectMake(20, 0, 300, 568)];
    
    // Create center view
    self.centerView = [[HTBaseView alloc] initWithFrame:CGRectMake(0, 0, 320, 568)];
    self.centerView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg4"]];
    
    UIImage *xfsmallImg = [UIImage imageWithMenPai:[[HTSuitManager sharedManager] nowSuit].menpai];

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
    [xztx setFrame:CGRectMake(60.5, 58, xftImg.size.width, xftImg.size.height)];
    [self.centerView addSubview:xztx];
    
    NSString *showtixing =  [NSString stringWithFormat:@"%@·%@",[[HTSuitManager sharedManager] nowSuit].bodyString,[[HTSuitManager sharedManager] nowSuit].xinFaString];
    UIFont *fonttx = [UIFont fontWithName:@"STHeitiSC-Medium" size:19.0];
    CGSize size = [showtixing sizeWithFont:fonttx];
    
    UILabel *suitNameLable = [[UILabel alloc] initWithFrame:CGRectMake(0, 39, 320, 60)];
    [suitNameLable setCenter:CGPointMake(160, 38)];
    [suitNameLable setBackgroundColor:[UIColor clearColor]];
    [suitNameLable setTextColor:[UIColor whiteColor]];
    [suitNameLable setFont:[UIFont fontWithName:@"STHeitiSC-Medium" size:20.0]];
    suitNameLable.text = [[[HTSuitManager sharedManager] nowSuit] suitName];
    [suitNameLable setTextAlignment:NSTextAlignmentCenter];
    [suitNameLable setTag:-1];
    [self.centerView addSubview:suitNameLable];
    
    HTUILabel *tixingLabel = [[HTUILabel alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height)];
    [tixingLabel setCenter:CGPointMake(160-(xfsmallImg.size.width/2.0), 63)];
    [tixingLabel setBackgroundColor:[UIColor clearColor]];
    [tixingLabel setTextColor:[UIColor whiteColor]];
    [tixingLabel setFont:fonttx];
    tixingLabel.text = showtixing;
    [tixingLabel setTextAlignment:NSTextAlignmentCenter];
    [tixingLabel setTag:-1];
    [self.centerView addSubview:tixingLabel];
    
    CGRect tixingLabelBundle = [tixingLabel frame];
    CGPoint centerText = [tixingLabel center];
    UIImageView *xfsmall = [[UIImageView alloc] initWithImage:xfsmallImg];
    
    [xfsmall setFrame:CGRectMake(0, 0, xfsmallImg.size.width, xfsmallImg.size.height)];
    [xfsmall setCenter:CGPointMake(centerText.x+(xfsmallImg.size.width+tixingLabelBundle.size.width)/2.0, centerText.y)];
    [self.centerView addSubview:xfsmall];
    
    [self addBuWeiButton];
    [self addSuitLabels];
   
    // Set parameters
    self.leftViewVisibleWidth = 200;
    self.rightViewVisibleWidth = 300;
    self.leftViewCenterX = 70;
    self.rightViewCenterX = 150;
    self.showDrawerMaxTrasitionX = 40;

    [self initialDrawerViewController];

//    [self reloadData];
//    [self removeRightMaskView];
//    UIImage *imgCenter = [self imageWithUIView:self.centerView];
//    UIImage *imgRight = [self imageWithUIView:self.rightView];
//    UIImageWriteToSavedPhotosAlbum([imgRight addImageView:imgCenter], nil, nil, nil);

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

- (void)addSuitLabels
{
    UIFont *fontscore = [UIFont fontWithName:@"STHeitiSC-Medium" size:16.0];
    HTSuit *nowS = [[HTSuitManager sharedManager] nowSuit];
    
    void (^addLabel)(NSString *,CGFloat,CGFloat);
    addLabel = ^(NSString *string,CGFloat x,CGFloat y)
    {
        CGSize size = [string sizeWithFont:fontscore];
        UILabel *lable = [[UILabel alloc] initWithFrame:CGRectMake(x, y, size.width, size.height)];
        [lable setBackgroundColor:[UIColor clearColor]];
        [lable setTextColor:[UIColor whiteColor]];
        [lable setFont:fontscore];
        lable.text = string;
        [lable setTextAlignment:NSTextAlignmentCenter];
        [self.centerView addSubview:lable];
    };
    addLabel([NSString descriptionWithInt:nowS.suitScores   baseString:@"装备分数"],115,350);
    
    int tz = 2;
    addLabel([NSString descriptionWithInt:nowS.mainProperty baseString:nowS.mainPropertyString],23,390-tz++);
    addLabel([NSString descriptionWithInt:nowS.bloodValue baseString:@"气\x20\x20\x20\x20\x20\x20\x20\x20血"],23,410-tz++);
    addLabel([NSString descriptionWithInt:nowS.baseAttackValue baseString:@"基础攻击"],23,430-tz++);
    addLabel([NSString descriptionWithInt:nowS.attackValue baseString:@"面板攻击"],23,450-tz++);
    addLabel([NSString descriptionWithDouble:nowS.mingzhongValue baseString:@"命\x20\x20\x20\x20\x20\x20\x20\x20中"],23,470-tz++);

    tz = 2;
    addLabel([NSString descriptionWithDouble:nowS.huixinValue baseString:@"会\x20\x20\x20\x20\x20\x20\x20\x20心"],173,390-tz++);
    addLabel([NSString descriptionWithDouble:nowS.huixiaoValue baseString:@"会心效果"],173,410-tz++);
    addLabel([NSString descriptionWithDouble:nowS.jiasuValue baseString:@"加\x20\x20\x20\x20\x20\x20\x20\x20速"],173,430-tz++);
    addLabel([NSString descriptionWithInt:nowS.pofangValue baseString:@"破\x20\x20\x20\x20\x20\x20\x20\x20防"],173,450-tz++);
    addLabel([NSString descriptionWithDouble:nowS.wushuangValue baseString:@"无\x20\x20\x20\x20\x20\x20\x20\x20双"],173,470-tz++);
}

- (void)addBuWeiButton
{
    __block UIImage *buWeiImg = nil;
    __block UIImage *buWeiSelected = nil;
    __block UIButton *buWeiBtn = nil;
    
    void (^buweiBtn)(NSString *,NSString *,CGFloat,CGFloat);
    buweiBtn = ^(NSString *img1,NSString *img2,CGFloat x,CGFloat y)
    {
        buWeiImg = [UIImage imageNamed:img1];
        buWeiSelected = [UIImage imageNamed:img2];
        buWeiBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [buWeiBtn setImage:buWeiImg forState:UIControlStateNormal];
        [buWeiBtn setImage:buWeiSelected forState:UIControlStateSelected];
        [buWeiBtn setFrame:CGRectMake(x, y, buWeiImg.size.width, buWeiImg.size.height)];
        [buWeiBtn addTarget:self action:@selector(buweiBtnPress:) forControlEvents:UIControlEventTouchUpInside];
        [self.centerView addSubview:buWeiBtn];
    };
    
    void (^otherBtn)(NSString *,NSString *,CGFloat,CGFloat);
    otherBtn = ^(NSString *img1,NSString *img2,CGFloat x,CGFloat y)
    {
        buWeiImg = [UIImage imageNamed:img1];
        buWeiSelected = [UIImage imageNamed:img2];
        buWeiBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [buWeiBtn setBackgroundColor:[UIColor clearColor]];
        [buWeiBtn setImage:buWeiImg forState:UIControlStateNormal];
        [buWeiBtn setImage:buWeiSelected forState:UIControlStateHighlighted];
        [buWeiBtn setFrame:CGRectMake(x, y, buWeiImg.size.width, buWeiImg.size.height)];
//        [buWeiBtn addTarget:self action:@selector(buweiBtnPress:) forControlEvents:UIControlEventTouchUpInside];
        [self.centerView addSubview:buWeiBtn];
    };
    

    buweiBtn(@"maozi",@"maozi-c",11,83);
    buweiBtn(@"shangyi",@"shangyi-c",11,132);
    buweiBtn(@"yaodai",@"yaodai-c",11,181);
    buweiBtn(@"xianglian",@"xianglian-c",11,242);
    buweiBtn(@"yaozhui",@"yaozhui-c",11,291);
    buweiBtn(@"xiazhuang",@"xiazhuang-c",265,132);
    buweiBtn(@"hushou",@"hushou-c",265,83);
    buweiBtn(@"xiezi",@"xiezi-c",265,181);
    buweiBtn(@"jiezhi",@"jiezhi-c",265,242);
    buweiBtn(@"jiezhi",@"jiezhi-c",265,291);
    buweiBtn(@"wuqi",@"wuqi-c",138,291);
    buweiBtn(@"anqi",@"anqi-c",188,291);

    otherBtn(@"jinglianall",@"jinglianall",11,346);
    otherBtn(@"xiaori",@"xiaori-c",281,346);
    otherBtn(@"qianghua",@"qianghua-c",130,502);
    otherBtn(@"duqu",@"duqu",79,514);
    otherBtn(@"baocun",@"baocun",202,514);
    otherBtn(@"fenxiang",@"fenxiang",254,522);
    otherBtn(@"chongzhi",@"chongzhi",28,522);

}

#pragma mark - Btn Press

- (void)menuBtnPress
{
#warning 测试用代码注意打开
    
    [self reloadData];
//    [self showLeftView];
}

- (void)previewBtnPress
{
    [self showRightView];
}

- (void)buweiBtnPress:(UIButton *)sender
{
    if (sender != [self currenctButton])
    {
        self.currenctButton.selected = NO;
        self.currenctButton = sender;
    }
    self.currenctButton.selected = YES;
    
    if (self.serachEquipView)
    {
        [self.serachEquipView removeFromSuperview];
        self.serachEquipView = nil;
    }
    self.serachEquipView = [[HTEquipSeachView alloc] initWithFrame:CGRectMake(0, 238, 320, 330)];
    
    [self.centerView addSubview:self.serachEquipView];
}

- (void)reloadData
{
    for (UIView* view in [self.centerView subviews])
    {
        if ([view isKindOfClass:UILabel.class] && [view tag] != -1)
        {
            [view removeFromSuperview];
        }
    }
    [self addSuitLabels];
}
@end
