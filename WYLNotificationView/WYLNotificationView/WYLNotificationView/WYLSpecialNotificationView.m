//
//  WYLStopNotificationView.m
//  WYLNotificationView
//
//  Created by 王老师 on 16/1/4.
//  Copyright © 2016年 wyl. All rights reserved.
//

#import "WYLSpecialNotificationView.h"

@implementation WYLSpecialNotificationView

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
    }];
}

- (void)createBtn{
    
    /*!
     手势也可以删除吐司
     */
    UISwipeGestureRecognizer *recognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    recognizer.direction = UISwipeGestureRecognizerDirectionUp;
    [self addGestureRecognizer:recognizer];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:self.btnStr forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnMethod:) forControlEvents:UIControlEventTouchUpInside];
    btn.frame = CGRectMake(self.frame.size.width * 0.75, 25, self.frame.size.width * 0.25 - 5, self.frame.size.height - 35);
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn.layer.masksToBounds = YES;
    btn.layer.cornerRadius = 5.0;
    if (self.btnColor){
        btn.backgroundColor = self.btnColor;
    }else{
        btn.backgroundColor = [UIColor colorWithRed:255/255.0 green:211/255.0 blue:106/255.0 alpha:1];
    }
    
    [self addSubview:btn];
    
    UILabel *label = (UILabel *)[self viewWithTag:10000];
    label.frame = CGRectMake(0, 20, self.frame.size.width - btn.frame.size.width, self.frame.size.height-20);
    
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



@end
