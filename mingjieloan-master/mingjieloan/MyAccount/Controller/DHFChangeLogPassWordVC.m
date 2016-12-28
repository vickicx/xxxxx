//
//  DHFChangeLogPassWordVC.m
//  mingjieloan
//
//  Created by kang on 16/12/27.
//  Copyright © 2016年 mingjie. All rights reserved.
//

#import "DHFChangeLogPassWordVC.h"

@interface DHFChangeLogPassWordVC ()

@end

@implementation DHFChangeLogPassWordVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"修改密码";
    self.view.backgroundColor = [UIColor whiteColor];
    NSDictionary * titleDict=[NSDictionary dictionaryWithObject:[UIColor whiteColor] forKey:UITextAttributeTextColor];
    self.navigationController.navigationBar.titleTextAttributes = titleDict;
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    [self creatViews];
}

- (void)yesLogPassWordAction{
    
    if(self.oldField.text.length == 0){
        self.warning.text = @"请输入旧密码";
        self.warning.hidden = NO;
        
        _YesBtn.frame = CGRectMake(70, 170 + 64 + 20, kWIDTH - 140, 50);
        
    }
    else if(self.pWField.text.length == 0){
        self.warning.text = @"请输入新密码";
        self.warning.hidden = NO;
        
        _YesBtn.frame = CGRectMake(70, 170 + 64 + 20, kWIDTH - 140, 50);
    }
    else if(self.pWAField.text.length == 0){
        self.warning.text = @"请再次输入新密码";
        self.warning.hidden = NO;
        
        _YesBtn.frame = CGRectMake(70, 170 + 64 + 20, kWIDTH - 140, 50);
    }
    else if(self.pWField.text != self.pWAField.text){
        self.warning.text = @"两次密码输入不一致";
        self.warning.hidden = NO;
        
        _YesBtn.frame = CGRectMake(70, 170 + 64 + 20, kWIDTH - 140, 50);
    }
    
}

- (void)creatViews{
    
    CGFloat hight = 64;
    
    UIImageView *icon1 = [[UIImageView alloc] init];
    icon1.image = [UIImage imageNamed:@"xiugaidenglumima"];
    icon1.width = 18;
    icon1.height = 23;
    icon1.contentMode =UIViewContentModeCenter;
    
    UIImageView *icon2 = [[UIImageView alloc] init];
    icon2.image = [UIImage imageNamed:@"xiugaidenglumima"];
    icon2.width = 18;
    icon2.height = 23;
    icon2.contentMode =UIViewContentModeCenter;
    
    UIImageView *icon3 = [[UIImageView alloc] init];
    icon3.image = [UIImage imageNamed:@"xiugaidenglumima"];
    icon3.width = 18;
    icon3.height = 23;
    icon3.contentMode =UIViewContentModeCenter;
    
    self.oldField = [[UITextField alloc] initWithFrame:CGRectMake(30, 20 + hight, kWIDTH - 60, 35)];
    _oldField.placeholder = @" 请输入旧密码";
    self.oldField.leftView =icon1;
    _oldField.font =[UIFont systemFontOfSize:13];
    self.oldField.leftViewMode = UITextFieldViewModeAlways;
    [self.view addSubview:_oldField];
    
    self.lineView1 = [[UIView alloc] initWithFrame:CGRectMake(25, 35, kWIDTH - 85, 1)];
    _lineView1.backgroundColor = [XXColor grayAllColor];
    [_oldField addSubview:_lineView1];
    
    self.pWField = [[UITextField alloc] initWithFrame:CGRectMake(30, 60 + hight, kWIDTH - 60, 35)];
    _pWField.placeholder = @" 请输入新密码";
    self.pWField.leftView =icon2;
    _pWField.font =[UIFont systemFontOfSize:13];
    self.pWField.leftViewMode = UITextFieldViewModeAlways;
    [self.view addSubview:_pWField];
    
    self.lineView2 = [[UIView alloc] initWithFrame:CGRectMake(25, 35, kWIDTH - 85, 1)];
    _lineView2.backgroundColor = [XXColor grayAllColor];
    [_pWField addSubview:_lineView2];

    
    self.pWAField = [[UITextField alloc] initWithFrame:CGRectMake(30, 100 + hight, kWIDTH - 60, 35)];
    _pWAField.placeholder = @" 请重新输入新密码";
    self.pWAField.leftView =icon3;
    _pWAField.font =[UIFont systemFontOfSize:13];
    self.pWAField.leftViewMode = UITextFieldViewModeAlways;
    [self.view addSubview:_pWAField];
    
    self.lineView3 = [[UIView alloc] initWithFrame:CGRectMake(25, 35, kWIDTH - 85, 1)];
    _lineView3.backgroundColor = [XXColor grayAllColor];
    [_pWAField addSubview:_lineView3];
    
    
    self.warning = [[UILabel alloc] initWithFrame:CGRectMake(50, 140 + hight, 200, 20)];
    _warning.font = [UIFont systemFontOfSize:13];
    _warning.textColor = [UIColor redColor];
    _warning.hidden = YES;
    [self.view addSubview:_warning];
    
    self.YesBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _YesBtn.frame = CGRectMake(70, 170 + hight, kWIDTH - 140, 50);
    [_YesBtn.layer setMasksToBounds:YES];
    [_YesBtn.layer setCornerRadius:4];//设置矩形四个圆角半径
    [_YesBtn addTarget:self action:@selector(yesLogPassWordAction) forControlEvents:UIControlEventTouchUpInside];
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
