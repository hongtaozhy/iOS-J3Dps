//
//  HTMenuView.m
//  J3Dps
//
//  Created by hadn't on 14-5-10.
//  Copyright (c) 2014年 hongtao5. All rights reserved.
//

#import "HTMenuView.h"
#import "UIDevice+Extension.h"
#import "HTBodySelectViewController.h"

static HTMenuView *__MenuView = NULL;

@interface HTMenuView()
@property (nonatomic,retain) NSArray *menuList;
@end

@implementation HTMenuView

+ (instancetype)sharedView
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        __MenuView = [[self alloc] initMenu];
    });
    return __MenuView;
}

- (instancetype)initMenu
{
    NSInteger barHeight;
    if([UIDevice systemVersionIsMoreThanOrEuqal7])
    {
        barHeight = 0;
    }
    else
    {
        barHeight = -20;
    }
    
    self = [super initWithFrame:CGRectMake(0, barHeight, 320, 568)];
    if (self) {
        
        self.menuList = @[@"配装界面",@"体型选择",@"门派选择",@"偏好设置",@"配装管理",@"功能介绍",@"授权管理",@"意见反馈",@"关于我们"];
        
        if ([UIDevice systemVersionIsMoreThanOrEuqal7])
        {
            [self setSeparatorInset:UIEdgeInsetsMake(0,0,0,0)];
        }
        
        self.tableHeaderView  = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 20)];
//        self.tableHeaderView.backgroundColor = [UIColor greenColor];
        self.dataSource = self;
        self.delegate = self;
        
        self.backgroundColor = [UIColor colorWithRed:19.0/255.0 green:35.0/255.0 blue:31.0/255.0 alpha:1];
//        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"leftbg"]];
        self.separatorColor = [UIColor colorWithRed:36.0/255.0 green:70.0/255.0 blue:42.0/255.0 alpha:1];
    }
    return self;
}

- (void)changRowByCode:(NSInteger)index animated:(BOOL)animated
{
    NSIndexPath *selectedIndexPath = [NSIndexPath indexPathForRow:index inSection:0];
    [self selectRowAtIndexPath:selectedIndexPath animated:NO scrollPosition:UITableViewScrollPositionNone];
    
    [[self centerDelegate] changedViewContorller:index animated:animated];

}
#pragma mark - TableView Methods


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.menuList.count; // or self.items.count;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self dequeueReusableCellWithIdentifier:@"menuViewCell"];
    
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"menuViewCell"];
        cell.backgroundColor = [UIColor colorWithRed:19.0/255.0 green:35.0/255.0 blue:31.0/255.0 alpha:1];
        cell.selectedBackgroundView = [[UIView alloc] initWithFrame:cell.frame] ;
        cell.selectedBackgroundView.backgroundColor = [UIColor colorWithRed:15.0/255.0 green:28.0/255.0 blue:24.0/255.0 alpha:1];
        cell.textLabel.textColor = [UIColor colorWithRed:211.0/255.0 green:213.0/255.0 blue:197.0/255.0 alpha:1];

        cell.textLabel.font = [UIFont fontWithName:@"STHeitiSC-Medium" size:16.0];
    }
    
    [cell.imageView setImage:[UIImage imageNamed:[self.menuList objectAtIndex:indexPath.row]]];
    cell.textLabel.text = [self.menuList objectAtIndex:indexPath.row];

    return cell;
}

- (CGFloat)rowHeight
{
    return 44.0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [[self centerDelegate] changedViewContorller:indexPath.row animated:YES];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

#pragma mark - UINavigationControllerDelegate

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
//    if (animated)
//    {
//        self.canAnimated = NO;
//    }
}

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
//    if (animated)
//    {
//        self.canAnimated = YES;
//    }
}

@end
