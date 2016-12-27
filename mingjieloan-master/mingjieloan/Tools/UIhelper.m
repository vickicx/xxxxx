//
//  UIhelper.m
//  mingjieloan
//
//  Created by vicki on 2016/12/27.
//  Copyright © 2016年 mingjie. All rights reserved.
//

#import "UIhelper.h"

@implementation UIhelper

+ (void)showToast:(NSString *)msg view:(UIView *)view {
    // 显示错误信息
    [JGProgressHUD showMessage:msg inView:view];
}

+ (void)loginTimeout {
    // 移除用户本地信息
    NSUserDefaults *personalInfo = [NSUserDefaults standardUserDefaults];
    [personalInfo removeObjectForKey:@""];
    [personalInfo removeObjectForKey:@""];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"logoutSuccess" object:nil];
}


@end
