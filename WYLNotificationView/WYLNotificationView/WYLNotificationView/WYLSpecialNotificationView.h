//
//  WYLStopNotificationView.h
//  WYLNotificationView
//
//  Created by 王老师 on 16/1/4.
//  Copyright © 2016年 wyl. All rights reserved.
//
#import "WYLNotificationView.h"
#import <UIKit/UIKit.h>

@interface WYLSpecialNotificationView : WYLNotificationView

/*!
 *  按钮回调的block
 */
@property (nonatomic, strong) void(^callBtn)(void);

/*!
 *  按钮的名字
 */
@property (nonatomic, strong) NSString  *btnStr;

/*!
 *  按钮的颜色
 */
@property (nonatomic, strong) UIColor   *btnColor;

/**
 *  按钮
 */
@property (nonatomic, strong) UIButton  *specialBtn;

/**
 *  箭头的imageView
 */
@property (nonatomic, strong) UIImageView *arrowPointImageView;

/**
 *  箭头的img
 */
@property (nonatomic, strong) UIImage *arrowImg;

- (void)createBtn;
- (void)removeSelf;

@end
