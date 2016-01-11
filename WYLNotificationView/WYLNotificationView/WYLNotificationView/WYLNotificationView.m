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
        
    }
    
    return self;
}

- (void)createTuSi{
    
    self.frame = CGRectMake(0, self.height*-1, self.window.frame.size.width, self.height);
    
    UILabel *showLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 20, self.frame.size.width, self.frame.size.height-20)];
    
    showLabel.tag = 10000;
    
    showLabel.textAlignment = NSTextAlignmentCenter;
    
    showLabel.text = self.tusiStr;
    
    if (self.font) {
        showLabel.font = self.font;
    }
    
    [self addSubview:showLabel];
    
    if (self.color) {
        self.backgroundColor = showLabel.backgroundColor = self.color;
    }else{
        self.backgroundColor = showLabel.backgroundColor = [UIColor colorWithRed:250/255.0 green:155/255.0 blue:104/255.0 alpha:1];
    }
    
    [self.window addSubview:self];
    
    [self.window bringSubviewToFront:self];
    
    [self showSelf];
}

- (void)removeSelf{
    [self removeFromSuperview];
}

- (void)showSelf{
    [UIView animateWithDuration:self.duration animations:^{
        CGRect rect = self.frame;
        rect.origin.y += self.height;
        self.frame = rect;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:self.duration animations:^{
            CGRect rect = self.frame;
            rect.origin.y -= self.height;
            self.frame = rect;
        } completion:^(BOOL finished) {
            [self removeSelf];
        }];
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
