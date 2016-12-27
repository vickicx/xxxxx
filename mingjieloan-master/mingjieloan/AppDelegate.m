//
//  AppDelegate.m
//  mingjieloan
//
//  Created by vicki on 2016/12/19.
//  Copyright © 2016年 vicki. All rights reserved.
//

#import "AppDelegate.h"
#import "LoginViewController.h"



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
    
    return YES;
}

- (void)changeNaviVC:(NSNotification *)notification {
    self.tabbar.viewControllers      = @[self.productNavi,self.accountNavi,self.moreNavi];
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
