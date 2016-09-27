//
//  AppDelegate.m
//  liveFOR
//
//  Created by MacBookPro on 16/5/16.
//  Copyright © 2016年 appleLG. All rights reserved.
//

#import "AppDelegate.h"
#import <RongIMKit/RongIMKit.h>
#import <IQKeyboardManager.h>
#import "LGLoginViewController.h"
#import <BaiduMapAPI_Base/BMKMapManager.h>
//版本key
#define LFVersionKey @"version"
@interface AppDelegate ()
/** baiduMapManager */
@property (nonatomic, strong) BMKMapManager *mapManager;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //根控制器
    [self chooseRootViewController];
    
    //百度地图
    [self baiduMapSetting];
    
    
    //融云
  //   [self rongCloudIM];
    
    //键盘
    [self managerKeyBoard];
    
    
  
    return YES;
}
#pragma mark - 融云相关设置
/**
 *  融云相关设置
 */
- (void)rongCloudIM
{   //1.初始化sdk
    [[RCIM sharedRCIM] initWithAppKey:rongCloudAppKey];
    
    //2.获取token
    
    //3.连接服务器
    [[RCIM sharedRCIM] connectWithToken:@"" success:^(NSString *userId) {
        
    } error:^(RCConnectErrorCode status) {
    
    } tokenIncorrect:^{
        
    }];
    
}
#pragma mark - 选择根控制器
/**
 *  选择根控制器
 */
- (void)chooseRootViewController
{
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    self.window.rootViewController = nil;
    
    self.window.rootViewController = [[LGLoginViewController alloc] init];
//    NSString *currentVersion = [NSBundle mainBundle].infoDictionary[@"CFBundleShortVersionString"];
//    NSString *oldVersion = [LGUserDefaults objectForKey:LFVersionKey];
//
//    if ([currentVersion isEqualToString:oldVersion]) {//没有新版本
//        //显示登陆控制器
//        self.window.rootViewController = [[LGLoginViewController alloc] init];
//    }
//    else{//有新版本
//        //1.显示新特性界面
//        
//        [LGUserDefaults setValue:currentVersion forKey:LFVersionKey];
//    }
    
    [self.window makeKeyAndVisible];
}

#pragma mark - IQkeyBoard(键盘处理)
- (void)managerKeyBoard
{
    //获取单例
    IQKeyboardManager *keyBoardManager = [IQKeyboardManager sharedManager];
    //启用
    keyBoardManager.enable = YES;
    keyBoardManager.shouldResignOnTouchOutside = YES;
    keyBoardManager.shouldToolbarUsesTextFieldTintColor = YES;
    keyBoardManager.enableAutoToolbar = YES;
}

#pragma mark - baiduMap
- (void)baiduMapSetting
{
    self.mapManager = [[BMKMapManager alloc] init];
     BOOL ret = [self.mapManager start:@"Gssd5lzFGC3EgDFGBcBRPzdjFnXv4CXO" generalDelegate:nil];
    if (!ret) {
        LGLog(@"启动百度地图失败!");
    }
    
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
