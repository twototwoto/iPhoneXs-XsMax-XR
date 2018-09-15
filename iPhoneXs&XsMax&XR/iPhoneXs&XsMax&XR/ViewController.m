//
//  ViewController.m
//  iPhoneXs&XsMax&XR
//
//  Created by wangyongwang on 2018/9/15.
//  Copyright © 2018年 ITCoderW. All rights reserved.
//

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

@interface UIViewController () <UITableViewDataSource>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self deviceScreenInfo];
    [self setupUI];
}

- (void)setupUI {
    
    self.title = [[NSBundle mainBundle]infoDictionary][@"CFBundleName"];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UITableView *tableView = [UITableView new];
    [self.view addSubview:tableView];
    
    tableView.dataSource = self;
    tableView.backgroundColor = [UIColor grayColor];
    tableView.frame = self.view.bounds;
    tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    /**
    UIView *topView = [UIView new];
    [self.view addSubview:topView];
    topView.frame = CGRectMake(CGRectGetMidX(self.view.frame) - 50.0, 44.0, 100.0, 40.0);
    topView.backgroundColor = [UIColor redColor];
    
    UIView *bottomView = [UIView new];
    [self.view addSubview:bottomView];
    bottomView.frame = CGRectMake(CGRectGetMidX(self.view.frame) - 50.0, [UIScreen mainScreen].bounds.size.height - 40.0 - 34.0, 100.0, 40.0);
    bottomView.backgroundColor = [UIColor blueColor];
    
    if (@available(iOS 11.0, *)) {
         NSLog(@"safeAreaInsets: %@",NSStringFromUIEdgeInsets(tableView.safeAreaInsets));
    } else {
        // Fallback on earlier versions
    }
    if (@available(iOS 11.0, *)) {
        // UILayoutGuide *layoutGuide = self.view.safeAreaLayoutGuide;
        // BOOL insetsLayoutMarginsFromSafeArea = self.view.insetsLayoutMarginsFromSafeArea;
    } else {
        // Fallback on earlier versions
    }
     */
}


#pragma mark - Private functions

- (void)deviceScreenInfo {
    
    NSLog(@"设备名：%@", [[UIDevice currentDevice]name]);
    NSLog(@"设备尺寸：%@", NSStringFromCGRect([UIScreen mainScreen].bounds));
    NSLog(@"设备Scale：%f", [UIScreen mainScreen].scale);
    NSLog(@"状态栏Size：%@", NSStringFromCGSize([[UIApplication sharedApplication] statusBarFrame].size));
    NSLog(@"导航栏Size：%@", NSStringFromCGSize([UIApplication sharedApplication].keyWindow.rootViewController.navigationController.navigationBar.frame.size));
    NSLog(@"TabBarSize：%@", NSStringFromCGSize(self.tabBarController.tabBar.frame.size));
    NSLog(@"isIPhoneXR: %@----isIPhoneXsMax：%@", @(isIPhoneXR), @(isIPhoneXsMax));
    
    /**
     * iPhone XR
     2018-09-15 14:41:25.722733+0800 iPhoneXs&XsMax&XR[5915:433589] 设备名：iPhone XR
     2018-09-15 14:41:25.722930+0800 iPhoneXs&XsMax&XR[5915:433589] 设备尺寸：{{0, 0}, {414, 896}}
     2018-09-15 14:41:25.723020+0800 iPhoneXs&XsMax&XR[5915:433589] 设备Scale：2.000000
     2018-09-15 14:41:25.723149+0800 iPhoneXs&XsMax&XR[5915:433589] 状态栏Size：{414, 44}
     2018-09-15 14:41:25.723251+0800 iPhoneXs&XsMax&XR[5915:433589] 导航栏Size：{0, 0}
     2018-09-15 14:41:25.723319+0800 iPhoneXs&XsMax&XR[5915:433589] TabBarSize：{414, 83}
     2018-09-15 14:43:45.091297+0800 iPhoneXs&XsMax&XR[5972:440533] isIPhoneXR: 1----isIPhoneXsMax：0
     
     * iPhone XS Max
     2018-09-15 14:40:48.097173+0800 iPhoneXs&XsMax&XR[5892:430766] 设备名：iPhone XS Max
     2018-09-15 14:40:48.097322+0800 iPhoneXs&XsMax&XR[5892:430766] 设备尺寸：{{0, 0}, {414, 896}}
     2018-09-15 14:40:48.097467+0800 iPhoneXs&XsMax&XR[5892:430766] 设备Scale：3.000000
     2018-09-15 14:40:48.097578+0800 iPhoneXs&XsMax&XR[5892:430766] 状态栏Size：{414, 44}
     2018-09-15 14:40:48.097672+0800 iPhoneXs&XsMax&XR[5892:430766] 导航栏Size：{0, 0}
     2018-09-15 14:40:48.097743+0800 iPhoneXs&XsMax&XR[5892:430766] TabBarSize：{414, 83}
     2018-09-15 14:44:13.228208+0800 iPhoneXs&XsMax&XR[5991:442455] isIPhoneXR: 0----isIPhoneXsMax：1
     
     */
}


#pragma mark - TableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 20.0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellReuseID"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cellReuseID"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%zd",indexPath.row];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"detail--%zd",indexPath.row];
    
    return cell;
}


@end
