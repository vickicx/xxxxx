//
//  DHFForgerhandVC.m
//  mingjieloan
//
//  Created by 杜虹锋 on 2017/1/1.
//  Copyright © 2017年 mingjie. All rights reserved.
//

#import "DHFForgerhandVC.h"

@interface DHFForgerhandVC ()<JGProgressHUDDelegate>

@end

@implementation DHFForgerhandVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.translucent = YES;
    self.title = @"验证登录";
    self.view.backgroundColor = [UIColor whiteColor];
    NSDictionary * titleDict=[NSDictionary dictionaryWithObject:[UIColor whiteColor] forKey:UITextAttributeTextColor];
    self.navigationController.navigationBar.titleTextAttributes = titleDict;
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    [self creatViews];
}

- (void)yesLogPassWordAction{
    if (_phoneField.text.length == 0) {
        self.warning.text = @"请输入手机号";
        self.warning.hidden = NO;
        
        _YesBtn.frame = CGRectMake(70, 130 + 64 + 20, kWIDTH - 140, 50);
    }
    else if (_passWordField.text.length == 0){
        self.warning.text = @"请输入密码";
        self.warning.hidden = NO;
        
        _YesBtn.frame = CGRectMake(70, 130 + 64 + 20, kWIDTH - 140, 50);
    }
    else
    {
        JGProgressHUD *hud = [[JGProgressHUD alloc] initWithStyle:0];
        
        hud.textLabel.text = @"验证中...";
        
        [hud showInView:self.view];
        
        NSDictionary *dic = @{@"account":self.phoneField.text,@"passwd":self.passWordField.text,@"loginVersionName":@"iOS1.2",@"captcha":self.codeField.text,@"sid":@""};
        
        [VVNetWorkTool postWithUrl:Url(LOGIN) body:dic bodyType:1 httpHeader:nil responseType:0 progress:^(NSProgress *progress) {
            
        } success:^(id result) {
            if (result) {
                
                NSLog(@"%@", result);
                [hud dismiss];
                // 储存用户的信息
                if ([result[@"status"] integerValue] == 0) {
                    [[NSUserDefaults standardUserDefaults] setObject:nil forKey:@"UserGesturePassword"];
                    [[NSUserDefaults standardUserDefaults] synchronize];
                    [self.navigationController
                     popToViewController:[self.navigationController.viewControllers objectAtIndex:1] animated:YES];
                }
                else
                {
                    if ([result[@"body"][@"needCaptcha"] integerValue] == 0) {
                        self.warning.hidden = NO;
                        self.warning.text  = result[@"msg"];
                    }
                    if ([result[@"body"][@"needCaptcha"] integerValue] == 1) {
                        self.warning.hidden = NO;
                        self.warning.text  = result[@"msg"];
                        self.warning.frame = CGRectMake(50, 140 + 64, 200, 20);
                        self.YesBtn.frame = CGRectMake(70, 170 + 64 + 20, kWIDTH - 140, 50);
                        [self getCaptchaWithWarning:result[@"msg"]];
                    }
                    
                }
            }
            
        } fail:^(NSError *error) {
            [hud dismiss];
        }];
    }
}


- (void)getCaptchaWithWarning:(NSString *)warningStr {
    JGProgressHUD *hud = [[JGProgressHUD alloc] initWithStyle:0];
    
    hud.textLabel.text = @"正在获取验证码...";
    
    [hud showInView:self.view];
    NSDictionary *dic = @{@"sid":MySid};
    [VVNetWorkTool postWithUrl:Url(CAPTCHA) body:dic bodyType:1 httpHeader:nil responseType:ResponseTypeDATA progress:^(NSProgress *progress) {
        
    } success:^(id result) {
        NSLog(@"result === %@", result);
        [hud dismiss];
        UIImage *codeImage          = [UIImage imageWithData:result];
        self.codeImageView.image    = codeImage;
        self.codeImageView.hidden   = NO;
        self.codeField.hidden       = NO;
        self.warning.hidden       = NO;
        self.yzmImage.hidden        = NO;
        self.codeLine.hidden        = NO;
        self.warning.text         = warningStr;
        self.warning.frame = CGRectMake(50, 140 + 64, 200, 20);
        self.YesBtn.frame = CGRectMake(70, 170 + 64 + 20, kWIDTH - 140, 50);
        
    } fail:^(NSError *error) {
        [hud dismiss];
        NSLog(@"%@", error);
    }];
}


- (void)creatViews{
    
    CGFloat hight = 64;
    
    UIImageView *icon1 = [[UIImageView alloc] initWithFrame:CGRectMake(12, 20 + hight + 5, 13, 25)];
    icon1.image = [UIImage imageNamed:@"shoujihao"];
    [self.view addSubview:icon1];
    
    UIImageView *icon2 = [[UIImageView alloc] initWithFrame:CGRectMake(12, 60 + hight + 5, 18, 23)];
    icon2.image = [UIImage imageNamed:@"mima"];
    
    [self.view addSubview:icon2];
    
    
    self.phoneField = [[UITextField alloc] initWithFrame:CGRectMake(30, 20 + hight, kWIDTH - 60, 35)];
    _phoneField.placeholder = @" 请输入手机号";
    _phoneField.font =[UIFont systemFontOfSize:13];
    self.phoneField.leftViewMode = UITextFieldViewModeAlways;
    [self.view addSubview:_phoneField];
    
    self.lineView1 = [[UIView alloc] initWithFrame:CGRectMake(0, 35, kWIDTH - 85, 1)];
    _lineView1.backgroundColor = [XXColor grayAllColor];
    [_phoneField addSubview:_lineView1];
    
    self.passWordField = [[UITextField alloc] initWithFrame:CGRectMake(30, 60 + hight, kWIDTH - 60, 35)];
    _passWordField.placeholder = @" 请输入密码";
    _passWordField.font =[UIFont systemFontOfSize:13];
    _passWordField.secureTextEntry = YES;
    self.passWordField.leftViewMode = UITextFieldViewModeAlways;
    [self.view addSubview:_passWordField];
    
    self.lineView2 = [[UIView alloc] initWithFrame:CGRectMake(0, 35, kWIDTH - 85, 1)];
    _lineView2.backgroundColor = [XXColor grayAllColor];
    [_passWordField addSubview:_lineView2];
    
    
    
    self.codeImageView = [[UIImageView alloc] initWithFrame:CGRectMake(kWIDTH - 120, 100 + hight, 70, 35)];
    self.codeImageView.hidden   = YES;
    [self.view addSubview:self.codeImageView];
    
    self.codeField = [[UITextField alloc] initWithFrame:CGRectMake(30, 100 + hight, kWIDTH - 60, 35)];
    self.codeField.placeholder  = @"请输入验证码";
    _codeField.font =[UIFont systemFontOfSize:13];
    self.codeField.hidden       = YES;
    [self.view addSubview:self.codeField];
    
    self.codeLine = [[UIView alloc] initWithFrame:CGRectMake(0, 35, kWIDTH - 145, 1)];
    _codeLine.backgroundColor = [XXColor grayAllColor];
    self.codeLine.hidden          = YES;
    [_codeField addSubview:_codeLine];
    
    self.yzmImage  = [[UIImageView alloc] initWithFrame:CGRectMake(12, 100 + hight + 5, 18, 23)];
    self.yzmImage.image = [UIImage imageNamed:@"tupianyanzhengma"];
    self.yzmImage.hidden  = YES;
    [self.view addSubview:self.yzmImage];
    
    
    
    self.warning = [[UILabel alloc] initWithFrame:CGRectMake(50, 100 + hight, 200, 20)];
    _warning.font = [UIFont systemFontOfSize:13];
    _warning.textColor = [UIColor redColor];
    _warning.hidden = YES;
    [self.view addSubview:_warning];
    
    
    
    
    
    
    
    self.YesBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _YesBtn.frame = CGRectMake(30, 130 + hight, kWIDTH - 60, 50);
    [_YesBtn.layer setMasksToBounds:YES];
    [_YesBtn.layer setCornerRadius:4];//设置矩形四个圆角半径
    [_YesBtn addTarget:self action:@selector(yesLogPassWordAction) forControlEvents:UIControlEventTouchUpInside];
    _YesBtn.backgroundColor = [XXColor btnGoldenColor];
    [_YesBtn setTitle:@"提交验证" forState:UIControlStateNormal];
    [_YesBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:_YesBtn];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
