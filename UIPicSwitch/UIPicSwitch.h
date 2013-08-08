//
//  UIPicSwitch.h
//  xiguateng
//
//  Created by apple on 13-2-20.
//  Copyright (c) 2013年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol UIPicSwitchDelegate <NSObject>

-(void)UIPicSwitchChange:(BOOL)on;

@end

@interface UIPicSwitch : UIScrollView{
    id<UIPicSwitchDelegate> pdelegate;
}

@property(nonatomic,assign)BOOL on;

- (id)initWithFrame:(CGRect)frame switchImage:(UIImage*)switchImage delegate:(id<UIPicSwitchDelegate>)delegate;

@end
