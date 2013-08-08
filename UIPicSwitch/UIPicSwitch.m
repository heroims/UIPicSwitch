//
//  UIPicSwitch.m
//  xiguateng
//
//  Created by apple on 13-2-20.
//  Copyright (c) 2013年 apple. All rights reserved.
//

#import "UIPicSwitch.h"

@implementation UIPicSwitch

- (id)initWithFrame:(CGRect)frame switchImage:(UIImage*)switchImage delegate:(id<UIPicSwitchDelegate>)delegate
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setShowsHorizontalScrollIndicator:NO];
        [self setShowsVerticalScrollIndicator:NO];
        [self setScrollEnabled:YES];
        [self setPagingEnabled:YES];
        [self setBounces:NO];
        [self setBackgroundColor:[UIColor clearColor]];
        [self setContentSize:CGSizeMake(frame.size.width*2, frame.size.height)];
        
        pdelegate=delegate;
        UIImageView *bgImg=[[UIImageView alloc] initWithImage:switchImage];
        bgImg.frame=CGRectMake(0, 0, frame.size.width*2, frame.size.height);
        [self addSubview:bgImg];
        bgImg.userInteractionEnabled=YES;
        UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(bgImgClick:)];
        [bgImg addGestureRecognizer:tap];
        [tap release];
        [bgImg release];
        // Initialization code
    }
    return self;
}

-(void)bgImgClick:(id)sender{
    if ((_on=!_on)) {
        [self setContentOffset:CGPointMake(self.frame.size.width, 0) animated:YES];
    }
    else{
        [self setContentOffset:CGPointMake(0, 0) animated:YES];
    }
    [pdelegate UIPicSwitchChange:_on];
}

- (void)setOn:(BOOL)on {
    _on=on;
    if (_on) {
        [self setContentOffset:CGPointMake(self.frame.size.width, 0) animated:YES];
    }
    else{
        [self setContentOffset:CGPointMake(0, 0) animated:YES];
    }
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
