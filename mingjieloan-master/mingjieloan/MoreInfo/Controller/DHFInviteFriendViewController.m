//
//  DHFInviteFriendViewController.m
//  mingjieloan
//
//  Created by 杜虹锋 on 2016/12/26.
//  Copyright © 2016年 mingjie. All rights reserved.
//

#import "DHFInviteFriendViewController.h"

@interface DHFInviteFriendViewController ()

@end

@implementation DHFInviteFriendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"邀请好友";
    self.view.backgroundColor = [UIColor whiteColor];
    NSDictionary * titleDict=[NSDictionary dictionaryWithObject:[UIColor whiteColor] forKey:UITextAttributeTextColor];
    self.navigationController.navigationBar.titleTextAttributes = titleDict;
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    [self createViews];
}

//跳到历史记录
- (void)InviteHistoryAction{
    
}

//邀请好友
- (void)inviteFriendAction{
    
}

- (void)createViews{
    
    CGFloat headHight = 64;
    
    self.headBackView = [[UIImageView alloc] initWithFrame:CGRectMake(0, headHight, kWIDTH, 82.5*kHEIGHT/667)];
    _headBackView.image = [UIImage imageNamed:@"jifen_topBJ"];
    [self.view addSubview:_headBackView];
    
    self.invitePeoLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 25 * FitHeight + headHight, kWIDTH / 3, 15)];
    _invitePeoLab.font = [UIFont systemFontOfSize:13 * FitHeight];
    _invitePeoLab.textColor = [UIColor whiteColor];
    _invitePeoLab.textAlignment = NSTextAlignmentCenter;
    _invitePeoLab.text = @"邀请人数（人）";
    [self.view addSubview:_invitePeoLab];
    
    self.inviteNum = [[UILabel alloc] initWithFrame:CGRectMake(0, 55 * FitHeight + headHight, kWIDTH / 3, 15)];
    _inviteNum.font = [UIFont systemFontOfSize:13 * FitHeight];
    _inviteNum.textColor = [UIColor whiteColor];
    _inviteNum.textAlignment = NSTextAlignmentCenter;
    _inviteNum.text = @"5";
    [self.view addSubview:_inviteNum];
    
    UIView *shuView1 = [[UIView alloc] initWithFrame:CGRectMake(kWIDTH / 3, 5, 1, 82.5 * kHEIGHT / 667 - 10)];
    shuView1.backgroundColor = [UIColor whiteColor];
    [self.headBackView addSubview:shuView1];
    
    UIView *shuView2 = [[UIView alloc] initWithFrame:CGRectMake(kWIDTH / 3 * 2, 5, 1, 82.5 * kHEIGHT / 667 - 10)];
    shuView2.backgroundColor = [UIColor whiteColor];
    [self.headBackView addSubview:shuView2];
    
    self.backJifenLab = [[UILabel alloc] initWithFrame:CGRectMake(kWIDTH / 3, 25 * FitHeight + headHight, kWIDTH / 3, 15)];
    _backJifenLab.font = [UIFont systemFontOfSize:13 * FitHeight];
    _backJifenLab.textColor = [UIColor whiteColor];
    _backJifenLab.textAlignment = NSTextAlignmentCenter;
    _backJifenLab.text = @"已返积分（个）";
    [self.view addSubview:_backJifenLab];
    
    self.jifenNum = [[UILabel alloc] initWithFrame:CGRectMake(kWIDTH / 3, 55 * FitHeight + headHight, kWIDTH / 3, 15)];
    _jifenNum.font = [UIFont systemFontOfSize:13 * FitHeight];
    _jifenNum.textColor = [UIColor whiteColor];
    _jifenNum.textAlignment = NSTextAlignmentCenter;
    _jifenNum.text = @"100";
    [self.view addSubview:_jifenNum];
    
    self.xianJinQuanLab = [[UILabel alloc] initWithFrame:CGRectMake(kWIDTH / 3 * 2, 25 * FitHeight + headHight, kWIDTH / 3, 15)];
    _xianJinQuanLab.font = [UIFont systemFontOfSize:13 * FitHeight];
    _xianJinQuanLab.textColor = [UIColor whiteColor];
    _xianJinQuanLab.textAlignment = NSTextAlignmentCenter;
    _xianJinQuanLab.text = @"已返现金券（元）";
    [self.view addSubview:_xianJinQuanLab];
    
    self.xianJinNum = [[UILabel alloc] initWithFrame:CGRectMake(kWIDTH / 3 * 2, 55 * FitHeight + headHight, kWIDTH / 3, 15)];
    _xianJinNum.font = [UIFont systemFontOfSize:13 * FitHeight];
    _xianJinNum.textColor = [UIColor whiteColor];
    _xianJinNum.textAlignment = NSTextAlignmentCenter;
    _xianJinNum.text = @"10000";
    [self.view addSubview:_xianJinNum];
    
    self.yaoQingMalab = [[UILabel alloc] initWithFrame:CGRectMake(15, 82.5 * kHEIGHT / 667 + headHight, kWIDTH - 15, 50 * FitHeight)];
    _yaoQingMalab.font = [UIFont systemFontOfSize:14 * FitHeight];
    _yaoQingMalab.text = @"我的邀请码";
    [self.view addSubview:_yaoQingMalab];
    
    self.yaoQingMatext = [[UILabel alloc] initWithFrame:CGRectMake(kWIDTH - 130, 0, 100, 50 * FitHeight)];
    _yaoQingMatext.font = [UIFont systemFontOfSize:14*FitHeight];
    _yaoQingMatext.textAlignment = NSTextAlignmentRight;
    _yaoQingMatext.textColor = [XXColor labGoldenColor];
    _yaoQingMatext.text = @"4KZC";
    [_yaoQingMalab addSubview:_yaoQingMatext];
    
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(5, 49, kWIDTH - 20, 1)];
    lineView.backgroundColor = GetColor(@"e8e8e8");
    [_yaoQingMalab addSubview:lineView];
    
    
    self.InviteHisBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 82.5*kHEIGHT/667 + headHight + 50 *FitHeight, kWIDTH, 50)];
    [_InviteHisBtn addTarget:self action:@selector(InviteHistoryAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_InviteHisBtn];
    
    self.InviteLabel  = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, kWIDTH - 15, 50 * FitHeight)];
    _InviteLabel.font = [UIFont systemFontOfSize:14 * FitHeight];
    _InviteLabel.text = @"我的邀请记录";
    [_InviteHisBtn addSubview:_InviteLabel];
    
    self.lookLabel = [[UILabel alloc] initWithFrame:CGRectMake(kWIDTH - 40 - 100, 0, 100, 50 * FitHeight)];
    _lookLabel.font = [UIFont systemFontOfSize:14 * FitHeight];
    _lookLabel.textAlignment = NSTextAlignmentRight;
    _lookLabel.text = @"查看";
    [_InviteHisBtn addSubview:_lookLabel];
    
    self.rightImg = [[UIImageView alloc] initWithFrame:CGRectMake(kWIDTH - 30, 17, 16, 16)];
    _rightImg.image = [UIImage imageNamed:@"enter_1"];
    [_InviteHisBtn addSubview:_rightImg];
    
    UIView *zhongView = [[UIView alloc] initWithFrame:CGRectMake(0, 82.5*kHEIGHT/667 + headHight + 100 *FitHeight, kWIDTH, 10)];
    zhongView.backgroundColor = GetColor(@"#e9e9e9");
    [self.view addSubview:zhongView];
    
    CGFloat high = 82.5*kHEIGHT/667 + headHight + 100 *FitHeight + 10;
    
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(15, high, kWIDTH - 15, 50 * FitHeight)];
    label1.font = [UIFont systemFontOfSize:15];
    label1.textColor = [UIColor redColor];
    label1.text = @"新手礼包火热升级，邀请朋友一起来赚钱";
    [self.view addSubview:label1];
    
    UIView *lineView2 = [[UIView alloc] initWithFrame:CGRectMake(5, 49, kWIDTH - 20, 1)];
    lineView2.backgroundColor = GetColor(@"#e9e9e9");
    [label1 addSubview:lineView2];
    
    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(15, high + 50 * FitHeight, kWIDTH - 15, 50 * FitHeight)];
    label2.font = [UIFont systemFontOfSize:12 *FitHeight];
    label2.text = @"即日起成功邀请好友注册，您将获得500个积分";
    [self.view addSubview:label2];
    
    UIView *lineView3 = [[UIView alloc] initWithFrame:CGRectMake(5, 49, kWIDTH - 20, 1)];
    lineView3.backgroundColor = GetColor(@"#e9e9e9");
    [label2 addSubview:lineView3];
    
    self.inviteFriendBtn = [[UIButton alloc] initWithFrame:CGRectMake(15, high + 100 * FitHeight, kWIDTH - 30, 50 * FitHeight)];
    [_inviteFriendBtn addTarget:self action:@selector(inviteFriendAction) forControlEvents:UIControlEventTouchUpInside];
    [_inviteFriendBtn setTitle:@"邀请好友" forState:UIControlStateNormal];
    _inviteFriendBtn.titleLabel.font = [UIFont systemFontOfSize:16 * FitHeight];
    [_inviteFriendBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _inviteFriendBtn.backgroundColor = [XXColor purchaseBtnBgrdColor];
    [self.view addSubview:_inviteFriendBtn];
    
    UILabel *warningLabl = [[UILabel alloc] initWithFrame:CGRectMake(0, high + 150 * FitHeight, kWIDTH, 40)];
    warningLabl.text = @"使用非正常途径或手段获得的奖励无效，铭捷贷保留最终解释权利";
    warningLabl.font = [UIFont systemFontOfSize:10];
    warningLabl.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:warningLabl];
    
    self.codeImg = [[UIImageView alloc] initWithFrame:CGRectMake(kWIDTH / 2 - (kWIDTH - 30) / 6, high + 200 *FitHeight, (kWIDTH - 30) / 3, (kWIDTH - 30) / 3)];
    _codeImg.image = [UIImage imageNamed:@"tabX_mored_h"];
    [self.view addSubview:_codeImg];
    
    
    
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
