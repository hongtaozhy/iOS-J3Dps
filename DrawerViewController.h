//
//  DrawerViewController.h
//  SmartHome
//
//  Created by Zhao yang on 8/2/13.
//  Copyright (c) 2013 zhaoyang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface DrawerViewController : UIViewController<UIScrollViewDelegate>

@property (nonatomic) CGFloat leftViewCenterX;
@property (nonatomic) CGFloat rightViewCenterX;
@property (nonatomic) CGFloat showDrawerMaxTrasitionX;
@property (nonatomic) CGFloat leftViewVisibleWidth;
@property (nonatomic) CGFloat rightViewVisibleWidth;
@property (nonatomic) BOOL panFromScrollViewFirstPage;
@property (nonatomic) BOOL panFromScrollViewLastPage;
@property (strong, nonatomic, readonly) UIView *mainView;
@property (strong, nonatomic) UIView *centerView;
@property (strong, nonatomic) UIView *leftView;
@property (strong, nonatomic) UIView *rightView;
@property (strong, nonatomic) UIScrollView *scrollView;

- (void)showRightView;
- (void)showCenterView:(BOOL)animate;
- (void)showLeftView;

- (void)disableGestureForDrawerView;
- (void)enableGestureForDrawerView;

- (void)initialDrawerViewController;

@end
