//
//  JGProgressHUD+Add.h
//  mingjieloan
//
//  Created by 王好帅 on 2016/12/23.
//  Copyright © 2016年 mingjie. All rights reserved.
//

#import <JGProgressHUD/JGProgressHUD.h>


@interface JGProgressHUD (Add)

// 
+ (void)showMessage:(NSString *)message inView:(UIView *)view;

+ (void)showSuccess:(NSString *)message inView:(UIView *)view;


@end
