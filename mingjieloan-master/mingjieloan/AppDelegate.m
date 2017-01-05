//
//  AppDelegate.m
//  mingjieloan
//
//  Created by vicki on 2016/12/19.
//  Copyright © 2016年 vicki. All rights reserved.
//

#import "AppDelegate.h"
#import "LoginViewController.h"
#import "UMSocialCore/UMSocialCore.h"

@interface AppDelegate ()
@property (strong, nonatomic) UINavigationController * productNavi;
@property (strong, nonatomic) UINavigationController * accountNavi;
@property (strong, nonatomic) UINavigationController * moreNavi;
@property (strong, nonatomic) UINavigationController * loginNavi;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.window makeKeyAndVisible];
    
    //打开调试日志
    [[UMSocialManager defaultManager] openLog:YES];
    //设置友盟appkey
    [[UMSocialManager defaultManager] setUmSocialAppkey:@"15ec6c26de02c"];
    //设置微信的appKey和appSecret
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_WechatSession appKey:@"wx6bea3b94952c7e87" appSecret:@"206b36490b3737fc2f99d819fba6ccc2" redirectURL:@"http://mobile.umeng.com/social"];
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_WechatTimeLine appKey:@"wx6bea3b94952c7e87" appSecret:@"206b36490b3737fc2f99d819fba6ccc2" redirectURL:@"http://mobile.umeng.com/social"];
    
    
    
    ProductCenterViewController *proVC = [[ProductCenterViewController alloc] init];
    self.productNavi = [[UINavigationController alloc] initWithRootViewController:proVC];
    self.productNavi.tabBarItem.image = [[UIImage imageNamed:@"tabX_producted"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.productNavi.tabBarItem.selectedImage = [[UIImage imageNamed:@"tabX_producted_h"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.productNavi.title = @"产品中心";
    
    
    MyAccountViewController *accountVC = [[MyAccountViewController alloc] init];
    self.accountNavi = [[UINavigationController alloc] initWithRootViewController:accountVC];
    self.accountNavi.tabBarItem.image = [[UIImage imageNamed:@"tabX_account"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.accountNavi.tabBarItem.selectedImage = [[UIImage imageNamed:@"tabX_accounted_h"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.accountNavi.title = @"我的账户";
    
    
    LoginViewController *loginVC = [[LoginViewController alloc] init];
    self.loginNavi = [[UINavigationController alloc] initWithRootViewController:loginVC];
    self.loginNavi.tabBarItem.image = [[UIImage imageNamed:@"tabX_account"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.loginNavi.tabBarItem.selectedImage = [[UIImage imageNamed:@"tabX_accounted_h"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.loginNavi.title = @"我的账户";
    
    
    MoreInfoViewController *infoVC = [[MoreInfoViewController alloc] init];
    self.moreNavi = [[UINavigationController alloc] initWithRootViewController:infoVC];
    self.moreNavi.tabBarItem.image = [[UIImage imageNamed:@"tabX_mored"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.moreNavi.tabBarItem.selectedImage = [[UIImage imageNamed:@"tabX_mored_h"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    self.moreNavi.title = @"更多信息";
    
    // 键盘收回
    IQKeyboardManager *manager                  = [IQKeyboardManager sharedManager];
    manager.enable                              = YES;
    manager.shouldResignOnTouchOutside          = YES;
    manager.shouldToolbarUsesTextFieldTintColor = YES;
    manager.enableAutoToolbar                   = YES;
    manager.toolbarManageBehaviour              = IQAutoToolbarByTag;
    
    self.tabbar = [[UITabBarController alloc] init];
    // 判断是否登录
    if ([[[NSUserDefaults standardUserDefaults] objectForKey:@"isLogin"] length] > 0) {
        self.tabbar.viewControllers     = @[self.productNavi,self.accountNavi,self.moreNavi];
    } else {
        self.tabbar.viewControllers     = @[self.productNavi,self.loginNavi,self.moreNavi];
    }
    
    
    
    self.tabbar.selectedIndex       = 0;
    self.tabbar.tabBar.tintColor    = [XXColor goldenColor];
    [self.tabbar.tabBarItem setTitlePositionAdjustment:UIOffsetMake(10, -5)];
    self.tabbar.delegate            = self;
    self.window.rootViewController  = self.tabbar;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeNaviVC:) name:@"loginSuccess" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(logoutSuccess:) name:@"logoutSuccess" object:nil];

    
    return YES;
}

- (void)changeNaviVC:(NSNotification *)notification {
    self.window.rootViewController = self.tabbar;
    self.tabbar.viewControllers      = @[self.productNavi,self.accountNavi,self.moreNavi];
}

- (void)logoutSuccess:(NSNotification *)notification {
    self.tabbar.viewControllers      = @[self.productNavi,self.loginNavi,self.moreNavi];
    self.tabbar.selectedIndex        = 0;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    NSDateFormatter *pickerFormatter1 = [[NSDateFormatter alloc] init];// 创建一个日期格式
    [pickerFormatter1 setDateFormat:@"YY-MM-dd HH:mm"];
    NSString *enterBackgroundTime = [pickerFormatter1 stringFromDate:[NSDate date]];
    
    [[NSUserDefaults standardUserDefaults] setObject:enterBackgroundTime forKey:@"gestureTime"];
    [[NSUserDefaults standardUserDefaults] synchronize];

}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    
    NSString *enterBackgroundTime = [[NSUserDefaults standardUserDefaults]objectForKey:@"gestureTime"];
    if (enterBackgroundTime != nil)
    {
        NSLog(@"a1sd");
        NSDateFormatter *pickerFormatter1 = [[NSDateFormatter alloc] init];// 创建一个日期格式
        [pickerFormatter1 setDateFormat:@"YY-MM-dd HH:mm"];
        NSDate * date = [pickerFormatter1 dateFromString:enterBackgroundTime];
        NSTimeInterval time2 =[date timeIntervalSinceNow];
        int min=((int)time2)/60;
        if(min > 1)
        {
            NSString *gesturePass = [[NSUserDefaults standardUserDefaults] objectForKey:@"UserGesturePassword"];
            if (gesturePass != nil && ![gesturePass  isEqual: @""])
            {
                DHFGesOpenVC *openVC = [[DHFGesOpenVC alloc] init];
                [self.window.rootViewController.navigationController pushViewController:openVC animated:NO];
            }
        }
    }
    else
    {
        NSString *gesturePass = [[NSUserDefaults standardUserDefaults] objectForKey:@"UserGesturePassword"];
        if (gesturePass != nil && ![gesturePass isEqualToString:@""])
        {
            NSLog(@"asdfasdfasdf");
            DHFGesOpenVC *openVC = [[DHFGesOpenVC alloc] init];
            
            self.window.rootViewController = openVC;
            UINavigationController *_nav = (UINavigationController*) (self.tabbar.viewControllers[1]);
            [_nav.navigationController presentViewController:openVC animated:NO completion:^{
                
//                NSLog(@"as草泥马dfasdf");
            }];
//            [self.tabbar.navigationController pushViewController:openVC animated:NO];
        }
    }
}


 //支持所有iOS系统
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    BOOL result = [[UMSocialManager defaultManager] handleOpenURL:url];
    if (!result) {
        // 其他如支付等SDK的回调
    }
    return result;
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
