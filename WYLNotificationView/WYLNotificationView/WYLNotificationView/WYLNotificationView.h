//
//  WYLNotificationView.h
//  WYLNotificationView
//
//  Created by 王老师 on 15/12/23.
//  Copyright © 2015年 wyl. All rights reserved.
//
//
//

#import <UIKit/UIKit.h>

@interface WYLNotificationView : UIView

/*!
 *  吐司显示的时间长短
 */
@property (nonatomic, assign) NSTimeInterval    duration;

/*!
 *  吐司加载到底层的window上
 */
@property (nonatomic, weak)   UIWindow  *window;

/*!
 *  要显示的字符串
 */
@property (nonatomic, strong) NSString  *tusiStr;

/*!
 *  设置吐司的高度
 */
@property (nonatomic, assign) CGFloat   height;

/*!
 *  设置背景颜色
 */
@property (nonatomic, strong) UIColor   *color;

/*!
 *  设置字体大小
 */
@property (nonatomic, strong) UIFont    *font;

/*!
 *  创建吐司
 */
- (void)createTuSi;

/*!
 *  删除吐司
 */
- (void)removeSelf;

/*!
 *  显示吐司
 */
- (void)showSelf;

@end