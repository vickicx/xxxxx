//
//  AppDelegate.h
//  mingjieloan
//
//  Created by vicki on 2016/12/19.
//  Copyright © 2016年 vicki. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DHFGesOpenVC.h"


@interface AppDelegate : UIResponder <UIApplicationDelegate,UIScrollViewDelegate,UITabBarControllerDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UIScrollView * scrollView;
@property (strong, nonatomic) UIPageControl * pageControl;
@property (strong, nonatomic) UITabBarController *tabbar;


@end

