//
//  DHFSetCardViewController.m
//  mingjieloan
//
//  Created by kang on 16/12/27.
//  Copyright © 2016年 mingjie. All rights reserved.
//

#import "DHFSetCardViewController.h"

@interface DHFSetCardViewController ()

@end

@implementation DHFSetCardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"绑定身份证";
    self.view.backgroundColor = [UIColor whiteColor];
    NSDictionary * titleDict=[NSDictionary dictionaryWithObject:[UIColor whiteColor] forKey:UITextAttributeTextColor];
    self.navigationController.navigationBar.titleTextAttributes = titleDict;
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    [self createViews];
}


- (void)yesCardAction{
    
    if(self.nameField.text.length == 0){
        self.warning.text = @"请输入用户名";
        self.warning.hidden = NO;
        _warningLab.frame = CGRectMake(0, 110 + 64 + 20, kWIDTH, 20);
        _YesBtn.frame = CGRectMake(70, 150 + 64 + 20, kWIDTH - 140, 50);
        
    }
    else if(self.numberField.text.length == 0){
        self.warning.text = @"请输入身份证号码";
        self.warning.hidden = NO;
        _warningLab.frame = CGRectMake(70, 110 + 64 + 20, kWIDTH - 140, 30);
        _YesBtn.frame = CGRectMake(70, 150 + 64 + 20, kWIDTH - 140, 50);
    }
    
}

- (void)createViews{
    
    CGFloat hight = 64;
    
    UIImageView *icon1 = [[UIImageView alloc] init];
    icon1.image = [UIImage imageNamed:@"shezhiyonghuming"];
    icon1.width = 22;
    icon1.height = 21.5;
    
    icon1.contentMode =UIViewContentModeCenter;
    
    self.nameField = [[UITextField alloc] initWithFrame:CGRectMake(30, 20 + hight, kWIDTH - 60, 35)];
    _nameField.placeholder = @" 请输入用户名";
    self.nameField.leftView =icon1;
    _nameField.font =[UIFont systemFontOfSize:13];
    self.nameField.leftViewMode = UITextFieldViewModeAlways;
    [self.view addSubview:_nameField];
    
    self.lineView1 = [[UIView alloc] initWithFrame:CGRectMake(25, 35, kWIDTH - 85, 1)];
    _lineView1.backgroundColor = [XXColor grayAllColor];
    [_nameField addSubview:_lineView1];
    
    UIImageView *icon2 = [[UIImageView alloc] init];
    icon2.image = [UIImage imageNamed:@"card"];
    icon2.width = 20.5;
    icon2.height = 16.5;
    
    self.numberField = [[UITextField alloc] initWithFrame:CGRectMake(30, 60 + hight, kWIDTH - 60, 35)];
    _numberField.placeholder = @" 请输入18位身份证号码";
    self.numberField.leftView =icon2;
    _numberField.font =[UIFont systemFontOfSize:13];
    self.numberField.leftViewMode = UITextFieldViewModeAlways;
    [self.view addSubview:_numberField];
    
    self.lineView2 = [[UIView alloc] initWithFrame:CGRectMake(25, 35, kWIDTH - 85, 1)];
    _lineView2.backgroundColor = [XXColor grayAllColor];
    [_numberField addSubview:_lineView2];
    
    
    
    self.warning = [[UILabel alloc] initWithFrame:CGRectMake(50, 100 + hight, 200, 20)];
    _warning.font = [UIFont systemFontOfSize:13];
    _warning.textColor = [UIColor redColor];
    _warning.hidden = YES;
    [self.view addSubview:_warning];
    
    self.warningLab = [[UILabel alloc] initWithFrame:CGRectMake(70, 110 + hight, kWIDTH - 140, 30)];
    _warningLab.textAlignment = NSTextAlignmentCenter;
    _warningLab.font = [UIFont systemFontOfSize:10];
    _warningLab.textColor = [XXColor sendCodeBtnColor];
    _warningLab.text = @"监管部门规定，购买投资产品需提供实名信息以确保信息安全";
    _warningLab.numberOfLines = 0;
    [self.view addSubview:_warningLab];
    
    
    self.YesBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _YesBtn.frame = CGRectMake(70, 150 + hight, kWIDTH - 140, 50);
    [_YesBtn.layer setMasksToBounds:YES];
    [_YesBtn.layer setCornerRadius:4];//设置矩形四个圆角半径
    [_YesBtn addTarget:self action:@selector(yesCardAction) forControlEvents:UIControlEventTouchUpInside];
    
    _YesBtn.backgroundColor = [XXColor purchaseBtnBgrdColor];
    [_YesBtn setTitle:@"确定" forState:UIControlStateNormal];
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
