//
//  AppDelegate.m
//  iPhoneXs&XsMax&XR
//
//  Created by wangyongwang on 2018/9/15.
//  Copyright © 2018年 ITCoderW. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

#define ScreenHeight [UIScreen mainScreen].bounds.size.height
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenScale [UIScreen mainScreen].scale

#define isIPhoneX_Xs (ScreenWidth == 375.0 && ScreenHeight == 812.0)
#define isIPhoneXR ((ScreenWidth == 414.0 && ScreenHeight == 896.0) && ScreenScale == 2.0)
#define isIPhoneXsMax ((ScreenWidth == 414.0 && ScreenHeight == 896.0) && ScreenScale == 3.0)
#define StatusBarHeight ((isIPhoneX_Xs || isIPhoneXR || isIPhoneXsMax) ? 44.0 : 20.0)
#define NavBarHeight ((isIPhoneX_Xs || isIPhoneXR || isIPhoneXsMax) ? 44.0)
#define StatusNavBarHeight (StatusBarHeight + NavBarHeight)
#define TabBarHeight ((isIPhoneX_Xs || isIPhoneXR || isIPhoneXsMax) ? 83.0 : 49.0)
#define BottomSafeAreaHeight 34.0

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    _window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    _window.backgroundColor = [UIColor whiteColor];
    
    ViewController *rootVc = [ViewController new];
    UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:rootVc];
    UINavigationController *nav2 = [[UINavigationController alloc] initWithRootViewController:[UIViewController new]];
    nav2.title = @"辅助";
    UITabBarController *tabC = [UITabBarController new];
    tabC.viewControllers = @[nav1, nav2];
    
    _window.rootViewController = tabC;
    // _window.rootViewController = rootVc;
    [_window makeKeyAndVisible];
    
    return YES;
}


@end
