//
//  RegisterViewController.m
//  mingjieloan
//
//  Created by vicki on 2016/12/20.
//  Copyright © 2016年 vicki. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"注册";
    self.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController.navigationBar setTitleTextAttributes:@{ NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    [self.navigationController.navigationBar setBarTintColor:[XXColor labGoldenColor]];

    [self createView];
    // Do any additional setup after loading the view.
}

- (void)createView {
    
//    UIView *grayLineView = [[UIView alloc] initWithFrame:CGRectMake(21*FitWidth,84*FitHeight, 373*FitWidth, FitHeight)];
//    grayLineView.backgroundColor = [UIColor grayColor];
//    [self.view addSubview:grayLineView];
    
    UIImageView *imageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(30*FitWidth, 109*FitHeight, 13*FitWidth, 20*FitHeight)];
    imageView1.image = [UIImage imageNamed:@"shoujihao"];
    [self.view addSubview:imageView1];
    

    
    self.nameField = [[UITextField alloc] initWithFrame:CGRectMake(54*FitWidth, 109*FitHeight, self.view.width - 160*FitWidth, 20*FitHeight)];
    self.nameField.placeholder = @"请填写手机号";
    self.nameField.keyboardType = UIKeyboardTypePhonePad;
    self.nameField.borderStyle = UITextBorderStyleNone;
    [self.view addSubview:self.nameField];
    
    UIView *grayLineView = [[UIView alloc] initWithFrame:CGRectMake(self.nameField.left - 2 *FitWidth ,self.nameField.bottom + 5 *FitHeight, 323*FitWidth, FitHeight)];
    grayLineView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:grayLineView];
    
    UIImageView *imageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(imageView1.left, grayLineView.bottom + 27*FitHeight, 14*FitWidth, 17*FitHeight)];
        imageView2.image = [UIImage imageNamed:@"duanxinyanzhengma"];
        [self.view addSubview:imageView2];
    
    self.duanxinField = [[UITextField alloc] initWithFrame:CGRectMake(54*FitWidth, imageView2.top, self.view.width - 160*FitWidth, 20*FitHeight)];
    self.duanxinField.placeholder = @"请输入短信验证码";
    self.duanxinField.borderStyle = UITextBorderStyleNone;
    [self.view addSubview:self.duanxinField];
    
    self.sendYZMButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.sendYZMButton.frame = CGRectMake(280*FitWidth, grayLineView.bottom + 5*FitHeight, 100*FitWidth, self.duanxinField.height + 20 *FitHeight);
    [self.sendYZMButton addTarget:self action:@selector(sendYZMButton:) forControlEvents:UIControlEventTouchUpInside];
    self.sendYZMButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    [self.sendYZMButton setTitle:@"发送验证码" forState:UIControlStateNormal];
    [self.sendYZMButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.sendYZMButton.titleLabel.font = [UIFont systemFontOfSize:RealValue(14)];
    
    self.sendYZMButton.backgroundColor = [XXColor btnGoldenColor];
    self.sendYZMButton.layer.cornerRadius = 20*FitWidth;

    
    
    UIView *grayLineView2 = [[UIView alloc] initWithFrame:CGRectMake(self.nameField.left - 2 *FitWidth ,self.duanxinField.bottom + 5 *FitHeight, 323*FitWidth, FitHeight)];
    grayLineView2.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:grayLineView2];


    
    

    UIImageView *imageView3 = [[UIImageView alloc] initWithFrame:CGRectMake(imageView1.left, grayLineView2.bottom + 27*FitHeight, 14*FitWidth, 17*FitHeight)];
    imageView3.image = [UIImage imageNamed:@"mima"];
    [self.view addSubview:imageView3];
    self.passwordField = [[UITextField alloc] initWithFrame:CGRectMake(54*FitWidth, imageView3.top, self.view.width - 160*FitWidth, 20*FitHeight)];
    self.passwordField.borderStyle = UITextBorderStyleNone;
    self.passwordField.placeholder = @"请输入密码";
    self.passwordField.secureTextEntry = YES;
    [self.view addSubview:self.passwordField];
    
    UIView *grayLineView3 = [[UIView alloc] initWithFrame:CGRectMake(self.nameField.left - 2 *FitWidth ,self.passwordField.bottom + 5 *FitHeight, 323*FitWidth, FitHeight)];
    grayLineView3.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:grayLineView3];
    
    
    UIImageView *imageView4 = [[UIImageView alloc] initWithFrame:CGRectMake(imageView1.left, grayLineView3.bottom + 27*FitHeight, 14*FitWidth, 17*FitHeight)];
    imageView4.image = [UIImage imageNamed:@"mima"];
    [self.view addSubview:imageView4];
    self.passwordAgainField = [[UITextField alloc] initWithFrame:CGRectMake(54*FitWidth, imageView4.top, self.view.width - 160*FitWidth, 20*FitHeight)];
    self.passwordAgainField.borderStyle = UITextBorderStyleNone;
    self.passwordAgainField.placeholder = @"请再次输入密码";
    self.passwordAgainField.secureTextEntry = YES;
    [self.view addSubview:self.passwordAgainField];
    
    self.nameField.font = self.duanxinField.font = self.passwordField.font = self.passwordAgainField.font = RealFont(14);
    
    UIView *grayLineView4 = [[UIView alloc] initWithFrame:CGRectMake(self.nameField.left - 2 *FitWidth ,self.passwordAgainField.bottom + 5 *FitHeight, 323*FitWidth, FitHeight)];
    grayLineView4.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:grayLineView4];
    
    UILabel *label  = [[UILabel alloc] initWithFrame:CGRectMake(66*FitWidth, grayLineView4.bottom + 12*FitHeight, 190*FitWidth, 20*FitHeight)];
    label.text = @"创建账户代表同意并接受铭捷贷的";
    label.font = [UIFont systemFontOfSize:RealValue(12)];
    [self.view addSubview:label];
    
    
    self.registerXYButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.registerXYButton.frame = CGRectMake(label.right + 2 *FitWidth, label.top - 7 *FitHeight, 80*FitWidth, 30 * FitHeight);
    [self.registerXYButton addTarget:self action:@selector(registerXYButton:) forControlEvents:UIControlEventTouchUpInside];
    self.registerXYButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [self.registerXYButton setTitle:@"注册协议" forState:UIControlStateNormal];
        self.registerXYButton.titleLabel.font = [UIFont systemFontOfSize:RealValue(14)];
    [self.registerXYButton setTitleColor:[XXColor btnGoldenColor] forState:UIControlStateNormal];
    [self.view addSubview:self.registerXYButton];
    
    UIView *grayLineView5 = [[UIView alloc] initWithFrame:CGRectMake(self.registerXYButton.left  ,self.registerXYButton.bottom - 7 * FitHeight, self.registerXYButton.width -20 *FitWidth, FitHeight)];
    grayLineView5.backgroundColor = [XXColor btnGoldenColor];
    [self.view addSubview:grayLineView5];

    self.registerButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.registerButton.frame = CGRectMake(label.left, label.bottom+14*FitHeight, label.width + grayLineView5.width + 3 *FitWidth, 45*FitHeight);
    [self.registerButton addTarget:self action:@selector(registerButton:) forControlEvents:UIControlEventTouchUpInside];
    self.registerButton.layer.masksToBounds = YES;
    self.registerButton.layer.borderColor = [XXColor borderAllColor].CGColor;

    [self.registerButton setTitle:@"注册" forState:UIControlStateNormal];
    [self.registerButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.registerButton.titleLabel.font = [UIFont systemFontOfSize:RealValue(18)];
    self.registerButton.backgroundColor = [XXColor btnGoldenColor];
    [self.view addSubview:self.registerButton];
     self.nameField.font = self.duanxinField.font = self.passwordField.font = self.passwordAgainField.font = [UIFont systemFontOfSize:RealValue(14)];
}

- (void)sendYZMButton:(UIButton *)button {
    [self getCode];
//    if (self.nameField.text.length == 11) {
//        [self getCode];
//        
//        __block int timeOut = 60;
//        dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//        dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
//        dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
//        dispatch_source_set_event_handler(_timer, ^{
//            if(timeOut<=0){ //倒计时结束，关闭
//                dispatch_source_cancel(_timer);
//                dispatch_async(dispatch_get_main_queue(), ^{
//                    //设置界面的按钮显示 根据自己需求设置
//                    self.sendYZMButton.titleLabel.font = [UIFont systemFontOfSize:RealValue(14)];
//                    [self.sendYZMButton setTitle:@"获取验证码" forState:UIControlStateNormal];
//                    self.sendYZMButton.userInteractionEnabled = YES;
//                });
//            }else{
//                int seconds = timeOut % 61;
//                NSString *strTime = [NSString stringWithFormat:@"%.2d", seconds];
//                dispatch_async(dispatch_get_main_queue(), ^{
//                    //设置界面的按钮显示 根据自己需求设置
//                    //NSLog(@"____%@",strTime);
//                    [UIView beginAnimations:nil context:nil];
//                    [UIView setAnimationDuration:1];
//                    self.sendYZMButton.titleLabel.font = [UIFont systemFontOfSize:RealValue(12)];
//                    [self.sendYZMButton setTitle:[NSString stringWithFormat:@"%@秒后发送",strTime] forState:UIControlStateNormal];
//                    [UIView commitAnimations];
//                    self.sendYZMButton.userInteractionEnabled = NO;
//                });
//                timeOut--;
//            }
//        });
//        dispatch_resume(_timer);
//    } else {
//        JGProgressHUD *hud = [[JGProgressHUD alloc] initWithStyle:JGProgressHUDStyleExtraLight];
//        hud.textLabel.text = @"请输入正确的手机号";
//        [hud showInView:self.view];
//        [hud dismissAfterDelay:1.5];
//    }
}
    

-(void)registerXYButton:(UIButton *)button {
    
}

-(void)registerButton:(UIButton *)button{
    [self registerAccount];
}

- (void)getCode {
    
    JGProgressHUD *hud = [[JGProgressHUD alloc] initWithStyle:0];
    
    hud.textLabel.text = @"正在发送短信";
    
    [hud showInView:self.view];
    NSDictionary *dic = @{@"sid":@"",@"phone":@"18623549649",@"captcha":@""};
    [VVNetWorkTool postWithUrl:Url(SENDCODE) body:dic bodyType:1 httpHeader:nil responseType:0 progress:^(NSProgress *progress) {
        
    } success:^(id result) {
        hud.textLabel.text = result[@"msg"];
        [hud dismissAfterDelay:0.3];
    } fail:^(NSError *error) {
        
    }];
}

- (void)registerAccount {
    
    if ([self.passwordField.text isMatch:[NSRegularExpression regularExpressionWithPattern:@"^\\S{8,}$" options:NSRegularExpressionCaseInsensitive error:nil]]) {
        
          NSDictionary *dic = @{@"phone":@"18623549649",@"password":self.passwordField.text,@"phoneCode":@"156789",@"captcha":@"",@"sid":@""};
        [VVNetWorkTool postWithUrl:Url(REGISTER) body:dic bodyType:1 httpHeader:nil responseType:0 progress:^(NSProgress *progress) {
            
        } success:^(id result) {
            
            
            
        } fail:^(NSError *error) {
            
        }];
        
    } else {
        [JGProgressHUD showSuccess:@"两次密码不相同" inView:self.view];
    }
    
}


//"phone" : phone,
//"password" : password,
//"phoneCode": phoneCode,
//"captcha" : captcha == nil ? "" : captcha!,//图片验证码,单个客户端注册超过4次需要验证码
//"sid" : ""

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

