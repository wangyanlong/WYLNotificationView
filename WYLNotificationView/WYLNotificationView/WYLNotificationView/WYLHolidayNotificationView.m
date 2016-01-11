//
//  WYLHolidayNotificationView.m
//  WYLNotificationView
//
//  Created by 王老师 on 16/1/4.
//  Copyright © 2016年 wyl. All rights reserved.
//

#import "WYLHolidayNotificationView.h"

@interface WYLHolidayNotificationView ()

@property (nonatomic, assign) NSTimeInterval duration;

@end

@implementation WYLHolidayNotificationView

- (instancetype)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    
    if (self) {
                
        self.contentMode = UIViewContentModeScaleAspectFit;
        self.duration = [self getRandomNumber:3 to:8];
    }
    
    return self;
    
}

- (void)startDropOut{
    
    [UIView animateWithDuration:self.duration animations:^{
        CGRect rect = self.frame;
        rect.origin.y = self.size.height;
        rect.origin.x = arc4random()%(int)(self.size.width);
        self.frame = rect;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
    
}

/*!
 *  生成随机数
 *
 *  @param from 开始范围
 *  @param to   结束范围
 *
 *  @return 随机数
 */
-(NSInteger)getRandomNumber:(NSInteger)from to:(NSInteger)to

{
    
    NSInteger random = (NSInteger)(from + (arc4random() % (to-from + 1)));
    
    return random; //+1,result is [from to]; else is [from, to)!!!!!!!
    
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
