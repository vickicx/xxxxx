//
//  JGProgressHUD+Add.m
//  mingjieloan
//
//  Created by vicki on 2016/12/23.
//  Copyright © 2016年 vicki. All rights reserved.
//

#import "JGProgressHUD+Add.h"

@implementation JGProgressHUD (Add)

+ (void)showMessage:(NSString *)message inView:(UIView *)view {
    JGProgressHUD *hud = [[JGProgressHUD alloc] initWithStyle:0];
    hud.textLabel.text = message;
    [hud showInView:view];
    [hud dismissAfterDelay:1.0];
}

+ (void)showSuccess:(NSString *)message inView:(UIView *)view {
    JGProgressHUD *hud = [[JGProgressHUD alloc] initWithStyle:0];
    hud.textLabel.text = message;
    [hud showInView:view];
}

@end
