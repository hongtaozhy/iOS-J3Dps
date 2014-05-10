//
//  HTMainViewController.m
//  J3Dps
//
//  Created by hadn't on 14-5-10.
//  Copyright (c) 2014年 hongtao5. All rights reserved.
//

#import "HTMainViewController.h"

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
    self.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    self.leftView.backgroundColor = [UIColor clearColor];
    
    // Create right view
    self.rightView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    self.rightView.backgroundColor = [UIColor clearColor];
    
    // Create center view
    
    self.centerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    self.centerView.backgroundColor = [UIColor clearColor];

    
    // Set parameters
    self.leftViewVisibleWidth = 120;
    self.rightViewVisibleWidth = 220;
    self.leftViewCenterX = 70;
    self.rightViewCenterX = 150;
    self.showDrawerMaxTrasitionX = 40;

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
