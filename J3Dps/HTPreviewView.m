//
//  HTPreviewView.m
//  J3Dps
//
//  Created by hadn't on 14-5-15.
//  Copyright (c) 2014年 hongtao5. All rights reserved.
//

#import "HTPreviewView.h"

@implementation HTPreviewView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"youbianbg"]];
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
