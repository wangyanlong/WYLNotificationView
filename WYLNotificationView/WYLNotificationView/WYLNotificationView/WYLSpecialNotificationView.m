//
//  WYLStopNotificationView.m
//  WYLNotificationView
//
//  Created by 王老师 on 16/1/4.
//  Copyright © 2016年 wyl. All rights reserved.
//

#import "WYLSpecialNotificationView.h"

@implementation WYLSpecialNotificationView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.tusiHidden = NO;
        self.tag = 16000;
    }
    return self;
}

- (void)handleSwipe:(UISwipeGestureRecognizer*)recognizer {
    [self removeSelf];
}

- (void)removeSelf{
    [UIView animateWithDuration:self.duration animations:^{
        CGRect rect = self.frame;
        rect.origin.y -= self.height;
        self.frame = rect;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
        if (self.timer) {
            [self.timer invalidate];
            self.timer = nil;
        }
        
    }];
}

- (void)createBtn{
    
    /*!
     手势也可以删除吐司
     */
    UISwipeGestureRecognizer *recognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    recognizer.direction = UISwipeGestureRecognizerDirectionUp;
    [self addGestureRecognizer:recognizer];
    
    _specialBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_specialBtn setTitle:self.btnStr forState:UIControlStateNormal];
    [_specialBtn addTarget:self action:@selector(btnMethod:) forControlEvents:UIControlEventTouchUpInside];
    _specialBtn.frame = CGRectMake(self.frame.size.width * 0.725, 30, self.frame.size.width * 0.275 - 15, 24);
    [_specialBtn setTitleColor:[UIColor colorWithRed:166.0f/255.0f green:108.0f/255.0f blue:95.0f/255.0f alpha:1.00f] forState:UIControlStateNormal];
    
    if (self.font) {
        [_specialBtn.titleLabel setFont:self.font];
    }else{
        UIFont *font = [UIFont systemFontOfSize:20];
        [_specialBtn.titleLabel setFont:font];
    }
    
    [self addSubview:_specialBtn];
    UILabel *label = (UILabel *)[self viewWithTag:10000];
    label.frame = CGRectMake(5, 30, self.frame.size.width - _specialBtn.frame.size.width-10, 24);
    
}

/**
 *  如果多次触发,保持在屏幕上方的方法
 */
- (void)keepSelf{
    
    UILabel *showLabel = nil;
    showLabel = (UILabel *)[self.window viewWithTag:10000];
    showLabel.text = self.tusiStr;
    
}

- (void)btnMethod:(UIButton *)btn{
    
    self.callBtn();

}

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

@end
