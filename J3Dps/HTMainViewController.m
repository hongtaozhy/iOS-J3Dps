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
#import "UIImage+Draw.h"
#import "UIColor+Helper.h"

@interface HTMainViewController ()
@property (nonatomic,retain) UIButton *currenctButton;
@property (nonatomic,retain) HTEquipSeachView *serachEquipView;
@property (nonatomic,retain) UILabel *suitNameLable;
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

//    dispatch_time_t time = dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC);
    
    if ([[HTSuitManager sharedManager] nowSuit].xinfa == 0)
    {
//        dispatch_after(time, dispatch_get_main_queue(), ^{
            [[HTMenuView sharedView] changRowByCode:2 animated:YES];
//        });
        return;
    }
    if ([[HTSuitManager sharedManager] nowSuit].body == HTNoSelect)
    {
//        dispatch_after(time, dispatch_get_main_queue(), ^{
        [[HTMenuView sharedView] changRowByCode:1 animated:YES];
//        });
        return;
    }
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
    [menuBtn setTag:-1];
    [self.centerView addSubview:menuBtn];
    
    UIImage *previewImg = [UIImage imageNamed:@"zonglan"];
    UIButton *previewBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [previewBtn setBackgroundColor:[UIColor colorWithPatternImage:previewImg]];
    [previewBtn setFrame:CGRectMake(261, 25, previewImg.size.width, previewImg.size.height)];
    [previewBtn addTarget:self action:@selector(previewBtnPress) forControlEvents:UIControlEventTouchUpInside];
    [previewBtn setTag:-1];
    [self.centerView addSubview:previewBtn];
    
    UIImage *xftImg = [UIImage imageNamed:@"xinfatiao"];
    UIImageView *xztx = [[UIImageView alloc] initWithImage:xftImg];
    [xztx setFrame:CGRectMake(60.5, 58, xftImg.size.width, xftImg.size.height)];
    [self.centerView addSubview:xztx];
    
    NSString *showtixing =  [NSString stringWithFormat:@"%@·%@",[[HTSuitManager sharedManager] nowSuit].bodyString,[[HTSuitManager sharedManager] nowSuit].xinFaString];
    UIFont *fonttx = [UIFont fontWithName:@"STHeitiSC-Medium" size:19.0];
    CGSize size = [showtixing sizeWithFont:fonttx];
    
    self.suitNameLable = [[UILabel alloc] initWithFrame:CGRectMake(0, 39, 320, 60)];
    [self.suitNameLable setCenter:CGPointMake(160, 38)];
    [self.suitNameLable setBackgroundColor:[UIColor clearColor]];
    [self.suitNameLable setTextColor:[UIColor whiteColor]];
    [self.suitNameLable setFont:[UIFont fontWithName:@"STHeitiSC-Medium" size:20.0]];
    self.suitNameLable.text = [[[HTSuitManager sharedManager] nowSuit] suitName];
    [self.suitNameLable setTextAlignment:NSTextAlignmentCenter];
    [self.suitNameLable setTag:-1];
    [self.centerView addSubview:self.suitNameLable];
    
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


    [self reloadData];
    [self reloadEquipImg];
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
    
    void (^buweiBtn)(NSString *,NSString *,CGFloat,CGFloat,HTBuWei);
    buweiBtn = ^(NSString *img1,NSString *img2,CGFloat x,CGFloat y,HTBuWei buWeitag)
    {
        buWeiImg = [UIImage imageNamed:img1];
        buWeiSelected = [UIImage imageNamed:img2];
        buWeiBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [buWeiBtn setImage:buWeiImg forState:UIControlStateNormal];
        [buWeiBtn setImage:buWeiSelected forState:UIControlStateSelected];
        [buWeiBtn setFrame:CGRectMake(x, y, buWeiImg.size.width, buWeiImg.size.height)];
        [buWeiBtn addTarget:self action:@selector(buweiBtnPress:) forControlEvents:UIControlEventTouchUpInside];
        [buWeiBtn setTag:buWeitag];
        [self.centerView addSubview:buWeiBtn];
    };
    
    void (^otherBtn)(NSString *,NSString *,CGFloat,CGFloat,SEL);
    otherBtn = ^(NSString *img1,NSString *img2,CGFloat x,CGFloat y,SEL sel)
    {
        buWeiImg = [UIImage imageNamed:img1];
        buWeiSelected = [UIImage imageNamed:img2];
        buWeiBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [buWeiBtn setBackgroundColor:[UIColor clearColor]];
        [buWeiBtn setImage:buWeiImg forState:UIControlStateNormal];
        [buWeiBtn setImage:buWeiSelected forState:UIControlStateHighlighted];
        [buWeiBtn setFrame:CGRectMake(x, y, buWeiImg.size.width, buWeiImg.size.height)];
        [buWeiBtn setTag:-1];
        [buWeiBtn addTarget:self action:sel forControlEvents:UIControlEventTouchUpInside];
        [self.centerView addSubview:buWeiBtn];
    };
    

    buweiBtn(@"maozi",@"maozi-c",11,83,HTmaozi);
    buweiBtn(@"shangyi",@"shangyi-c",11,132,HTshangyi);
    buweiBtn(@"yaodai",@"yaodai-c",11,181,HTyaodai);
    buweiBtn(@"xianglian",@"xianglian-c",11,242,HTxianglian);
    buweiBtn(@"yaozhui",@"yaozhui-c",11,291,HTyaozhui);
    buweiBtn(@"xiazhuang",@"xiazhuang-c",265,132,HTxiazhuang);
    buweiBtn(@"hushou",@"hushou-c",265,83,HThushou);
    buweiBtn(@"xiezi",@"xiezi-c",265,181,HTxiezi);
    buweiBtn(@"jiezhi",@"jiezhi-c",265,242,HTjiezhi);
    buweiBtn(@"jiezhi",@"jiezhi-c",265,291,HTjiezhi2);
    buweiBtn(@"wuqi",@"wuqi-c",138,291,HTwuqi);
    buweiBtn(@"anqi",@"anqi-c",188,291,HTanqi);

    otherBtn(@"jinglianall",@"jinglianall",11,346,@selector(allJinglianBtnPress));
    otherBtn(@"xiaori",@"xiaori-c",281,346,@selector(allJinglianBtnPress));
    otherBtn(@"qianghua",@"qianghua-c",130,502,@selector(allJinglianBtnPress));
    otherBtn(@"duqu",@"duqu",79,514,@selector(loadBtnPress));
    otherBtn(@"baocun",@"baocun",202,514,@selector(saveBtnPress));
    otherBtn(@"fenxiang",@"fenxiang",254,522,@selector(shareBtnPress));
    otherBtn(@"chongzhi",@"chongzhi",28,522,@selector(clearBtnPress));

}

#pragma mark - Btn Press

- (void)shareBtnPress
{
    [self removeRightMaskView];
    UIImage *imgCenter = [UIImage imageWithUIView:self.centerView];
    UIImage *imgRight = [UIImage imageWithUIView:self.rightView];
    UIImage *imgShare = [imgRight addImageView:imgCenter];
    UIImageWriteToSavedPhotosAlbum(imgShare, nil, nil, nil);
    WBImageObject *image = [WBImageObject object];
    image.imageData = UIImagePNGRepresentation(imgShare);

    WBMessageObject *message = [WBMessageObject message];
    [message setText:[NSString stringWithFormat:@"剑网3配装器"]];
    [message setImageObject:image];
    WBSendMessageToWeiboRequest *request = [WBSendMessageToWeiboRequest requestWithMessage:message];
    [WeiboSDK sendRequest:request];
}

- (void)clearBtnPress
{
    [HTSuitManager sharedManager].nowSuit = nil;
    [self showLeftView];
    [[HTMenuView sharedView] changRowByCode:0 animated:NO];

}

- (void)allJinglianBtnPress
{
    
}

- (void)saveBtnPress
{
    UIAlertView *saveName = [[UIAlertView alloc] initWithTitle:@"请输入保存的套装名称为"
                                                       message:@"名称重复将会覆盖原有套装信息"
                                                      delegate:self
                                             cancelButtonTitle:@"取消"
                                             otherButtonTitles:@"确定", nil];
    [saveName setAlertViewStyle:UIAlertViewStylePlainTextInput];
    [[saveName textFieldAtIndex:0] setText:[[HTSuitManager sharedManager] nowSuit].suitName];
    [saveName show];
}

- (void)loadBtnPress
{
    [self showLeftView];
    [[HTMenuView sharedView] changRowByCode:4 animated:YES];

//    UIAlertView *loadName = [[UIAlertView alloc] initWithTitle:@"请输入读取套装名称"
//                                                       message:nil
//                                                      delegate:self
//                                             cancelButtonTitle:@"取消"
//                                             otherButtonTitles:@"确定", nil];
//    [loadName setTag:101];
//    [loadName setAlertViewStyle:UIAlertViewStylePlainTextInput];
//    [loadName show];
}

- (void)menuBtnPress
{
    [self showLeftView];
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
    
    if ([sender imageForState:UIControlStateNormal] == [self equipImg:[sender tag]])
    {
        [self drawTextInbgWithBuwei:sender.tag];
        return;
    }
    else
    {
        if (self.serachEquipView)
        {
            [self.serachEquipView removeFromSuperview];
            self.serachEquipView = nil;
        }
        self.serachEquipView = [[HTEquipSeachView alloc] initWithFrame:CGRectMake(0, 238, 320, 330)];
        [self.serachEquipView setTag:sender.tag];
        [self.serachEquipView setCenterDelegate:self];
        [self.centerView addSubview:self.serachEquipView];
    }
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

- (void)reloadEquipImg
{
    NSArray *views = [self.centerView subviews];

    for (UIView* view in views)
    {
        if ([view isKindOfClass:UIButton.class])
        {
            UIButton *btn = (UIButton *)view;
            UIImage *equipImg = [self equipImg:[btn tag]];
            if (equipImg)
            {
                [btn setImage:equipImg forState:UIControlStateNormal];
                [btn setImage:equipImg forState:UIControlStateHighlighted];
                [btn setImage:equipImg forState:UIControlStateSelected];
            }
        }
    }
}

- (UIImage *)equipImg:(HTBuWei)buwei
{
    
    HTSuit *now = [[HTSuitManager sharedManager] nowSuit];
    NSString *menpaiString = @"";
    switch (now.menpai)
    {
        case HTXX:
            menpaiString = @"qx";
            break;
        case HTCY:
            menpaiString = @"cy";
            break;
        case HTCJ:
            menpaiString = @"cj";
            break;
        case HTHH:
            menpaiString = @"wh";
            break;
        case HTHS:
            menpaiString = @"sl";
            break;
        case HTTC:
            menpaiString = @"tc";
            break;
        case HTWD:
            menpaiString = @"wd";
            break;
        case HTTM:
            menpaiString = @"tm";
            break;
        case HTMJ:
            menpaiString = @"mj";
            break;
        case HTGB:
            menpaiString = @"gb";
            break;
        default:
            menpaiString = @"fb";
            break;
    }
    
    switch (buwei)
    {
        case HTwuqi:
            if (now.wuqi)
            {
                switch (now.menpai)
                {
                    case HTXX:
                        if (now.isDefaultXinFa)
                            return [UIImage imageNamed:@"59888"];
                        else
                            return [UIImage imageNamed:@"59887"];
                        break;
                    case HTCY:
                        if (now.isDefaultXinFa)
                            return [UIImage imageNamed:@"59886"];
                        else
                            return [UIImage imageNamed:@"59885"];
                        break;
                    case HTCJ:
                        if (now.isDefaultXinFa)
                            return [UIImage imageNamed:@"59894"];
                        else
                            return [UIImage imageNamed:@"59893"];
                        break;
                    case HTHH:
                        if (now.isDefaultXinFa)
                            return [UIImage imageNamed:@"59881"];
                        else
                            return [UIImage imageNamed:@"59882"];
                        break;
                    case HTHS:
                        if (now.isDefaultXinFa)
                            return [UIImage imageNamed:@"59879"];
                        else
                            return [UIImage imageNamed:@"59880"];
                        break;
                    case HTTC:
                        if (now.isDefaultXinFa)
                            return [UIImage imageNamed:@"59883"];
                        else
                            return [UIImage imageNamed:@"59884"];
                        break;
                    case HTWD:
                        if (now.isDefaultXinFa)
                            return [UIImage imageNamed:@"59889"];
                        else
                            return [UIImage imageNamed:@"59890"];
                        break;
                    case HTTM:
                        if (now.isDefaultXinFa)
                            return [UIImage imageNamed:@"59892"];
                        else
                            return [UIImage imageNamed:@"59891"];
                        break;
                    case HTMJ:
                        if (now.isDefaultXinFa)
                            return [UIImage imageNamed:@"59897"];
                        else
                            return [UIImage imageNamed:@"59896"];
                        break;
                    case HTGB:
                        return [UIImage imageNamed:@"53544"];
                        break;
                    default:
                        break;
                }
                return nil;
            }
            break;
        case HTanqi:
            if (now.anqi)
                return [UIImage imageNamed:@"wpn_longdis26"];
            break;
        case HTyaozhui:
            if (now.yaozhui)
                return [UIImage imageNamed:@"tkt_pendant28"];
            break;
        case HTxianglian:
            if (now.xianglian)
                return [UIImage imageNamed:@"tkt_necklace17"];
            break;
        case HTjiezhi:
            if (now.jiezhi1)
                return [UIImage imageNamed:@"tkt_ring16"];
            break;
            
        case HTmaozi:
            if (now.maozi)
                return [UIImage imageNamed:[NSString stringWithFormat:@"def_%@_0408_01",menpaiString]];
            break;

        case HThushou:
            if (now.hushou)
                return [UIImage imageNamed:[NSString stringWithFormat:@"def_%@_0408_02",menpaiString]];
            break;

        case HTyaodai:
            if (now.yaodai)
                return [UIImage imageNamed:[NSString stringWithFormat:@"def_%@_0408_03",menpaiString]];
            break;

        case HTshangyi:
            if (now.shangyi)
                return [UIImage imageNamed:[NSString stringWithFormat:@"def_%@_0408_04",menpaiString]];
            break;

        case HTxiazhuang:
            if (now.xiazhuang)
                return [UIImage imageNamed:[NSString stringWithFormat:@"def_%@_0408_05",menpaiString]];
            break;

        case HTxiezi:
            if (now.xiezi)
                return [UIImage imageNamed:[NSString stringWithFormat:@"def_%@_0408_06",menpaiString]];
            break;

        case HTjiezhi2:
            if (now.jiezhi2)
                return [UIImage imageNamed:@"tkt_ring13"];
        default:
            break;
    }
    return nil;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.serachEquipView.searchView resignFirstResponder];
}

- (void)changedEquip
{
    [self.serachEquipView removeFromSuperview];
    [self reloadData];
    [self reloadEquipImg];
}

- (void)drawTextInbgWithBuwei:(HTBuWei)buwei
{
    if (buwei != HTmaozi || ![[HTSuitManager sharedManager] nowSuit].maozi)
    {
        return;
    }
    UIImage *bg = [UIImage imageNamed:@"bg4"];
    UIImageView *equipShow = [[UIImageView alloc] initWithFrame:CGRectMake(0,0,bg.size.width*2,bg.size.height*2)];
    [equipShow setBackgroundColor:[UIColor clearColor]];
//    [equipShow setImage:bg];
    [equipShow setContentMode:UIViewContentModeScaleToFill];
    NSString *showtixing = [[HTSuitManager sharedManager] nowSuit].maozi.name;
    UIFont *fonttx = [UIFont fontWithName:@"STHeitiSC-Medium" size:26.0];
    CGSize size = [showtixing sizeWithFont:fonttx];

    HTUILabel *tixingLabel = [[HTUILabel alloc] initWithFrame:CGRectMake(68*2, 100*2, size.width, size.height)];
    [tixingLabel setMiaobianColor:[UIColor blackColor]];
    [tixingLabel setBackgroundColor:[UIColor clearColor]];
    [tixingLabel setTextColor:RGBCOLOR(255, 50, 205)];
    [tixingLabel setFont:fonttx];
    tixingLabel.text = showtixing;
    [tixingLabel setTextAlignment:NSTextAlignmentCenter];
    [equipShow addSubview:tixingLabel];
    

    UIImage *watermarkedImage = [UIImage imageWithUIView:equipShow];
    UIImageWriteToSavedPhotosAlbum(watermarkedImage, nil, nil, nil);
    UIImageWriteToSavedPhotosAlbum(bg, nil, nil, nil);
//    [self.centerView setBackgroundColor:[UIColor clearColor]];
    UIImageView *bgView = [[UIImageView alloc] initWithFrame:self.centerView.frame];
    [bgView setImage:watermarkedImage];
    [bgView setContentMode:UIViewContentModeScaleToFill];
    [self.centerView addSubview:bgView];
}

#pragma mark - UIAlertViewDelegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString *name = [[alertView textFieldAtIndex:0] text];
    if (buttonIndex == 0)
    {
        return;
    }
    else
    {
        [self.suitNameLable setText:name];
        [[HTSuitManager sharedManager] saveNowSuitWithName:name];
    }
}
@end
