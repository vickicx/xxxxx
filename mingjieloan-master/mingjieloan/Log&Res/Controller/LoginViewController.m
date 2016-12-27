//
//  LoginViewController.m
//  mingjieloan
//
//  Created by vicki on 2016/12/20.
//  Copyright © 2016年 vicki. All rights reserved.
//没写完


#import "LoginViewController.h"
#import "ForgetViewController.h"
#import "BaseService.h"

@interface LoginViewController ()<JGProgressHUDDelegate>

@property (strong, nonatomic) UIImageView * codeImageView;
@property (strong, nonatomic) UITextField * codeField;
@property (strong, nonatomic) UIView * codeLine;
@property (strong, nonatomic) UILabel * warnLabel;
@property (strong, nonatomic) UIImageView * yzmImage;

@end

@implementation LoginViewController


- (void)viewDidLoad {
    [super viewDidLoad];
     self.navigationItem.title = @"登录";
    self.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController.navigationBar setTitleTextAttributes:@{ NSForegroundColorAttributeName:[UIColor whiteColor]}];
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    [self.navigationController.navigationBar setBarTintColor:[XXColor labGoldenColor]];
    
    
    [self createView];

    // Do any additional setup after loading the view.
}

- (void)createView {
    
    self.nameField = [[UITextField alloc] initWithFrame:CGRectMake(21*FitWidth + 50*FitWidth, 109*FitHeight, kWIDTH - 160*FitWidth, 20*FitHeight)];
    self.nameField.placeholder = @"请填写手机号码";
    self.nameField.borderStyle = UITextBorderStyleNone;
    [self.view addSubview:self.nameField];
    
    self.passwordField = [[UITextField alloc] initWithFrame:CGRectMake(21*FitWidth + 50*FitWidth, 160*FitHeight, self.nameField.width, self.nameField.height)];
    self.passwordField.borderStyle = UITextBorderStyleNone;
    self.passwordField.placeholder = @"请填写密码";
    self.passwordField.secureTextEntry = YES;
    [self.view addSubview:self.passwordField];
    
    UIImageView *imageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(41*FitWidth, self.nameField.top, 14*FitWidth, 20*FitHeight)];
    imageView1.image = [UIImage imageNamed:@"shoujihao"];
    [self.view addSubview:imageView1];
    UIImageView *imageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(imageView1.left , self.passwordField.top, 14*FitWidth, 20*FitHeight)];
    imageView2.image = [UIImage imageNamed:@"mima"];
    [self.view addSubview:imageView2];
    
    self.forgetButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.forgetButton.frame = CGRectMake(312 *FitWidth, self.passwordField.bottom + 20*FitHeight, 100*FitWidth, self.passwordField.height);
    [self.forgetButton addTarget:self action:@selector(forgetButton:) forControlEvents:UIControlEventTouchUpInside];
    self.forgetButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [self.forgetButton setTitle:@"忘记密码？" forState:UIControlStateNormal];
    [self.forgetButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.view addSubview:self.forgetButton];
    
    self.longinButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.longinButton.frame = CGRectMake(25*FitWidth, self.forgetButton.bottom+15*FitHeight, kWIDTH - 40*FitHeight, 45*FitHeight);
    [self.longinButton addTarget:self action:@selector(loginButton:) forControlEvents:UIControlEventTouchUpInside];
    self.longinButton.layer.masksToBounds = YES;
    self.longinButton.layer.borderWidth = 1;
    self.longinButton.layer.cornerRadius = 4;
    self.longinButton.layer.borderColor = [XXColor borderAllColor].CGColor;

    [self.longinButton setTitle:@"登录" forState:UIControlStateNormal];
    [self.longinButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.longinButton.titleLabel.font = [UIFont systemFontOfSize:RealValue(18)];
    self.longinButton.backgroundColor = [XXColor btnGoldenColor];
    [self.view addSubview:self.longinButton];
    
    
    self.registerButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.registerButton.frame = CGRectMake(self.longinButton.left, self.longinButton.bottom+15*FitHeight, self.longinButton.width, 45*FitHeight);
    [self.registerButton addTarget:self action:@selector(registerButton:) forControlEvents:UIControlEventTouchUpInside];
    self.registerButton.layer.masksToBounds = YES;
    self.registerButton.layer.cornerRadius = 2;
    [self.registerButton setTitle:@"立即注册" forState:UIControlStateNormal];
    [self.registerButton setTitleColor:
     [XXColor btnGoldenColor] forState:UIControlStateNormal];
    self.registerButton.titleLabel.font = [UIFont systemFontOfSize:RealValue(18)];
     self.registerButton.layer.borderWidth = 1;
    self.registerButton.layer.cornerRadius = 4;
    self.registerButton.backgroundColor = [UIColor whiteColor];
    self.registerButton.layer.borderColor =[XXColor borderAllColor].CGColor;
    [self.view addSubview:self.registerButton];
    
    self.forgetButton.titleLabel.font = self.registerButton.titleLabel.font = [UIFont systemFontOfSize:RealValue(14)];
    
    UIView *lineView1           = [[UIView alloc] initWithFrame:CGRectMake(25*FitWidth, self.nameField.top - 10*FitHeight, kWIDTH - 50*FitWidth, 1*FitHeight)];
    lineView1.backgroundColor   = [UIColor grayColor];
    [self.view addSubview:lineView1];
    
    UIView *lineView2           = [[UIView alloc] initWithFrame:CGRectMake(25*FitWidth, self.nameField.bottom + 10*FitHeight, kWIDTH - 50*FitWidth, 1*FitHeight)];
    lineView2.backgroundColor   = [UIColor grayColor];
    [self.view addSubview:lineView2];
    
    UIView *lineView3           = [[UIView alloc] initWithFrame:CGRectMake(25*FitWidth, self.passwordField.top - 10*FitHeight, kWIDTH - 50*FitWidth, 1*FitHeight)];
    lineView3.backgroundColor   = [UIColor grayColor];
    [self.view addSubview:lineView3];
    
    UIView *lineView4           = [[UIView alloc] initWithFrame:CGRectMake(25*FitWidth, self.passwordField.bottom + 10*FitHeight, kWIDTH - 50*FitWidth, 1*FitHeight)];
    lineView4.backgroundColor   = [UIColor grayColor];
    [self.view addSubview:lineView4];
    
    self.codeImageView          = [[UIImageView alloc] initWithFrame:CGRectMake(kWIDTH - 120*FitWidth, self.passwordField.bottom + 20*FitHeight, 100*FitWidth, 50*FitHeight)];
    self.codeImageView.hidden   = YES;
    [self.view addSubview:self.codeImageView];
    self.codeField              = [[UITextField alloc] initWithFrame:CGRectMake(self.nameField.left, self.forgetButton.bottom + 5*FitHeight, kWIDTH / 2, self.nameField.height)];
    self.codeField.placeholder  = @"请输入验证码";
    self.codeField.hidden       = YES;
    [self.view addSubview:self.codeField];
    
    self.codeLine                  = [[UIView alloc] initWithFrame:CGRectMake(self.codeField.left - 5, self.codeField.bottom + 10*FitHeight, self.codeField.width, 1*FitHeight)];
    self.codeLine.backgroundColor = [UIColor grayColor];
    self.codeLine.hidden          = YES;
    [self.view addSubview:self.codeLine];
    self.warnLabel                 = [[UILabel alloc] initWithFrame:CGRectMake(self.codeLine.left, self.codeLine.bottom, self.codeLine.width, 20*FitHeight)];
    self.warnLabel.textColor       = [UIColor redColor];
    self.warnLabel.text            = @"账户或密码输入错误";
    self.warnLabel.hidden          = YES;
    [self.view addSubview:self.warnLabel];
    
    self.yzmImage                  = [[UIImageView alloc] initWithFrame:CGRectMake(imageView1.left, self.codeField.top, 16*FitWidth, 20*FitHeight)];
    self.yzmImage.image            = [UIImage imageNamed:@"tupianyanzhengma"];
    self.yzmImage.hidden           = YES;
    [self.view addSubview:self.yzmImage];
    
    self.nameField.font = self.passwordField.font = self.codeField.font = self.warnLabel.font = RealFont(13);
    
    
    
}

- (void)forgetButton:(UIButton *)button {
    ForgetViewController *forget = [[ForgetViewController alloc] init];
    [self.navigationController pushViewController:forget animated:YES];
}

- (void)loginButton:(UIButton *)button {
    
    // 重置坐标
    self.forgetButton.frame         = CGRectMake(312 *FitWidth, self.passwordField.bottom + 20*FitHeight, 100*FitWidth, self.passwordField.height);
    self.longinButton.frame         = CGRectMake(25*FitWidth, self.forgetButton.bottom+15*FitHeight, kWIDTH - 40*FitHeight, 45*FitHeight);
    self.registerButton.frame       = CGRectMake(self.longinButton.left, self.longinButton.bottom+15*FitHeight, self.longinButton.width, 45*FitHeight);
    self.warnLabel.frame            = CGRectMake(self.codeLine.left, self.codeLine.bottom, self.codeLine.width, 20*FitHeight);
    self.codeImageView.hidden       = YES;
    self.codeField.hidden           = YES;
    self.codeLine.hidden            = YES;
    self.yzmImage.hidden            = YES;
    self.warnLabel.hidden           = YES;
    
    [self login];
}

// 登录

- (void)login {
    
    // [NSString stringWithFormat:@"iOS%@",[NSBundle mainBundle].infoDictionary[@"CFBundleShortVersionString"]]
    
    JGProgressHUD *hud = [[JGProgressHUD alloc] initWithStyle:0];
    
    hud.textLabel.text = @"登录中...";
    
    [hud showInView:self.view];
    
    NSDictionary *dic = @{@"account":self.nameField.text,@"passwd":self.passwordField.text,@"loginVersionName":@"iOS1.2",@"captcha":self.codeField.text,@"sid":@""};
    
    [VVNetWorkTool postWithUrl:Url(LOGIN) body:dic bodyType:1 httpHeader:nil responseType:0 progress:^(NSProgress *progress) {
        
    } success:^(id result) {
        if (result) {
            [hud dismiss];
            // 储存用户的信息
            [[NSUserDefaults standardUserDefaults] setObject:result[@"body"][@"sid"] forKey:@"sid"];
            if ([result[@"status"] integerValue] == 0) {
                [[NSUserDefaults standardUserDefaults] setObject:result[@"body"][@"uid"] forKey:@"uid"];
                [[NSUserDefaults standardUserDefaults] setObject:result[@"body"][@"username"] forKey:@"username"];
                [[NSUserDefaults standardUserDefaults] setObject:result[@"body"][@"rtnUrl"] forKey:@"rtnUrl"];
                // 切换页面
                [[NSNotificationCenter defaultCenter] postNotificationName:@"loginSuccess" object:nil];
                // 记录登录状态
                [[NSUserDefaults standardUserDefaults] setObject:@"yes" forKey:@"isLogin"];
                
            } else {
                self.warnLabel.hidden       = NO;
                self.warnLabel.text         = result[@"msg"];
                self.warnLabel.frame        = CGRectMake(self.passwordField.left, self.passwordField.bottom + 20*FitHeight, self.warnLabel.width, self.warnLabel.height);
                self.forgetButton.frame     = CGRectMake(self.forgetButton.left, self.warnLabel.bottom + 15*FitHeight, self.longinButton.width, self.longinButton.height);
                self.longinButton.frame     = CGRectMake(self.longinButton.left, self.forgetButton.bottom + 20*FitHeight, self.longinButton.width, self.longinButton.height);
                self.registerButton.frame   = CGRectMake(self.longinButton.left, self.longinButton.bottom + 15*FitHeight, self.registerButton.width, self.registerButton.height);
            }
            
            
            
            if ([result[@"body"][@"needCaptcha"] integerValue] == 0) {
                
            }
            if ([result[@"body"][@"needCaptcha"] integerValue] == 1) {
                [self getCaptchaWithWarning:result[@"msg"]];
            }
        }
        
    } fail:^(NSError *error) {
        [hud dismiss];
    }];
}

- (void)getCaptchaWithWarning:(NSString *)warningStr {
    JGProgressHUD *hud = [[JGProgressHUD alloc] initWithStyle:0];
    
    hud.textLabel.text = @"正在获取验证码...";
    
    [hud showInView:self.view];
    NSDictionary *dic = @{@"sid":MySid};
    [VVNetWorkTool postWithUrl:Url(CAPTCHA) body:dic bodyType:1 httpHeader:nil responseType:ResponseTypeDATA progress:^(NSProgress *progress) {
        
    } success:^(id result) {
        [hud dismiss];
        UIImage *codeImage          = [UIImage imageWithData:result];
        self.codeImageView.image    = codeImage;
        self.codeImageView.hidden   = NO;
        self.codeField.hidden       = NO;
        self.warnLabel.hidden       = NO;
        self.yzmImage.hidden        = NO;
        self.codeLine.hidden        = NO;
        self.warnLabel.text         = warningStr;
        self.warnLabel.frame        = CGRectMake(self.codeLine.left, self.codeLine.bottom, self.codeLine.width, 20*FitHeight);
        self.forgetButton.frame     = CGRectMake(self.forgetButton.left, self.warnLabel.bottom + 15*FitHeight, self.longinButton.width, self.longinButton.height);
        self.longinButton.frame     = CGRectMake(self.longinButton.left, self.forgetButton.bottom + 20*FitHeight, self.longinButton.width, self.longinButton.height);
        self.registerButton.frame   = CGRectMake(self.longinButton.left, self.longinButton.bottom + 15*FitHeight, self.registerButton.width, self.registerButton.height);
        
    } fail:^(NSError *error) {
        [hud dismiss];
    }];
}

- (void)registerButton:(UIButton *)button {
    RegisterViewController *regi = [[RegisterViewController alloc] init];
    [self.navigationController pushViewController:regi animated:YES];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
