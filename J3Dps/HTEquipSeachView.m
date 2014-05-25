//
//  HTEquipSeachView.m
//  J3Dps
//
//  Created by hadn't on 14-5-18.
//  Copyright (c) 2014年 hongtao5. All rights reserved.
//

#import "HTEquipSeachView.h"
#import "HTSuitManager.h"

@interface HTEquipSeachView()
@property (nonatomic,retain) NSArray *searchResult;
@end

@implementation HTEquipSeachView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.searchResult = nil;
        
        [self setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"zbsousuobg"]]];
        
        [self addBtn];
        
        self.searchView = [[UITextField alloc] initWithFrame:CGRectMake(60, 289-238, 181, 16)];
        self.searchView.returnKeyType = UIReturnKeyDone;
        [self.searchView setDelegate:self];
        [self.searchView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"searchf"]]];
        [self.searchView addTarget:self  action:@selector(searchTextChanged:)  forControlEvents:UIControlEventEditingChanged];
        [self addSubview:self.searchView];
        
        self.resultTable = [[UITableView alloc] initWithFrame:CGRectMake(50, 309-238, 220, 240) style:UITableViewStylePlain];
        [self.resultTable setBackgroundColor:[UIColor clearColor]];
        self.resultTable.dataSource = self;
        self.resultTable.delegate = self;
        self.resultTable.separatorColor = [UIColor clearColor];
        [self.resultTable touchesBegan:0 withEvent:0];
        [self addSubview:self.resultTable];
    }
    return self;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.searchView resignFirstResponder];
    return YES;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)addBtn
{
    __block UIImage *normalImg = nil;
    __block UIImage *selectImg = nil;
    __block UIButton *btn = nil;
    
    void (^addButton)(NSString *,NSString *,CGFloat,CGFloat,SEL,int);
    addButton = ^(NSString *img1,NSString *img2,CGFloat x,CGFloat y,SEL selector,int tag)
    {
        normalImg = [UIImage imageNamed:img1];
        selectImg = [UIImage imageNamed:img2];
        btn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [btn setBackgroundColor:[UIColor clearColor]];
        [btn setImage:normalImg forState:UIControlStateNormal];
        [btn setImage:selectImg forState:UIControlStateSelected];
        [btn setFrame:CGRectMake(x, y, normalImg.size.width, normalImg.size.height)];
        [btn addTarget:self action:selector forControlEvents:UIControlEventTouchUpInside];
        [btn setTag:tag];
        if (tag == HTALL)
        {
            self.currentCategoryBtn = btn;
            [btn setSelected:YES];
        }
        [self addSubview:btn];
    };
    
    addButton(@"bqquanbu",@"bqquanbu-c",6,248-238,@selector(categoryBtnPress:),HTALL);
    addButton(@"bqhuixin",@"bqhuixin-c",6,300-238,@selector(categoryBtnPress:),HTHuiXin);
    addButton(@"bqpofang",@"bqpofang-c",6,352-238,@selector(categoryBtnPress:),HTPoFang);
    addButton(@"bqjiasu",@"bqjiasu-c",6,404-238,@selector(categoryBtnPress:),HTJiaSu);
    addButton(@"bqmingzhong",@"bqmingzhong-c",6,456-238,@selector(categoryBtnPress:),HTMingZhong);
    addButton(@"bqwushuang",@"bqwushuang-c",6,508-238,@selector(categoryBtnPress:),HTWuShuang);

    addButton(@"searchb",@"searchb",242,289-238,@selector(searchBtnPress),HT_NO_TAG);
    addButton(@"close1",@"close1",295,246-238,@selector(closeBtnPress),HT_NO_TAG);
}

- (void)categoryBtnPress:(UIButton *)sender
{
    [self.searchView resignFirstResponder];

    if (sender != [self currentCategoryBtn])
    {
        self.currentCategoryBtn.selected = NO;
        self.currentCategoryBtn = sender;
    }
    self.currentCategoryBtn.selected = YES;
    
    if ([[HTSuitManager sharedManager] nowSuit].menpai < 0)
    {
        self.searchResult = [[HTEquipManager sharedManager] searchByBuWei:self.tag haveProperty:sender.tag];
    }
    else
    {
        self.searchResult = [[HTEquipManager sharedManager] searchByBuWei:self.tag
                                                                    xinfa:[[HTSuitManager sharedManager] nowSuit].menpai
                                                                      dps:[[HTSuitManager sharedManager] nowSuit].isDefaultXinFa
                                                             haveProperty:sender.tag];
    }
    
    [self.resultTable reloadData];
}

- (void)closeBtnPress
{
    [self removeFromSuperview];
}

- (void)searchBtnPress
{
    [self.searchView resignFirstResponder];
}

- (void)searchTextChanged:(UITextField *)sender
{
//    NSString *name  = [sender text];
    [self.resultTable reloadData];
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.searchResult count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"searchViewCell"];
    
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"searchViewCell"];
        cell.backgroundColor = [UIColor clearColor];
        UIImage *img = [UIImage imageNamed:@"xuanzhongbg"];
        cell.selectedBackgroundView = [[UIView alloc] initWithFrame:CGRectMake(cell.frame.origin.x, cell.frame.origin.y, img.size.width, img.size.height)];
        cell.selectedBackgroundView.backgroundColor = [UIColor clearColor];
        UIImageView *imgView = [[UIImageView alloc] initWithImage:img];
        [cell.selectedBackgroundView addSubview:imgView];
        cell.textLabel.highlightedTextColor = [UIColor whiteColor];
        cell.textLabel.textColor = [UIColor blackColor]
        ;
        
        cell.textLabel.font = [UIFont fontWithName:@"STHeitiSC-Medium" size:11.0];
    }
    cell.textLabel.text = ((HTEquip *)[self.searchResult objectAtIndex:indexPath.row]).name;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 19.0;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.searchView resignFirstResponder];
}

- (void)setTag:(NSInteger)tag
{
    [super setTag:tag];
    
    if ([[HTSuitManager sharedManager] nowSuit].menpai < 0)
    {
        self.searchResult = [[HTEquipManager sharedManager] searchByBuWei:tag];
    }
    else
    {
        self.searchResult = [[HTEquipManager sharedManager] searchByBuWei:tag
                                                                    xinfa:[[HTSuitManager sharedManager] nowSuit].menpai
                                                                      dps:[[HTSuitManager sharedManager] nowSuit].isDefaultXinFa];
    }
    [self.resultTable reloadData];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    HTEquip *nowSelect = [self.searchResult objectAtIndex:indexPath.row];
    
    HTSuit *now = [[HTSuitManager sharedManager] nowSuit];
    switch (self.tag)
    {
        case HTmaozi:
        {
            now.maozi = nowSelect;
        }
            break;
        case HThushou:
        {
            now.hushou = nowSelect;
        }
            break;
        case HTshangyi:
        {
            now.shangyi = nowSelect;
        }
            break;
        case HTxiazhuang:
        {
            now.xiazhuang = nowSelect;
        }
            break;
        case HTyaodai:
        {
            now.yaodai = nowSelect;
        }
            break;
        case HTxiezi:
        {
            now.xiezi = nowSelect;
        }
            break;
        case HTxianglian:
        {
            now.xianglian = nowSelect;
        }
            break;
        case HTjiezhi:
        {
            now.jiezhi1 = nowSelect;
        }
            break;
        case HTjiezhi2:
        {
            now.jiezhi2 = nowSelect;
        }
            break;
        case HTyaozhui:
        {
            now.yaozhui = nowSelect;
        }
            break;
        case HTwuqi:
        {
            now.wuqi = nowSelect;
        }
            break;
        case HTanqi:
        {
            now.anqi = nowSelect;
        }
            break;
        default:
            break;
    }
    
    [self.centerDelegate changedEquip];
}

@end
