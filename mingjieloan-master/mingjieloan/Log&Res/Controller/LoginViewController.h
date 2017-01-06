//
//  LoginViewController.h
//  mingjieloan
//
//  Created by vicki on 2016/12/20.
//  Copyright © 2016年 vicki. All rights reserved.
//

#import "BaseViewController.h"
#import "DHFForgerPassWorldViewController.h"

@interface LoginViewController : BaseViewController

@property (strong, nonatomic) UITextField * nameField;
@property (strong, nonatomic) UITextField * passwordField;
@property (strong, nonatomic) UIButton * forgetButton;

/** 登入按钮 */
@property (strong, nonatomic) UIButton * longinButton;
/** 注册按钮 */
@property (strong, nonatomic) UIButton * registerButton;
@end
