//
//  HTAppDelegate.h
//  J3Dps
//
//  Created by hadn't on 14-5-5.
//  Copyright (c) 2014年 hongtao5. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WeiboSDK.h"
#import "WXApi.h"

@interface HTAppDelegate : UIResponder <UIApplicationDelegate,WeiboSDKDelegate,WXApiDelegate>

@property (strong, nonatomic) UIWindow *window;

@end
