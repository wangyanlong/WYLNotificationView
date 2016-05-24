//
//  AppDelegate.m
//  WYLNotificationView
//
//  Created by 王老师 on 15/12/23.
//  Copyright © 2015年 wyl. All rights reserved.
//

#import "WYLNotification.h"
#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)showHoliday:(NSNotification *)not{
    
    for (int i = 0; i < 15; i++) {
        
        @autoreleasepool {
        
            UIImage *image = (UIImage *)[not object];
            
            int x = (arc4random()%(int)(self.window.frame.size.width)) - image.size.width;
            
            WYLHolidayNotificationView *view =[[WYLHolidayNotificationView alloc]initWithFrame:CGRectMake(x, -100, 50, 50)];
            view.size = self.window.frame.size;
            view.image = image;
            
            [self.window addSubview:view];
            [self.window bringSubviewToFront:view];
            
            [view startDropOut];
        
        }
    
    }
            
}

- (void)showSpecialNotification:(NSNotification *)not{
    
    NSDictionary *dict = [not userInfo];
    
    WYLSpecialNotificationView *view = nil;
    view = (WYLSpecialNotificationView *)[self.window viewWithTag:16000];

    if (view) {
        view.tusiStr = [dict objectForKey:kTUCAOStr];
        [view keepSelf];
    }else{
        view = [[WYLSpecialNotificationView alloc]init];
        
        view.window = self.window;
        view.tusiStr = [dict objectForKey:kTUCAOStr];
        view.height = self.window.frame.size.height / 10.0f;
        view.font = [UIFont systemFontOfSize:20];
        view.duration = [[dict objectForKey:kTUCAODuration] floatValue];
        view.btnStr = [dict objectForKey:kTUBtnStr];
        
        __weak WYLSpecialNotificationView *weakView = view;
        view.callBtn = ^{
            [weakView removeSelf];
        };
        
        [view createTuSi];
        [view createBtn];
    }
    
}

- (void)showTS:(NSNotification *)not{
    
    NSDictionary *dict = [not userInfo];
    
    WYLNotificationView *view = nil;
    view = (WYLNotificationView *)[self.window viewWithTag:15000];
    
    if (view){
        
        view.tusiStr = [dict objectForKey:kTUCAOStr];
        view.duration = [[dict objectForKey:kTUCAODuration] floatValue];
        [view keepSelf];
        
    }else{
        
        view = [[WYLNotificationView alloc]init];
        
        view.window = self.window;
        view.tusiStr = [dict objectForKey:kTUCAOStr];
        view.height = self.window.frame.size.height / 10.0f;
        view.font = [UIFont systemFontOfSize:20];
        view.duration = [[dict objectForKey:kTUCAODuration] floatValue];
        
        [view createTuSi];

    }
    
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(showTS:) name:kTSNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(showHoliday:) name:kHolidayNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(showSpecialNotification:) name:kTSSpecialNotification object:nil];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
