//
//  HTAboutUsViewController.m
//  J3Dps
//
//  Created by hadn't on 14-6-1.
//  Copyright (c) 2014年 hongtao5. All rights reserved.
//

#import "HTAboutUsViewController.h"

@interface HTAboutUsViewController ()

@end

@implementation HTAboutUsViewController

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
    // Create right view
    //    self.rightView = [HTMenuView sharedView];
    
    // Create center view
    self.centerView = [[HTBaseView alloc] initWithFrame:CGRectMake(0, 0, 320, 568)];
    self.centerView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"guanyu"]];
    // Set parameters
    self.leftViewVisibleWidth = 200;
    self.rightViewVisibleWidth = 120;
    self.leftViewCenterX = 70;
    self.rightViewCenterX = 150;
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

@end
