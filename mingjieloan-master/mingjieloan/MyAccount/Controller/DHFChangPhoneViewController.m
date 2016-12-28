//
//  DHFChangPhoneViewController.m
//  mingjieloan
//
//  Created by kang on 16/12/27.
//  Copyright © 2016年 mingjie. All rights reserved.
//

#import "DHFChangPhoneViewController.h"

@interface DHFChangPhoneViewController ()


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
