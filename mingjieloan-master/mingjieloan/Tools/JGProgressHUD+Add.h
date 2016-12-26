//
//  JGProgressHUD+Add.h
//  mingjieloan
//
//  Created by vicki on 2016/12/23.
//  Copyright © 2016年 vicki. All rights reserved.
//

#import <JGProgressHUD/JGProgressHUD.h>


@interface JGProgressHUD (Add)

// 
+ (void)showMessage:(NSString *)message inView:(UIView *)view;

+ (void)showSuccess:(NSString *)message inView:(UIView *)view;


@end
