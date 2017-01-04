//
//  DHFGesturePassVC.m
//  mingjieloan
//
//  Created by 杜虹锋 on 2016/12/27.
//  Copyright © 2016年 mingjie. All rights reserved.
//

#import "DHFGesturePassVC.h"

@interface DHFGesturePassVC ()<KKGestureLockViewDelegate, JGProgressHUDDelegate>

@end

@implementation DHFGesturePassVC

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"跳过" style:UIBarButtonItemStyleDone target:self action:@selector(pass)];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStyleDone target:self action:@selector(noFunction)];
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"设置手势密码";
    self.view.backgroundColor = [UIColor whiteColor];
    NSDictionary * titleDict=[NSDictionary dictionaryWithObject:[UIColor whiteColor] forKey:UITextAttributeTextColor];
    self.navigationController.navigationBar.titleTextAttributes = titleDict;
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    NSString *gesturePass = [[NSUserDefaults standardUserDefaults ] objectForKey:@"UserGesturePassword"];
    
    //    UIImageView *backImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 64, FitWidth, FitHeight - 64)];
    //    backImg.image = [UIImage imageNamed:@"gesture_passbg.png"];
    //    [self.view addSubview:backImg];
    
    //    self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"gesture_passbg"]];
    UIImageView *imageView=[[UIImageView alloc]initWithFrame:self.view.bounds];
    imageView.image=[UIImage imageNamed:@"gesture_passbg"];
    [self.view insertSubview:imageView atIndex:0];
    
    self.lockView = [[KKGestureLockView alloc] initWithFrame:CGRectMake(0, 64, kWIDTH, kHEIGHT - 64)];
    self.lockView.normalGestureNodeImage = [UIImage imageNamed:@"gesture_node_normal.png"];
    self.lockView.selectedGestureNodeImage = [UIImage imageNamed:@"gesture_node_selected.png"];
    self.lockView.lineColor = GetColor(@"#19AFCC");
    self.lockView.lineWidth = 4;
    self.lockView.delegate = self;
    self.lockView.contentInsets = UIEdgeInsetsMake(120 * FitWidth, 40 * FitHeight, 200 * FitWidth, 40 * FitHeight);
    self.lockView.tag = 1;
    [self.view addSubview:_lockView];
    
    
    self.tipLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 130, kWIDTH, 20)];
    _tipLab.textColor = [UIColor whiteColor];
    _tipLab.font = [UIFont systemFontOfSize:15];
    _tipLab.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:_tipLab];
    
    if(gesturePass == nil)
    {
        self.tipLab.text = @"绘制解锁图案";
        _gestureMoudle = newPassword;
    }else{
        self.tipLab.text = @"请输入原手势密码";
        _gestureMoudle = changePassword;
    }
    
    UILabel *warningLab = [[UILabel alloc] initWithFrame:CGRectMake(0, kHEIGHT - 60, kWIDTH, 20)];
    warningLab.textColor = [UIColor whiteColor];
    warningLab.font = [UIFont systemFontOfSize:15];
    warningLab.textAlignment = NSTextAlignmentCenter;
    warningLab.text = @"设置手势密码防止他人未经授权查看";
    [self.view addSubview:warningLab];
    
}

- (void)gestureLockView:(KKGestureLockView *)gestureLockView didBeginWithPasscode:(NSString *)passcode{
    
    
}

- (void)gestureLockView:(KKGestureLockView *)gestureLockView didCanceledWithPasscode:(NSString *)passcode{
    
}

- (void)gestureLockView:(KKGestureLockView *)gestureLockView didEndWithPasscode:(NSString *)passcode{
    
    NSLog(@"%@", passcode);
    
    if(passcode.length < 7)
    {
        self.tipLab.text = @"至少连接4个点，请重新绘制。";
        return;
    }
    
    if (self.gestureMoudle == newPassword)
    {
        if (gestureLockView.tag == 1)
        {
            self.passwordPre = passcode;
            self.tipLab.text = @"再次绘制解锁图案";
            gestureLockView.tag = 2;
            
            return;
        }
        else
        {
            
            if ([self.passwordPre isEqualToString: passcode])
            {
                self.tipLab.text = @"手势密码设置成功";
                [[NSUserDefaults standardUserDefaults ] setObject:passcode forKey:@"UserGesturePassword"];
                [[NSUserDefaults standardUserDefaults] synchronize];
                self.gestureMoudle = changePassword;
                
                JGProgressHUD *hud = [[JGProgressHUD alloc]init];
                hud.tag = 1;
                hud.indicatorView = nil;
                hud.textLabel.text = @"手势密码设置成功";
                hud.delegate = self;
                hud.position = 0;
                [hud showInView:self.view];
                [hud dismissAfterDelay:2.0];
                [self.navigationController popViewControllerAnimated:YES];
                
                
                return;
            }
            else
            {
                self.tipLab.text = @"与上一次绘制不一致，请重新绘制。";
                gestureLockView.tag = 1;
                return;
            }
        }
    }
    else if (self.gestureMoudle == changePassword)
    {
        NSString *gesturePass = [[NSUserDefaults standardUserDefaults] objectForKey:@"UserGesturePassword"];
        //        NSLog(@"%@", gesturePass);
        if ([gesturePass isEqualToString: passcode])
        {
            self.tipLab.text = @"绘制解锁图案";
            self.gestureMoudle = newPassword;
            gestureLockView.tag = 1;
            return;
        }
        else
        {
            
            self.tipLab.text = @"与上一次绘制不一致，请重新绘制。";
            return;
        }
    }
}

- (void)pass{
    if (self.isVerifying == false) {
        [self.navigationController popViewControllerAnimated:YES];
    }
    else
    {
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
}

- (void)noFunction{
    
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
