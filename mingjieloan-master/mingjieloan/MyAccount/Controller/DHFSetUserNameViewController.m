//
//  DHFSetUserNameViewController.m
//  mingjieloan
//
//  Created by kang on 16/12/27.
//  Copyright © 2016年 mingjie. All rights reserved.
//

#import "DHFSetUserNameViewController.h"

@interface DHFSetUserNameViewController ()

@end

@implementation DHFSetUserNameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"设置用户名";
    self.view.backgroundColor = [UIColor whiteColor];
    NSDictionary * titleDict=[NSDictionary dictionaryWithObject:[UIColor whiteColor] forKey:UITextAttributeTextColor];
    self.navigationController.navigationBar.titleTextAttributes = titleDict;
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    
    [self createViews];
    
    
}

- (void)yesAction{
    if(self.nameField.text.length == 0){
        self.warning.text = @"请输入用户名";
        self.warning.hidden = NO;
        _warningLab.frame = CGRectMake(0, 70 + 64 + 20, kWIDTH, 20);
        _YesBtn.frame = CGRectMake(70, 90 + 64 + 20, kWIDTH - 140, 50);
    }
    else
    {
        JGProgressHUD *hud = [[JGProgressHUD alloc] initWithStyle:0];
        
        hud.textLabel.text = @"loading...";
        
        [hud showInView:self.view];
        NSDictionary *dic = @{@"sid":[[NSUserDefaults standardUserDefaults] valueForKey:@"sid"],@"name":self.nameField.text};
        [VVNetWorkTool postWithUrl:Url(NAME) body:dic bodyType:BodyTypeDictionary httpHeader:nil responseType:ResponseTypeDATA progress:^(NSProgress *progress) {
            
            
        } success:^(id result) {
            NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:result options:NSJSONReadingMutableContainers error:nil];
            [hud dismiss];
            //        NSLog(@"dic == %@", dic);
            [self.navigationController popViewControllerAnimated:YES];
            
            
        } fail:^(NSError *error) {
            
            [hud dismiss];
        }];
    }
}



- (void)createViews{
    
    CGFloat hight = 64;
    
    UIImageView *icon = [[UIImageView alloc] init];
    icon.image = [UIImage imageNamed:@"shezhiyonghuming"];
    icon.width = 22;
    icon.height = 21.5;
    
    icon.contentMode =UIViewContentModeCenter;
    
    self.nameField = [[UITextField alloc] initWithFrame:CGRectMake(30, 20 + hight, kWIDTH - 60, 35)];
    _nameField.placeholder = @" 请输入用户名";
    self.nameField.leftView =icon;
    _nameField.font =[UIFont systemFontOfSize:13];
    self.nameField.leftViewMode = UITextFieldViewModeAlways;
    [self.view addSubview:_nameField];
    
    self.lineView = [[UIView alloc] initWithFrame:CGRectMake(25, 35, kWIDTH - 85, 1)];
    _lineView.backgroundColor = [XXColor grayAllColor];
    [_nameField addSubview:_lineView];
    
    self.warning = [[UILabel alloc] initWithFrame:CGRectMake(50, 60 + hight, 200, 20)];
    _warning.font = [UIFont systemFontOfSize:13];
    _warning.textColor = [UIColor redColor];
    _warning.hidden = YES;
    [self.view addSubview:_warning];
    
    self.warningLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 70 + hight, kWIDTH, 20)];
    _warningLab.textAlignment = NSTextAlignmentCenter;
    _warningLab.font = [UIFont systemFontOfSize:10];
    _warningLab.textColor = [XXColor sendCodeBtnColor];
    _warningLab.text = @"用户名设置成功后将不能进行修改";
    [self.view addSubview:_warningLab];
    
    
    self.YesBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _YesBtn.frame = CGRectMake(70, 90 + hight, kWIDTH - 140, 50);
    [_YesBtn.layer setMasksToBounds:YES];
    [_YesBtn.layer setCornerRadius:4];//设置矩形四个圆角半径
    [_YesBtn addTarget:self action:@selector(yesAction) forControlEvents:UIControlEventTouchUpInside];
    
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
