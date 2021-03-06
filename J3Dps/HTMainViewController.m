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
@property (nonatomic,retain) UIImageView *equipShowView;
@property (nonatomic,retain) UIImageView *zbGlKuangImg;
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
    
    if ([[HTSuitManager sharedManager] nowSuit].isNoSelectXinfa)
    {
        [[HTMenuView sharedView] changRowByCode:2 animated:YES];
        return;
    }
    if ([[HTSuitManager sharedManager] nowSuit].isNoSelectBody ||
        [[HTSuitManager sharedManager] nowSuit].isConflict)
    {
        [[HTMenuView sharedView] changRowByCode:1 animated:YES];
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
    
    UIImage *ghzhuangbeiImg = [UIImage imageNamed:@"ghzhuangbei"];
    UIButton *ghzhuangbeiBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [ghzhuangbeiBtn setBackgroundColor:[UIColor colorWithPatternImage:ghzhuangbeiImg]];
    [ghzhuangbeiBtn setFrame:CGRectMake(225, 110, ghzhuangbeiImg.size.width, ghzhuangbeiImg.size.height)];
    [ghzhuangbeiBtn addTarget:self action:@selector(changeEquipBtnPress) forControlEvents:UIControlEventTouchUpInside];
    [ghzhuangbeiBtn setTag:-1];
    [self.centerView addSubview:ghzhuangbeiBtn];
  
    
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
   
    UIImage *zbGlKuang = [UIImage imageNamed:@"zbkuang2"];
    self.zbGlKuangImg = [[UIImageView alloc] initWithImage:zbGlKuang];
    [self.zbGlKuangImg setHidden:YES];
    [self.centerView addSubview:self.zbGlKuangImg];
    
    self.equipShowView = [[UIImageView alloc] initWithFrame:self.centerView.frame];
    [self.equipShowView setBackgroundColor:[UIColor clearColor]];
    [self.equipShowView setContentMode:UIViewContentModeScaleToFill];
    [self.centerView addSubview:self.equipShowView];

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
    UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                  initWithTitle:@"快给小伙伴们看看你的配装方案吧！"
                                  delegate:self
                                  cancelButtonTitle:@"取消"
                                  destructiveButtonTitle:@"仅保存到本地相册"
                                  otherButtonTitles:@"分享到微博", @"分享给微信好友", @"分享至微信朋友圈",nil];
    actionSheet.actionSheetStyle = UIActionSheetStyleDefault;
    [actionSheet showInView:self.view];
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

- (void)changeEquipBtnPress
{
//    [self buweiBtnPress:self.currenctButton];
//    [self.zbGlKuangImg setHidden:YES];
    
    self.serachEquipView = [[HTEquipSeachView alloc] initWithFrame:CGRectMake(0, 238, 320, 330)];
    [self.serachEquipView setTag:self.currenctButton.tag];
    [self.serachEquipView setCenterDelegate:self];
    [self.centerView addSubview:self.serachEquipView];
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
    [self.equipShowView setImage:nil];
    
    if ([self equipImg:[sender tag]] != nil)
    {
        [self.zbGlKuangImg setFrame:[sender frame]];
        [self.zbGlKuangImg setHidden:NO];
        [self drawTextInbgWithBuwei:sender.tag];
        return;
    }
    else
    {
        [self.zbGlKuangImg setHidden:YES];

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
    [self drawTextInbgWithBuwei:[self.currenctButton tag]];
}

- (void)drawTextInbgWithBuwei:(HTBuWei)buwei
{
    HTEquip *equip = [[[HTSuitManager sharedManager] nowSuit] equipWithBuwei:buwei];
    if (!equip)
    {
        return;
    }
    UIImage *bg = [UIImage imageNamed:@"bg4"];
    UIImageView *equipShow = [[UIImageView alloc] initWithFrame:CGRectMake(0,0,bg.size.width*2,bg.size.height*2)];
    [equipShow setBackgroundColor:[UIColor clearColor]];
//    [equipShow setImage:bg];
    [equipShow setContentMode:UIViewContentModeScaleToFill];
    NSString *showtixing = [[equip.name componentsSeparatedByString:@"("] objectAtIndex:0];
    UIFont *fonttx = [UIFont fontWithName:@"STHeitiSC-Medium" size:26.0];
    CGSize size = [showtixing sizeWithFont:fonttx];

    CGFloat nowY = 100 * 2;
    HTUILabel *tixingLabel = [[HTUILabel alloc] initWithFrame:CGRectMake(68*2, nowY, size.width, size.height)];
    [tixingLabel setMiaobianColor:[UIColor blackColor]];
    [tixingLabel setBackgroundColor:[UIColor clearColor]];
    [tixingLabel setTextColor:RGBCOLOR(255, 50, 205)];
    [tixingLabel setFont:fonttx];
    tixingLabel.text = showtixing;
    [tixingLabel setTextAlignment:NSTextAlignmentCenter];
    [equipShow addSubview:tixingLabel];
    nowY += size.height;
    NSString *showtype = [[HTEquipManager sharedManager] typeName:equip.buWei];
    UIFont *fonttx2 = [UIFont fontWithName:@"STHeitiSC-Medium" size:20.0];
    CGSize size2 = [showtype sizeWithFont:fonttx2];

    
    nowY += 5;
    HTUILabel *typeLabel = [[HTUILabel alloc] initWithFrame:CGRectMake(68*2, nowY, size2.width, size2.height)];
    [typeLabel setMiaobianColor:[UIColor blackColor]];
    [typeLabel setBackgroundColor:[UIColor clearColor]];
    [typeLabel setTextColor:RGBCOLOR(255,255,255)];
    [typeLabel setFont:fonttx2];
    typeLabel.text = showtype;
    [typeLabel setTextAlignment:NSTextAlignmentCenter];
    [equipShow addSubview:typeLabel];
    nowY += size2.height;
    UIFont *fonttx3 = [UIFont fontWithName:@"STHeitiSC-Medium" size:24.0];
    nowY += 5;
    if (equip.tizhi > 0)
    {
        NSString *tizhi = [NSString stringWithFormat:@"体质+%d",(int)equip.tizhi];

        CGSize tizhi_size = [tizhi sizeWithFont:fonttx3];
        HTUILabel *tizhiLabel = [[HTUILabel alloc] initWithFrame:CGRectMake(68*2, nowY, tizhi_size.width, tizhi_size.height)];
        [tizhiLabel setMiaobianColor:[UIColor blackColor]];
        [tizhiLabel setBackgroundColor:[UIColor clearColor]];
        [tizhiLabel setTextColor:RGBCOLOR(255, 255, 255)];
        [tizhiLabel setFont:fonttx3];
        tizhiLabel.text = tizhi;
        [tizhiLabel setTextAlignment:NSTextAlignmentCenter];
        [equipShow addSubview:tizhiLabel];
        nowY += tizhi_size.height;
    }
    
    if (equip.gengu > 0)
    {
        NSString *gengu = [NSString stringWithFormat:@"根骨+%d",(int)equip.gengu];
        
        CGSize gengu_size = [gengu sizeWithFont:fonttx3];
        
        HTUILabel *genguLabel = [[HTUILabel alloc] initWithFrame:CGRectMake(68*2, nowY, gengu_size.width, gengu_size.height)];
        [genguLabel setMiaobianColor:[UIColor blackColor]];
        [genguLabel setBackgroundColor:[UIColor clearColor]];
        [genguLabel setTextColor:RGBCOLOR(255, 255, 255)];
        [genguLabel setFont:fonttx3];
        genguLabel.text = gengu;
        [genguLabel setTextAlignment:NSTextAlignmentCenter];
        [equipShow addSubview:genguLabel];
        nowY += gengu_size.height;
    }
    
    if (equip.lidao > 0)
    {
        NSString *gengu = [NSString stringWithFormat:@"力道+%d",(int)equip.lidao];
        
        CGSize gengu_size = [gengu sizeWithFont:fonttx3];
        
        HTUILabel *genguLabel = [[HTUILabel alloc] initWithFrame:CGRectMake(68*2, nowY, gengu_size.width, gengu_size.height)];
        [genguLabel setMiaobianColor:[UIColor blackColor]];
        [genguLabel setBackgroundColor:[UIColor clearColor]];
        [genguLabel setTextColor:RGBCOLOR(255, 255, 255)];
        [genguLabel setFont:fonttx3];
        genguLabel.text = gengu;
        [genguLabel setTextAlignment:NSTextAlignmentCenter];
        [equipShow addSubview:genguLabel];
        nowY += gengu_size.height;
    }

    if (equip.yuanqi > 0)
    {
        NSString *gengu = [NSString stringWithFormat:@"元气+%d",(int)equip.yuanqi];
        
        CGSize gengu_size = [gengu sizeWithFont:fonttx3];
        
        HTUILabel *genguLabel = [[HTUILabel alloc] initWithFrame:CGRectMake(68*2, nowY, gengu_size.width, gengu_size.height)];
        [genguLabel setMiaobianColor:[UIColor blackColor]];
        [genguLabel setBackgroundColor:[UIColor clearColor]];
        [genguLabel setTextColor:RGBCOLOR(255, 255, 255)];
        [genguLabel setFont:fonttx3];
        genguLabel.text = gengu;
        [genguLabel setTextAlignment:NSTextAlignmentCenter];
        [equipShow addSubview:genguLabel];
        nowY += gengu_size.height;
    }
    if (equip.shenfa > 0)
    {
        NSString *gengu = [NSString stringWithFormat:@"身法+%d",(int)equip.shenfa];
        
        CGSize gengu_size = [gengu sizeWithFont:fonttx3];
        
        HTUILabel *genguLabel = [[HTUILabel alloc] initWithFrame:CGRectMake(68*2, nowY, gengu_size.width, gengu_size.height)];
        [genguLabel setMiaobianColor:[UIColor blackColor]];
        [genguLabel setBackgroundColor:[UIColor clearColor]];
        [genguLabel setTextColor:RGBCOLOR(255, 255, 255)];
        [genguLabel setFont:fonttx3];
        genguLabel.text = gengu;
        [genguLabel setTextAlignment:NSTextAlignmentCenter];
        [equipShow addSubview:genguLabel];
        nowY += gengu_size.height;
    }
    if (equip.gongji > 0)
    {
        NSString *property = [NSString stringWithFormat:@"攻击提高%d",(int)equip.gongji];
        CGSize propertySize = [property sizeWithFont:fonttx3];
        
        HTUILabel *propertyLabel = [[HTUILabel alloc] initWithFrame:CGRectMake(68*2, nowY, propertySize.width, propertySize.height)];
        [propertyLabel setMiaobianColor:[UIColor blackColor]];
        [propertyLabel setBackgroundColor:[UIColor clearColor]];
        [propertyLabel setTextColor:[UIColor greenColor]];
        [propertyLabel setFont:fonttx3];
        propertyLabel.text = property;
        [propertyLabel setTextAlignment:NSTextAlignmentCenter];
        [equipShow addSubview:propertyLabel];
        nowY += propertySize.height;
    }
    if (equip.zhiliaoliang > 0)
    {
        NSString *property = [NSString stringWithFormat:@"治疗成效提高%d",(int)equip.zhiliaoliang];
        CGSize propertySize = [property sizeWithFont:fonttx3];
        
        HTUILabel *propertyLabel = [[HTUILabel alloc] initWithFrame:CGRectMake(68*2, nowY, propertySize.width, propertySize.height)];
        [propertyLabel setMiaobianColor:[UIColor blackColor]];
        [propertyLabel setBackgroundColor:[UIColor clearColor]];
        [propertyLabel setTextColor:[UIColor greenColor]];
        [propertyLabel setFont:fonttx3];
        propertyLabel.text = property;
        [propertyLabel setTextAlignment:NSTextAlignmentCenter];
        [equipShow addSubview:propertyLabel];
        nowY += propertySize.height;
    }
    if (equip.huixin > 0)
    {
        NSString *property = [NSString stringWithFormat:@"会心等级提高%d",(int)equip.huixin];
        CGSize propertySize = [property sizeWithFont:fonttx3];
        
        HTUILabel *propertyLabel = [[HTUILabel alloc] initWithFrame:CGRectMake(68*2, nowY, propertySize.width, propertySize.height)];
        [propertyLabel setMiaobianColor:[UIColor blackColor]];
        [propertyLabel setBackgroundColor:[UIColor clearColor]];
        [propertyLabel setTextColor:[UIColor greenColor]];
        [propertyLabel setFont:fonttx3];
        propertyLabel.text = property;
        [propertyLabel setTextAlignment:NSTextAlignmentCenter];
        [equipShow addSubview:propertyLabel];
        nowY += propertySize.height;
    }
    if (equip.huixiao > 0)
    {
        NSString *property = [NSString stringWithFormat:@"会心效果等级提高%d",(int)equip.huixiao];
        CGSize propertySize = [property sizeWithFont:fonttx3];
        
        HTUILabel *propertyLabel = [[HTUILabel alloc] initWithFrame:CGRectMake(68*2, nowY, propertySize.width, propertySize.height)];
        [propertyLabel setMiaobianColor:[UIColor blackColor]];
        [propertyLabel setBackgroundColor:[UIColor clearColor]];
        [propertyLabel setTextColor:[UIColor greenColor]];
        [propertyLabel setFont:fonttx3];
        propertyLabel.text = property;
        [propertyLabel setTextAlignment:NSTextAlignmentCenter];
        [equipShow addSubview:propertyLabel];
        nowY += propertySize.height;
    }
    if (equip.pofang > 0)
    {
        NSString *property = [NSString stringWithFormat:@"破防提高%d",(int)equip.pofang];
        CGSize propertySize = [property sizeWithFont:fonttx3];
        
        HTUILabel *propertyLabel = [[HTUILabel alloc] initWithFrame:CGRectMake(68*2, nowY, propertySize.width, propertySize.height)];
        [propertyLabel setMiaobianColor:[UIColor blackColor]];
        [propertyLabel setBackgroundColor:[UIColor clearColor]];
        [propertyLabel setTextColor:[UIColor greenColor]];
        [propertyLabel setFont:fonttx3];
        propertyLabel.text = property;
        [propertyLabel setTextAlignment:NSTextAlignmentCenter];
        [equipShow addSubview:propertyLabel];
        nowY += propertySize.height;
    }
    if (equip.jiasu > 0)
    {
        NSString *property = [NSString stringWithFormat:@"加速等级提高%d",(int)equip.jiasu];
        CGSize propertySize = [property sizeWithFont:fonttx3];
        
        HTUILabel *propertyLabel = [[HTUILabel alloc] initWithFrame:CGRectMake(68*2, nowY, propertySize.width, propertySize.height)];
        [propertyLabel setMiaobianColor:[UIColor blackColor]];
        [propertyLabel setBackgroundColor:[UIColor clearColor]];
        [propertyLabel setTextColor:[UIColor greenColor]];
        [propertyLabel setFont:fonttx3];
        propertyLabel.text = property;
        [propertyLabel setTextAlignment:NSTextAlignmentCenter];
        [equipShow addSubview:propertyLabel];
        nowY += propertySize.height;
    }
    if (equip.mingzhong > 0)
    {
        NSString *property = [NSString stringWithFormat:@"命中等级提高%d",(int)equip.mingzhong];
        CGSize propertySize = [property sizeWithFont:fonttx3];
        
        HTUILabel *propertyLabel = [[HTUILabel alloc] initWithFrame:CGRectMake(68*2, nowY, propertySize.width, propertySize.height)];
        [propertyLabel setMiaobianColor:[UIColor blackColor]];
        [propertyLabel setBackgroundColor:[UIColor clearColor]];
        [propertyLabel setTextColor:[UIColor greenColor]];
        [propertyLabel setFont:fonttx3];
        propertyLabel.text = property;
        [propertyLabel setTextAlignment:NSTextAlignmentCenter];
        [equipShow addSubview:propertyLabel];
        nowY += propertySize.height;
    }
    if (equip.wushuang > 0)
    {
        NSString *property = [NSString stringWithFormat:@"无双等级提高%d",(int)equip.wushuang];
        CGSize propertySize = [property sizeWithFont:fonttx3];
        
        HTUILabel *propertyLabel = [[HTUILabel alloc] initWithFrame:CGRectMake(68*2, nowY, propertySize.width, propertySize.height)];
        [propertyLabel setMiaobianColor:[UIColor blackColor]];
        [propertyLabel setBackgroundColor:[UIColor clearColor]];
        [propertyLabel setTextColor:[UIColor greenColor]];
        [propertyLabel setFont:fonttx3];
        propertyLabel.text = property;
        [propertyLabel setTextAlignment:NSTextAlignmentCenter];
        [equipShow addSubview:propertyLabel];
        nowY += propertySize.height;
    }
    
    nowY += 2;
    if (equip.quality > 0)
    {
        NSString *property = [NSString stringWithFormat:@"品质等级%d",(int)equip.quality];
        CGSize propertySize = [property sizeWithFont:fonttx3];
        
        HTUILabel *propertyLabel = [[HTUILabel alloc] initWithFrame:CGRectMake(68*2, nowY, propertySize.width, propertySize.height)];
        [propertyLabel setMiaobianColor:[UIColor blackColor]];
        [propertyLabel setBackgroundColor:[UIColor clearColor]];
        [propertyLabel setTextColor:[UIColor yellowColor]];
        [propertyLabel setFont:fonttx3];
        propertyLabel.text = property;
        [propertyLabel setTextAlignment:NSTextAlignmentCenter];
        [equipShow addSubview:propertyLabel];
        nowY += propertySize.height;
    }
    nowY += 2;
    if (equip.score > 0)
    {
        NSString *property = [NSString stringWithFormat:@"装备分数%d",(int)equip.score];
        CGSize propertySize = [property sizeWithFont:fonttx3];
        
        HTUILabel *propertyLabel = [[HTUILabel alloc] initWithFrame:CGRectMake(68*2, nowY, propertySize.width, propertySize.height)];
        [propertyLabel setMiaobianColor:[UIColor blackColor]];
        [propertyLabel setBackgroundColor:[UIColor clearColor]];
        [propertyLabel setTextColor:[UIColor yellowColor]];
        [propertyLabel setFont:fonttx3];
        propertyLabel.text = property;
        [propertyLabel setTextAlignment:NSTextAlignmentCenter];
        [equipShow addSubview:propertyLabel];
        nowY += propertySize.height;
    }
    nowY += 2;
    if (equip.diaoluo)
    {
        NSString *property = [NSString stringWithFormat:@"出处：%@",equip.diaoluo];
        CGSize propertySize = [property sizeWithFont:fonttx2];
        
        HTUILabel *propertyLabel = [[HTUILabel alloc] initWithFrame:CGRectMake(68*2, nowY, propertySize.width, propertySize.height)];
        [propertyLabel setMiaobianColor:[UIColor blackColor]];
        [propertyLabel setBackgroundColor:[UIColor clearColor]];
        [propertyLabel setTextColor:[UIColor whiteColor]];
        [propertyLabel setFont:fonttx2];
        propertyLabel.text = property;
        [propertyLabel setTextAlignment:NSTextAlignmentCenter];
        [equipShow addSubview:propertyLabel];
        nowY += propertySize.height;
    }
    UIImage *watermarkedImage = [UIImage imageWithUIView:equipShow];
//    [self.centerView setBackgroundColor:[UIColor clearColor]];
    [self.equipShowView setImage:watermarkedImage];
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

#pragma mark - UIActionSheetDelegate

- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    UIImage *imgShare = nil;
    if (buttonIndex >= 0 && buttonIndex <= 3)
    {
        [self removeRightMaskView];
        UIImage *imgCenter = [UIImage imageWithUIView:self.centerView];
        UIImage *imgRight = [UIImage imageWithUIView:self.rightView];
        imgShare = [imgRight addImageView:imgCenter];
        UIImageWriteToSavedPhotosAlbum(imgShare, nil, nil, nil);
    }
    
    if (buttonIndex == 1)
    {
        //微博
        WBImageObject *image = [WBImageObject object];
        image.imageData = UIImagePNGRepresentation(imgShare);

        WBMessageObject *message = [WBMessageObject message];
        [message setText:[NSString stringWithFormat:@"剑网3配装器"]];
        [message setImageObject:image];
        WBSendMessageToWeiboRequest *request = [WBSendMessageToWeiboRequest requestWithMessage:message];
        [WeiboSDK sendRequest:request];
    }
    else if (buttonIndex == 2)
    {
        //微信好友
        WXMediaMessage *message = [WXMediaMessage message];
        message.title = @"剑网3配装器";
        message.description = @"剑3配装器下载地址 http://www.hongtaozhy.com ";
        [message setThumbImage:[UIImage imageNamed:@"59885"]];
        
        WXImageObject *ext = [WXImageObject object];
        ext.imageData = UIImagePNGRepresentation(imgShare);
        
        message.mediaObject = ext;
        
        SendMessageToWXReq* req = [[SendMessageToWXReq alloc] init];
        req.bText = NO;
        req.message = message;
        req.scene = WXSceneSession;
        
        [WXApi sendReq:req];
    }
    else if(buttonIndex == 3)
    {
        //微信朋友圈
        WXMediaMessage *message = [WXMediaMessage message];
        message.title = @"剑网3配装器";
        message.description = @"剑3配装器下载地址 http://www.hongtaozhy.com ";
        [message setThumbImage:[UIImage imageNamed:@"59885"]];
        
        WXImageObject *ext = [WXImageObject object];
        ext.imageData = UIImagePNGRepresentation(imgShare);
        
        message.mediaObject = ext;
        
        SendMessageToWXReq* req = [[SendMessageToWXReq alloc] init];
        req.bText = NO;
        req.message = message;
        req.scene = WXSceneTimeline;
        
        [WXApi sendReq:req];
    }
    else if(buttonIndex == 4)
    {
        //取消
    }
}
@end
