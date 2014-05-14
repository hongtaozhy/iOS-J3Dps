//
//  HTBaseView.m
//  J3Dps
//
//  Created by hadn't on 14-5-13.
//  Copyright (c) 2014年 hongtao5. All rights reserved.
//

#import "HTBaseView.h"
#import "UIDevice+Extension.h"

@implementation HTBaseView

- (id)initWithFrame:(CGRect)frame
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
    frame.origin.y += barHeight;
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
