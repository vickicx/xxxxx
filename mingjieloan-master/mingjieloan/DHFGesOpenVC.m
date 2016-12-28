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
    self.lockView.contentInsets = UIEdgeInsetsMake(120, 40, 250, 40);
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
    
//    self.forgetBtn = [UIButton alloc] initWithFrame:CGRectMake(<#CGFloat x#>, <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>);
//   self.otherBtn;
//    
    
    
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





- (void)gestureLockView:(KKGestureLockView *)gestureLockView didBeginWithPasscode:(NSString *)passcode{
    
    
}

- (void)gestureLockView:(KKGestureLockView *)gestureLockView didCanceledWithPasscode:(NSString *)passcode{
    
}

- (void)gestureLockView:(KKGestureLockView *)gestureLockView didEndWithPasscode:(NSString *)passcode{
    NSString *gesturePass = [[NSUserDefaults standardUserDefaults] objectForKey:@"UserGesturePassword"];
    if ([gesturePass isEqualToString: passcode])
    {
        self.tipLab.text = @"手势密码解锁成功";
        [self.navigationController popViewControllerAnimated:YES];
        
    }else{
        
        self.tipLab.text = @"手势密码错误";
    }
    
}



- (void)pass{
    
    [self.navigationController popViewControllerAnimated:YES];
    
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
