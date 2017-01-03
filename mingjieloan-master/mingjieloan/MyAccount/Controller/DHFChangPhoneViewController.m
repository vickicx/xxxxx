//
//  DHFChangPhoneViewController.m
//  mingjieloan
//
//  Created by kang on 16/12/27.
//  Copyright © 2016年 mingjie. All rights reserved.
//

#import "DHFChangPhoneViewController.h"

@interface DHFChangPhoneViewController ()<JGProgressHUDDelegate>

@property (nonatomic, copy) NSString *req;

@property (nonatomic, copy) NSString *sign;

@property (nonatomic, copy) NSString *uri;

@property (nonatomic, copy) NSString *msg;

@property (nonatomic, strong) NSMutableArray *arr;

@end

@implementation DHFChangPhoneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"换绑手机号";
    self.view.backgroundColor = [UIColor whiteColor];
    NSDictionary * titleDict=[NSDictionary dictionaryWithObject:[UIColor whiteColor] forKey:UITextAttributeTextColor];
    self.navigationController.navigationBar.titleTextAttributes = titleDict;
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    self.numberField = [[UITextField alloc] initWithFrame:CGRectMake(40, 60 + 64, kWIDTH - 80, 30)];
    _numberField.backgroundColor = GetColor(@"#e9e9e9");
    _numberField.font = [UIFont systemFontOfSize:15];
    _numberField.textAlignment = NSTextAlignmentCenter;
    _numberField.placeholder = @"请输入手机号";
    _numberField.keyboardType = UIKeyboardTypeNumberPad;
    [_numberField.layer setMasksToBounds:YES];
    [_numberField.layer setCornerRadius:4];//设置矩形四个圆角半径
    [self.view addSubview:_numberField];
    
    self.nextBtn = [[UIButton alloc] initWithFrame:CGRectMake(40, 120 + 64, kWIDTH - 80, 30)];

    [_nextBtn addTarget:self action:@selector(nextAction) forControlEvents:UIControlEventTouchUpInside];
    
    _nextBtn.backgroundColor = [XXColor purchaseBtnBgrdColor];
    [_nextBtn setTitle:@"下一步" forState:UIControlStateNormal];
    [_nextBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:_nextBtn];
    
    
    
}

- (void)nextAction{
    
    if (_numberField.text == nil || _numberField.text.length <= 0) {
        [[[UIAlertView alloc] initWithTitle:@"提示"
                                    message:@"请填写手机号码"
                                   delegate:nil
                          cancelButtonTitle:@"确定"
                          otherButtonTitles:nil, nil] show];
    }
    else
    {
        if ([self.numberField.text isEqualToString:[[NSUserDefaults standardUserDefaults] valueForKey:@"username"]]) {
            JGProgressHUD *hud = [[JGProgressHUD alloc]init];
            hud.tag = 1;
            hud.indicatorView = nil;
            hud.textLabel.text = @"手机号已存在";
            hud.delegate = self;
            hud.position = 0;
            [hud showInView:self.view];
            [hud dismissAfterDelay:2.0];
        }
        else
        {
        JGProgressHUD *hud = [[JGProgressHUD alloc] initWithStyle:0];
        
        hud.textLabel.text = @"loading...";
        
        [hud showInView:self.view];
        NSDictionary *dic = @{@"sid":[[NSUserDefaults standardUserDefaults] valueForKey:@"sid"],@"newtel":_numberField.text};
        [VVNetWorkTool postWithUrl:Url(YZPHONE) body:dic bodyType:BodyTypeDictionary httpHeader:nil responseType:ResponseTypeDATA progress:^(NSProgress *progress) {
            
            
        } success:^(id result) {
            NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:result options:NSJSONReadingMutableContainers error:nil];
            [hud dismiss];
            //        NSLog(@"dic == %@", dic);
            NSString *str = [NSString stringWithFormat:@"%@", [dic objectForKey:@"status"]];
            
            //NSLog(@"%@",result);
            
            if ([str isEqualToString:@"0"]) {
                
                
                NSString *provider = [result objectForKey:@"pay.provider"];
                
                if ([provider isEqualToString:@"SINAPAY"]) {
                    
                    self.req = [result objectForKey:@"redirectUrl"];
                    self.sign = [result objectForKey:@"pay.provider"];
                    self.uri = [result objectForKey:@"uri"];
                    NSString *url = [NSString stringWithFormat:@"%@", [result objectForKey:@"modifyVerifyMobile"]];
                    
                    ZZChangeBoundPhoneNumVC *changeBoundPhoneNumVC = [[ZZChangeBoundPhoneNumVC alloc] init];
                    
                    changeBoundPhoneNumVC.urlStr = url;
                    
                    [self.navigationController pushViewController:changeBoundPhoneNumVC animated:YES];
                    
                    
                }
                
                
            }
            else
            {
                
                NSString *str = [NSString stringWithFormat:@"%@", [result objectForKey:@"msg"]];
                
                UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message: str preferredStyle:UIAlertControllerStyleAlert];
                
                UIAlertAction *defautAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                    
                    [self dismissViewControllerAnimated:alert completion:nil];
                }];
                
                [alert addAction:defautAction];
                
                [self presentViewController:alert animated:YES completion:nil];
                
            }
            
        } fail:^(NSError *error) {
            
            [hud dismiss];
        }];
        }
    }
    
    
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
