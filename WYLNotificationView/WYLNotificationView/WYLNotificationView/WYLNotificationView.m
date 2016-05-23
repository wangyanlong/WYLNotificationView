//
//  WYLNotificationView.m
//  WYLNotificationView
//
//  Created by 王老师 on 15/12/23.
//  Copyright © 2015年 wyl. All rights reserved.
//

#import "WYLNotificationView.h"

@implementation WYLNotificationView

- (instancetype)init{
    
    self = [super init];
    
    if (self) {
        self.tag = 20000;
        self.tusiHidden = YES;
    }
    
    return self;
}

/**
 *  检查是否隐藏吐司view
 */
- (void)checkHidden{
    
    if (self.tusiHidden) {
        [self closeSelf];
    }
    
}

/**
 *  创建吐司
 */
- (void)createTuSi{
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:self.duration target:self selector:@selector(checkHidden) userInfo:nil repeats:YES];
    
    UILabel *showLabel = nil;
    showLabel = (UILabel *)[self.window viewWithTag:10000];
    
    self.frame = CGRectMake(0, self.height*-1, self.window.frame.size.width, self.height);
    
    showLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 20, self.frame.size.width, self.frame.size.height-20)];
    
    showLabel.tag = 10000;
    
    showLabel.textAlignment = NSTextAlignmentCenter;
    
    showLabel.text = self.tusiStr;
    showLabel.textColor = [UIColor colorWithRed:68.0f/255.0f green:68.0f/255.0f blue:68.0f/255.0f alpha:1.00f];
    
    if (self.font) {
        showLabel.font = self.font;
    }
    
    [self addSubview:showLabel];
    
    if (self.color) {
        self.backgroundColor = showLabel.backgroundColor = self.color;
    }else{
        self.backgroundColor = showLabel.backgroundColor = [UIColor colorWithRed:197.0f/255.0f green:229.0f/255.0f blue:169.0f/255.0f alpha:1.00f];
    }
    
    [self.window addSubview:self];
    
    [self.window bringSubviewToFront:self];
    
    [self showSelf];

    
}

/**
 *  让吐司消失的方法
 */
- (void)removeSelf{
    [self removeFromSuperview];
    [self.timer invalidate];
    self.timer = nil;
}

/**
 *  如果多次触发,保持在屏幕上方的方法
 */
- (void)keepSelf{
    
    UILabel *showLabel = nil;
    showLabel = (UILabel *)[self.window viewWithTag:10000];
    showLabel.text = self.tusiStr;
 
    self.tusiHidden = NO;
    
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(changeTusiHiddenBool) object:nil];
    [self performSelector:@selector(changeTusiHiddenBool) withObject:nil afterDelay:self.duration];
}

/**
 *  改变bool让吐司消失的方法
 */
- (void)changeTusiHiddenBool{
    self.tusiHidden = YES;
}

/**
 *  由下往上消失的方法
 */
- (void)closeSelf{
    
    [UIView animateWithDuration:self.duration animations:^{
        CGRect rect = self.frame;
        rect.origin.y = 0 - self.height;
        self.frame = rect;
    } completion:^(BOOL finished) {
        [self removeSelf];
    }];
    
}

/**
 *  展示吐司的方法
 */
- (void)showSelf{
    
    [UIView animateWithDuration:self.duration animations:^{
        CGRect rect = self.frame;
        rect.origin.y += self.height;
        self.frame = rect;
    } completion:^(BOOL finished) {

    }];
    
}

- (void)dealloc
{

}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
