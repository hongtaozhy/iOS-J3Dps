//
//  HTEquipSeachView.m
//  J3Dps
//
//  Created by hadn't on 14-5-18.
//  Copyright (c) 2014年 hongtao5. All rights reserved.
//

#import "HTEquipSeachView.h"

@implementation HTEquipSeachView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"zbsousuobg"]]];
        
        [self addBtn];
        
        self.searchView = [[UITextField alloc] initWithFrame:CGRectMake(60, 289-238, 181, 16)];
        self.searchView.returnKeyType = UIReturnKeyDone;
        [self.searchView setDelegate:self];
        [self.searchView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"searchf"]]];
        [self addSubview:self.searchView];
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
    __block __weak UIImage *normalImg = nil;
    __block __weak UIImage *selectImg = nil;
    __block __weak UIButton *btn = nil;
    
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
}

- (void)closeBtnPress
{
    [self removeFromSuperview];
}

- (void)searchBtnPress
{
    [self.searchView resignFirstResponder];
}
@end
