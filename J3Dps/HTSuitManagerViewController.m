//
//  HTSuitManagerViewController.m
//  J3Dps
//
//  Created by hadn't on 14-5-25.
//  Copyright (c) 2014年 hongtao5. All rights reserved.
//

#import "HTSuitManagerViewController.h"

@interface HTSuitManagerViewController ()
@property (nonatomic,retain) UITableView *table;
@end

@implementation HTSuitManagerViewController

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
    
    self.leftView = [HTMenuView sharedView];
    self.centerView = [[HTBaseView alloc] initWithFrame:CGRectMake(0, 0, 320, 568)];
    self.centerView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg1"]];
    
    self.table = [[UITableView alloc] initWithFrame:self.centerView.frame];
    [self.table setDelegate:self];
    [self.table setDataSource:self];
    [self.centerView addSubview:self.table];
    
    self.leftViewVisibleWidth = 200;
//    self.rightViewVisibleWidth = 120;
    self.leftViewCenterX = 70;
//    self.rightViewCenterX = 150;
    self.showDrawerMaxTrasitionX = 40;
    
    [self initialDrawerViewController];
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

#pragma mark - UITableViewDelegate && UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[[[HTSuitManager sharedManager] allSuit] allKeys] count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"suitnames"];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"suitnames"];
    }
    cell.textLabel.text = [[[[HTSuitManager sharedManager] allSuit] allKeys] objectAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *name = [[[tableView cellForRowAtIndexPath:indexPath] textLabel] text];
    [[HTSuitManager sharedManager] loadSuitWithName:name];
    
    [self showLeftView];
    [[HTMenuView sharedView] changRowByCode:0];
}

@end
