//
//  ViewController.m
//  WYLNotificationView
//
//  Created by 王老师 on 15/12/23.
//  Copyright © 2015年 wyl. All rights reserved.
//
#import "WYLNotification.h"
#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (IBAction)post3:(UIButton *)sender {

    NSDictionary *dict = @{kTUCAOStr:[NSString stringWithFormat:@"这次的测试数字是 : %d",255 - (arc4random()%255)],kTUCAODuration:@(1),kTUBtnStr:@"继续下载"};
    
    [[NSNotificationCenter defaultCenter] postNotificationName:kTSSpecialNotification object:nil userInfo:dict];
    
}

- (IBAction)post2:(UIButton *)sender {
    
    UIImage *image = [UIImage imageNamed:@"girl"];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:kHolidayNotification object:image userInfo:nil];
    
}

- (IBAction)post:(id)sender {

    NSDictionary *dict = @{kTUCAOStr:[NSString stringWithFormat:@"这次的测试数字是 : %d",255 - (arc4random()%255)],kTUCAODuration:@(1)};
    
    [[NSNotificationCenter defaultCenter] postNotificationName:kTSNotification object:nil userInfo:dict];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
