//
//  RegisterViewController.h
//  mingjieloan
//
//  Created by vicki on 2016/12/20.
//  Copyright © 2016年 vicki. All rights reserved.
//

#import "BaseViewController.h"

@interface RegisterViewController : BaseViewController

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
