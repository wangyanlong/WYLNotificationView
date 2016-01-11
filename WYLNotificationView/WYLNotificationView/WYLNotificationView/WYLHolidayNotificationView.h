//
//  WYLHolidayNotificationView.h
//  WYLNotificationView
//
//  Created by 王老师 on 16/1/4.
//  Copyright © 2016年 wyl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WYLHolidayNotificationView : UIImageView

/*!
 *  the phone screen size
 */
@property (nonatomic, assign) CGSize size;

/*!
 *  create view and drop out
 */
- (void)startDropOut;

@end
