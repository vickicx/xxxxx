//
//  HDFInviteFriendOtherViewController.m
//  mingjieloan
//
//  Created by kang on 16/12/29.
//  Copyright © 2016年 mingjie. All rights reserved.
//

#import "HDFInviteFriendOtherViewController.h"

@interface HDFInviteFriendOtherViewController ()

@end




@implementation HDFInviteFriendOtherViewController


- (void)viewWillAppear:(BOOL)animated{
    
    
    CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    // 2.恢复默认
    [filter setDefaults];
    // 3.给过滤器添加数据
    NSString *dataString = [NSString stringWithFormat:@"http://%@", self.recommendationUrl];
    NSData *data = [dataString dataUsingEncoding:NSUTF8StringEncoding];
    // 4.通过KVO设置滤镜inputMessage数据
    [filter setValue:data forKeyPath:@"inputMessage"];
    // 4.获取输出的二维码
    CIImage *outputImage = [filter outputImage];
    // 5.将CIImage转换成UIImage，并放大显示
    self.codeImg.image = [UIImage imageWithCIImage:outputImage scale:20.0 orientation:UIImageOrientationUp];
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"邀请好友";
    self.view.backgroundColor = [UIColor whiteColor];
    NSDictionary * titleDict=[NSDictionary dictionaryWithObject:[UIColor whiteColor] forKey:UITextAttributeTextColor];
    self.navigationController.navigationBar.titleTextAttributes = titleDict;
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    [self createViews];

}

//跳到历史记录
- (void)InviteHistoryAction{
    DHFInviteHistoryViewController *InviteVC = [[DHFInviteHistoryViewController alloc] init];
    [self.navigationController pushViewController:InviteVC animated:YES];
}

//邀请好友
- (void)inviteFriendAction{
    
}

- (void)createViews{
    
    NSString *textStr = @"邀请好友注册投资奖励：\n1.即日起成功邀请好友注册，您将获得500个积分；\n2.好友使用您的邀请码投资，您将获得哈呦投资金额年化1%的现金奖励；";
    CGFloat textHigh = [HeightWithString getSpaceLabelHeight:textStr withFont:[UIFont systemFontOfSize:12 *FitHeight] withWidth:kWIDTH - 30];
    CGFloat headHight = 0;
    CGFloat maxHigh = 55 + headHight + 70 + 10  + 200 *FitHeight + 20  + 100 * FitHeight + textHigh + 80 + (kWIDTH - 30) / 3;
    
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.backgroundColor = [UIColor whiteColor];
    scrollView.scrollEnabled = YES;
    scrollView.contentSize =  CGSizeMake(kWIDTH, maxHigh);
    self.view = scrollView;
    
    self.headBackView = [[UIImageView alloc] initWithFrame:CGRectMake(0, headHight, kWIDTH, 50)];
    _headBackView.image = [UIImage imageNamed:@"jifen_topBJ"];
    [self.view addSubview:_headBackView];
    
    self.invitePeoLab = [[UILabel alloc] initWithFrame:CGRectMake(15,headHight, kWIDTH, 50)];
    _invitePeoLab.font = [UIFont systemFontOfSize:15];
    _invitePeoLab.textColor = [UIColor whiteColor];
    _invitePeoLab.text = @"邀请人数（人）";
    [self.view addSubview:_invitePeoLab];
    
    self.inviteNum = [[UILabel alloc] initWithFrame:CGRectMake(kWIDTH - 60,headHight, 50, 50)];
    _inviteNum.font = [UIFont systemFontOfSize:15];
    _inviteNum.textColor = [UIColor whiteColor];
    _inviteNum.textAlignment = NSTextAlignmentRight;
    _inviteNum.text = [NSString stringWithFormat:@"%ld", _cashReturned];
    [self.view addSubview:_inviteNum];
    
    self.backMoneyLab = [[UILabel alloc]initWithFrame:CGRectMake(0, headHight + 50, kWIDTH / 8 * 3, 50)];
    _backMoneyLab.textAlignment = NSTextAlignmentCenter;
    _backMoneyLab.font = [UIFont systemFontOfSize:13 * FitHeight];
    _backMoneyLab.text = @"已返金额（元）";
    [self.view addSubview:_backMoneyLab];
    
    self.backMoneyNum = [[UILabel alloc] initWithFrame:CGRectMake(0, headHight + 100, kWIDTH / 8 * 3, 12)];
    _backMoneyNum.font = [UIFont systemFontOfSize:11];
    _backMoneyNum.textAlignment = NSTextAlignmentCenter;
    _backMoneyNum.text = [NSString stringWithFormat:@"%ld", self.cashToReturn];
    [self.view addSubview:_backMoneyNum];
    
    UIView *shuView1 = [[UIView alloc] initWithFrame:CGRectMake(kWIDTH / 8 * 3 - 5, headHight + 55, 1, 70)];
    shuView1.backgroundColor = GetColor(@"#e8e8e8");
    [self.view addSubview:shuView1];
    
    self.waitBackLab = [[UILabel alloc]initWithFrame:CGRectMake(kWIDTH / 8 * 3, headHight + 50, kWIDTH / 4, 50)];
    _waitBackLab.textAlignment = NSTextAlignmentCenter;
    _waitBackLab.font = [UIFont systemFontOfSize:13 * FitHeight];
    _waitBackLab.text = @"待返金额（元）";
    [self.view addSubview:_waitBackLab];
    
    self.waitBackNum = [[UILabel alloc] initWithFrame:CGRectMake(kWIDTH / 8 * 3, headHight + 100, kWIDTH / 4, 12)];
    _waitBackNum.font = [UIFont systemFontOfSize:11];
    _waitBackNum.textAlignment = NSTextAlignmentCenter;
    _waitBackNum.text = [NSString stringWithFormat:@"%ld", self.couponCashSum];
    [self.view addSubview:_waitBackNum];
    
    UIView *shuView2 = [[UIView alloc] initWithFrame:CGRectMake(kWIDTH / 8 * 5, headHight + 55, 1, 70)];
    shuView2.backgroundColor = GetColor(@"#e8e8e8");
    [self.view addSubview:shuView2];
    
    self.backJifenLab = [[UILabel alloc]initWithFrame:CGRectMake(kWIDTH / 8 * 5, headHight + 50, kWIDTH / 8 * 3, 50)];
    _backJifenLab.textAlignment = NSTextAlignmentCenter;
    _backJifenLab.font = [UIFont systemFontOfSize:13 * FitHeight];
    _backJifenLab.text = @"已返积分（个）";
    [self.view addSubview:_backJifenLab];
    
    self.jifenNum = [[UILabel alloc] initWithFrame:CGRectMake(kWIDTH / 8 * 5, headHight + 100, kWIDTH / 8 * 3, 12)];
    _jifenNum.font = [UIFont systemFontOfSize:11];
    _jifenNum.textAlignment = NSTextAlignmentCenter;
    _jifenNum.text = [NSString stringWithFormat:@"%ld", self.invitationCount];
    [self.view addSubview:_jifenNum];
    
    UIView *backView1 = [[UIView alloc] initWithFrame:CGRectMake(0, 55 + headHight + 70, kWIDTH, 10)];
    backView1.backgroundColor = GetColor(@"#e8e8e8");
    [self.view addSubview:backView1];
    
    CGFloat high = 55 + headHight + 70 + 10;
    
    self.yaoQingMalab = [[UILabel alloc] initWithFrame:CGRectMake(15, high, kWIDTH - 15, 50 * FitHeight)];
    _yaoQingMalab.font = [UIFont systemFontOfSize:14 * FitHeight];
    _yaoQingMalab.text = @"我的邀请码";
    [self.view addSubview:_yaoQingMalab];
    
    self.yaoQingMatext = [[UILabel alloc] initWithFrame:CGRectMake(kWIDTH - 130, 0, 100, 50 * FitHeight)];
    _yaoQingMatext.font = [UIFont systemFontOfSize:14*FitHeight];
    _yaoQingMatext.textAlignment = NSTextAlignmentRight;
    _yaoQingMatext.textColor = [XXColor labGoldenColor];
    _yaoQingMatext.text = _refCode;
    [_yaoQingMalab addSubview:_yaoQingMatext];
    
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(5, 49 * FitHeight, kWIDTH - 20, 1)];
    lineView.backgroundColor = GetColor(@"e8e8e8");
    [_yaoQingMalab addSubview:lineView];
    
    self.yongJinlab = [[UILabel alloc] initWithFrame:CGRectMake(15, high + 50 * FitHeight, kWIDTH - 15, 50 * FitHeight)];
    _yongJinlab.font = [UIFont systemFontOfSize:14 * FitHeight];
    _yongJinlab.text = @"奖励年化佣金";
    [self.view addSubview:_yongJinlab];
    
    self.yongJintext = [[UILabel alloc] initWithFrame:CGRectMake(kWIDTH - 130, 0, 100, 50 * FitHeight)];
    _yongJintext.font = [UIFont systemFontOfSize:14*FitHeight];
    _yongJintext.textAlignment = NSTextAlignmentRight;
    _yongJintext.textColor = [XXColor labGoldenColor];
    _yongJintext.text = [NSString stringWithFormat:@"%ld", self.yongjinshouyi];
    [_yongJinlab addSubview:_yongJintext];
    
    UIView *lineView2 = [[UIView alloc] initWithFrame:CGRectMake(5, 49 * FitHeight, kWIDTH - 20, 1)];
    lineView2.backgroundColor = GetColor(@"#e9e9e9");
    [_yongJinlab addSubview:lineView2];
    
    self.InviteHisBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, high + 100 *FitHeight, kWIDTH, 50)];
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
    
    self.rightImg = [[UIImageView alloc] initWithFrame:CGRectMake(kWIDTH - 30, 17 * FitHeight, 16, 16)];
    _rightImg.image = [UIImage imageNamed:@"enter_1"];
    [_InviteHisBtn addSubview:_rightImg];
    
    UIView *backView2 = [[UIView alloc] initWithFrame:CGRectMake(0, high + 150 *FitHeight, kWIDTH, 10)];
    backView2.backgroundColor = GetColor(@"#e8e8e8");
    [self.view addSubview:backView2];

    CGFloat high2 = high + 150 *FitHeight + 20;
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(15, high2, kWIDTH - 15, 40 * FitHeight)];
    label1.font = [UIFont systemFontOfSize:15];
    label1.textColor = [UIColor redColor];
    label1.text = @"新手礼包火热升级，邀请朋友一起来赚钱";
    [self.view addSubview:label1];
    
    UIView *lineView3 = [[UIView alloc] initWithFrame:CGRectMake(5, 30 * FitHeight, kWIDTH - 20, 1)];
    lineView3.backgroundColor = GetColor(@"#e9e9e9");
    [label1 addSubview:lineView3];
    
    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(15, high2 + 50 * FitHeight, kWIDTH - 30, 50 * FitHeight)];
    label2.font = [UIFont systemFontOfSize:12 *FitHeight];
    label2.numberOfLines = 0;
    [HeightWithString setLabelSpace:label2 withValue:textStr withFont:[UIFont systemFontOfSize:12 * FitHeight]];
    label2.frame = CGRectMake(15, high2 + 50 * FitHeight, kWIDTH - 30, textHigh);
    [self.view addSubview:label2];
    
    UILabel *label3 = [[UILabel alloc] initWithFrame:CGRectMake(20, high2 + 50 * FitHeight + textHigh, kWIDTH - 30, 40)];
    label3.font = [UIFont systemFontOfSize:11 *FitHeight];
    label3.text = @"(投资项目满标并成功放款，返利将在10个工作日内进入您的铭捷贷账户)";
    [self.view addSubview:label3];
    
    UIView *lineView4 = [[UIView alloc] initWithFrame:CGRectMake(5, high2 + 50 * FitHeight + textHigh + 70, kWIDTH - 20, 1)];
    lineView4.backgroundColor = GetColor(@"#e9e9e9");
    [self.view addSubview:lineView4];
    
    self.inviteFriendBtn = [[UIButton alloc] initWithFrame:CGRectMake(15, high2 + 50 * FitHeight + textHigh + 80, kWIDTH - 30, 50 * FitHeight)];
    [_inviteFriendBtn addTarget:self action:@selector(inviteFriendAction) forControlEvents:UIControlEventTouchUpInside];
    [_inviteFriendBtn setTitle:@"邀请好友" forState:UIControlStateNormal];
    _inviteFriendBtn.titleLabel.font = [UIFont systemFontOfSize:16 * FitHeight];
    [_inviteFriendBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _inviteFriendBtn.backgroundColor = [XXColor purchaseBtnBgrdColor];
    [self.view addSubview:_inviteFriendBtn];
    
    UILabel *warningLabl = [[UILabel alloc] initWithFrame:CGRectMake(0, high2 + 100 * FitHeight + textHigh + 80, kWIDTH, 40)];
    warningLabl.text = @"使用非正常途径或手段获得的奖励无效，铭捷贷保留最终解释权利";
    warningLabl.font = [UIFont systemFontOfSize:10];
    warningLabl.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:warningLabl];
    
    self.codeImg = [[UIImageView alloc] initWithFrame:CGRectMake(kWIDTH / 2 - (kWIDTH - 30) / 6, high2 + 150 * FitHeight + textHigh + 80, (kWIDTH - 30) / 3, (kWIDTH - 30) / 3)];
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
