//
//  DHFForgerPassWorldViewController.h
//  mingjieloan
//
//  Created by kang on 17/1/6.
//  Copyright © 2017年 mingjie. All rights reserved.
//

#import "SubBaseViewController.h"

@interface DHFForgerPassWorldViewController : SubBaseViewController

@property (strong, nonatomic) UITextField * nameField;
@property (strong, nonatomic) UITextField * duanxinField;
@property (strong, nonatomic) UITextField * passwordField;
@property (strong, nonatomic) UITextField * passwordAgainField;
/** 发送验证码按钮 */
@property (strong, nonatomic) UIButton * sendYZMButton;
/** 注册协议按钮 */
@property (strong, nonatomic) UIButton * registerXYButton;
/** 注册按钮 */
@property (strong, nonatomic) UIButton * registerButton;


@end
