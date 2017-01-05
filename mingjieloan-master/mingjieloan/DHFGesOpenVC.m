//
//  DHFGesOpenVC.m
//  mingjieloan
//
//  Created by kang on 16/12/28.
//  Copyright © 2016年 mingjie. All rights reserved.
//

#import "DHFGesOpenVC.h"

@interface DHFGesOpenVC ()<KKGestureLockViewDelegate>

@end

@implementation DHFGesOpenVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationController.navigationBar.translucent = YES;
    self.title = @"手势密码解锁";
    self.view.backgroundColor = [UIColor whiteColor];
    NSDictionary * titleDict=[NSDictionary dictionaryWithObject:[UIColor whiteColor] forKey:UITextAttributeTextColor];
    self.navigationController.navigationBar.titleTextAttributes = titleDict;
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    
    UIImageView *imageView=[[UIImageView alloc]initWithFrame:self.view.bounds];
    imageView.image=[UIImage imageNamed:@"gesture_passbg"];
    [self.view insertSubview:imageView atIndex:0];
    
    
    self.lockView = [[KKGestureLockView alloc] initWithFrame:CGRectMake(0, 64, kWIDTH, kHEIGHT - 64)];
    self.lockView.normalGestureNodeImage = [UIImage imageNamed:@"gesture_node_normal.png"];
    self.lockView.selectedGestureNodeImage = [UIImage imageNamed:@ "gesture_node_selected.png"];
    self.lockView.lineColor = GetColor(@"#19AFCC");
    self.lockView.lineWidth = 4;
    self.lockView.delegate = self;
    self.lockView.contentInsets = UIEdgeInsetsMake(120 * FitWidth, 40 * FitHeight, 200 * FitWidth, 40 * FitHeight);
    self.lockView.tag = 1;
    [self.view addSubview:_lockView];
    
    
    self.welcomeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 110, kWIDTH, 20)];
    _welcomeLabel.textColor = [UIColor whiteColor];
    _welcomeLabel.font = [UIFont systemFontOfSize:15];
    _welcomeLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:_welcomeLabel];
    
    self.tipLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 130, kWIDTH, 20)];
    _tipLab.textColor = [UIColor whiteColor];
    _tipLab.font = [UIFont systemFontOfSize:15];
    _tipLab.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:_tipLab];
    
    self.tipLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 130, kWIDTH, 20)];
    _tipLab.text = @"请绘制解锁密码";
    _tipLab.textColor = [UIColor whiteColor];
    _tipLab.font = [UIFont systemFontOfSize:15];
    _tipLab.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:_tipLab];
    
    
    self.forgetBtn = [[UIButton alloc] initWithFrame:CGRectMake(25, 550 * FitHeight, kWIDTH / 2 -25, 20)];
    [_forgetBtn  addTarget:self action:@selector(forgetPassAction) forControlEvents:UIControlEventTouchUpInside];
    [_forgetBtn setTitle:@"忘记手势密码" forState:UIControlStateNormal];
    _forgetBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [_forgetBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:_forgetBtn];
    
    
    self.otherBtn = [[UIButton alloc] initWithFrame:CGRectMake( kWIDTH / 2 -25, 550 * FitHeight, kWIDTH / 2 -25, 20)];
    [_otherBtn  addTarget:self action:@selector(otherLoginAction) forControlEvents:UIControlEventTouchUpInside];
    [_otherBtn setTitle:@"用其他帐户登陆" forState:UIControlStateNormal];
    _otherBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [_otherBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:_otherBtn];
    
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    if (self.isShutDownGesturePassword == NO)
    {
        NSString *phoneNumber = [userDefaults objectForKey:@"username"];
        //        let realName = userDefaults.stringForKey(UserDefaults_KEY_BasicInfo.realName.rawValue)
        //        if realName != nil && realName != "" {
        self.welcomeLabel.text = [NSString stringWithFormat:@"欢迎您，%@", phoneNumber];
        //        }else if phoneNumber != nil && phoneNumber != "" {
        //            let startIndex = phoneNumber!.startIndex.advancedBy(3) // Start at the second character
        //            let endIndex   = startIndex.advancedBy(4) // point ahead two characters
        //            let range      = Range(start:startIndex, end:endIndex)
        //            //      let validPhone = phoneNumber!.stringByReplacingCharactersInRange(range, withString: "****")
        //            let validPhone = phoneNumber!
        
        //        self.welcomeLabel.text = [NSString stringWithFormat:@""];
    }
    //            else
    //            {
    //            self.welcomeLabel.text = @"欢迎您";
    //            }
    //
    //    }
    else
    {
        self.welcomeLabel.text = @"";
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"跳过" style:UIBarButtonItemStyleDone target:self action:@selector(pass)];
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStyleDone target:self action:@selector(noFunction)];
    }
}




//换号
- (void)otherLoginAction{
    LoginViewController *logInVc = [[LoginViewController alloc] init];
    [self.navigationController pushViewController:logInVc animated:YES];
}
//忘记密码
- (void)forgetPassAction{
    DHFForgerhandVC *forgertVC = [[DHFForgerhandVC alloc] init];
    [self.navigationController pushViewController:forgertVC animated:YES];
}


- (void)gestureLockView:(KKGestureLockView *)gestureLockView didBeginWithPasscode:(NSString *)passcode{
    
    
}

- (void)gestureLockView:(KKGestureLockView *)gestureLockView didCanceledWithPasscode:(NSString *)passcode{
    
}

- (void)gestureLockView:(KKGestureLockView *)gestureLockView didEndWithPasscode:(NSString *)passcode{
    NSString *gesturePass = [[NSUserDefaults standardUserDefaults] objectForKey:@"UserGesturePassword"];
    if ([gesturePass isEqualToString: passcode])
    {
        self.tipLab.text = @"手势密码解锁成功";
        // 切换页面
        [[NSNotificationCenter defaultCenter] postNotificationName:@"loginSuccess" object:nil];
        
    }else{
        
        self.tipLab.text = @"手势密码错误";
    }
    
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


- (void)pass{
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (void)noFunction{
    
    DHFForgerhandVC *forgertVC = [[DHFForgerhandVC alloc] init];
    [self.navigationController pushViewController:forgertVC animated:YES];
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
