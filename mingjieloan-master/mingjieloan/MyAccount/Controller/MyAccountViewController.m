//
//  MyAccountViewController.m
//  mingjieloan
//
//  Created by vicki on 2016/12/20.
//  Copyright © 2016年 vicki. All rights reserved.
//

#import "MyAccountViewController.h"
#import "MyAccountTableViewCell.h"
#import "AccountHeadView.h"
#import "AccountRechargeTableViewController.h"
#import "WDXXViewController.h"
#import "MyCardViewController.h"


@interface MyAccountViewController ()<UITableViewDelegate,UITableViewDataSource,TrageRecordDelegate,RechargeDelegate>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong)  UILabel *titleText;

@property (nonatomic,strong)  UIImageView *levelImgV;

@property (nonatomic, strong) AccountHeadView *headView;
@end

@implementation MyAccountViewController

- (void)viewDidLoad {
    UIImageView *imageV= [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tab_logo"]];
    self.navigationItem.titleView = imageV;
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    rightButton.frame = CGRectMake(0, 0, 22, 15);
    [rightButton setBackgroundImage:[UIImage imageNamed:@"mailBox"] forState:UIControlStateNormal];
    [rightButton addTarget:self action:@selector(rightButton:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem = rightItem;
    UIBarButtonItem *backIetm = [[UIBarButtonItem alloc] init];
    
    backIetm.title =@"我的账户";
    
    self.navigationItem.backBarButtonItem = backIetm;
  
    
    [super viewDidLoad];

    [self createView];
    [self getMYInfo];
    [self getBasicInfo];

    
}


-(void)rightButton:(UIButton *)button {
    WDXXViewController *wdxxVc = [[WDXXViewController alloc] init];
    wdxxVc.sid =  [[NSUserDefaults standardUserDefaults] objectForKey:@"sid"];
    [self.navigationController pushViewController:wdxxVc animated:YES];
}

- (void)createView {
    self.titleText = [[UILabel alloc] initWithFrame: CGRectMake(0, 0, 100*FitWidth, 20 * FitHeight)];
    _titleText.textColor = [UIColor whiteColor];
   [_titleText setTextAlignment:NSTextAlignmentRight];
    self.levelImgV = [[UIImageView alloc] initWithFrame:CGRectMake(_titleText.right, _titleText.top, 60 * FitWidth, _titleText.font.lineHeight)];
    
    self.titleViews = [[UIView alloc] initWithFrame:CGRectMake(160*FitWidth, 0, _titleText.width + _levelImgV.width,_titleText.height)];
    [self.titleViews addSubview:_titleText];
    [self.titleViews addSubview:_levelImgV];
    
    

    self.headView = [[AccountHeadView alloc] initWithFrame:CGRectMake(0, 0, kWIDTH, kHEIGHT * 0.584)];
    _headView.delegate = self;
    _headView.recharge = self;
    [self.view addSubview:_headView];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kWIDTH, kHEIGHT ) style:UITableViewStyleGrouped];
    self.tableView.tableHeaderView = _headView;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.sectionHeaderHeight = 10 * FitHeight;
    self.tableView.sectionFooterHeight = 0;
    self.tableView.showsVerticalScrollIndicator = NO;
    UINib *nib = [UINib nibWithNibName:@"MyAccountTableViewCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"UITableViewCellIdentifier"];
    
    [self.view addSubview:self.tableView];
    
    
}


- (void)tradeRecord {
    JYJLViewController * jyjlVc = [[JYJLViewController alloc] init];
    jyjlVc.sid = [[NSUserDefaults standardUserDefaults] objectForKey:@"sid"];
    [self.navigationController pushViewController:jyjlVc animated:YES];
    
}

- (void)Recharge {
    AccountRechargeTableViewController * arVc = [[AccountRechargeTableViewController alloc] init];
    arVc.sid = [[NSUserDefaults standardUserDefaults] objectForKey:@"sid"];
    [self.navigationController pushViewController:arVc animated:YES];
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 4;
    }else {
        return 2;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSArray *imagearr = @[@"sign-11",@"huiyuanzhongxin",@"jiaoyijilu",@"xianjinquan",@"zhaiquanzhuanrang",@"yaoqingma",@"touzijilu",@"zhanghuzhongxin"];
    NSArray *labelarr = @[@"签到获取积分",@"会员中心",@"我的积分",@"我的卡劵",@"债权转让",@"回款计划",@"我的邀请",@"账户中心"];
    
    MyAccountTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCellIdentifier"];
    
    switch (indexPath.section) {
        case 0:
            [cell.imageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",imagearr[indexPath.row]]]];
            cell.label.text = labelarr[indexPath.row];
            break;
        case 1:
            [cell.imageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",imagearr[indexPath.row + 4]]]];
            cell.label.text = labelarr[indexPath.row + 4];
            break;
            
        case 2:
            [cell.imageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",imagearr[indexPath.row + 6]]]];
            cell.label.text = labelarr[indexPath.row + 6];
            break;
            
        default:
            break;
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.section) {
        case 0:
            //签到获取积分

            if (indexPath.row == 0) {
                if (self.userInfo.is_sign.boolValue == true) {
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"您已签到" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
                    [alert show];
                }else {
                    self.qiandao = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kWIDTH, kHEIGHT)];
                    [self getSigin];
                    [self.view addSubview:self.qiandao];
                    
                }
            
                
            }else if (indexPath.row  ==1){
                //会员中心(完成)
                HYZXViewController *hyzxVC = [[HYZXViewController alloc] init];
                hyzxVC.sid = [[NSUserDefaults standardUserDefaults] objectForKey:@"sid"];
                [self.navigationController pushViewController:hyzxVC animated:YES];
                
            }else if (indexPath.row  ==2){
                //我的积分（完成）
                
                JFViewController *jfViewController = [[JFViewController alloc] init];
                
                jfViewController.sid = [[NSUserDefaults standardUserDefaults] objectForKey:@"sid"];
                
                [self.navigationController pushViewController:jfViewController animated:YES];
            }else {
                //我的卡劵
                MyCardViewController *mycard = [[MyCardViewController alloc] init];
                [self.navigationController pushViewController:mycard animated:YES];
            }
           
            break;
        case 1:
            if (indexPath.row == 0) {
                //债权转让
                LDY_RightChangeViewController *zqzrVC = [[LDY_RightChangeViewController alloc] init];
                
                zqzrVC.sid = [[NSUserDefaults standardUserDefaults] objectForKey:@"sid"];
                
                [self.navigationController pushViewController:zqzrVC animated:YES];
                
                
            }else if (indexPath.row  ==1){
                //回款计划(完成)
                DepositsHistoryViewController *depositsHVC = [[DepositsHistoryViewController alloc] init];
                  depositsHVC.sid = [[NSUserDefaults standardUserDefaults] objectForKey:@"sid"];
                 [self.navigationController pushViewController:depositsHVC animated:YES];
                
            }
            break;
            
        case 2:
            if (indexPath.row == 0) {
                //我的邀请
                JGProgressHUD *hud = [[JGProgressHUD alloc] initWithStyle:0];
                
                hud.textLabel.text = @"loading...";
                
                [hud showInView:self.view];
                NSDictionary *dic = @{@"sid":[[NSUserDefaults standardUserDefaults] valueForKey:@"sid"],@"page":@"0"};
                [VVNetWorkTool postWithUrl:Url(INVITATION) body:dic bodyType:BodyTypeDictionary httpHeader:nil responseType:ResponseTypeDATA progress:^(NSProgress *progress) {
                    
                    
                } success:^(id result) {
                    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:result options:NSJSONReadingMutableContainers error:nil];
                    [hud dismiss];
                    //        NSLog(@"dic == %@", dic);
                    
                    if([[dic objectForKey:@"uid_level"] intValue] == 3){
                        DHFInviteFriendViewController  *InviteVC = [[DHFInviteFriendViewController alloc] init];
                        InviteVC.recommendationUrl = [dic objectForKey:@"recommendationUrl"];
                        InviteVC.cashReturned = [[dic objectForKey:@"cashReturned"] integerValue];//邀请人数
                        InviteVC.cashToReturn = [[dic objectForKey:@"cashToReturn"] integerValue];//已返现金
                        InviteVC.couponCashSum = [[dic objectForKey:@"couponCashSum"] integerValue];//待返现金
                        InviteVC.incentive_commission = [[dic objectForKey:@"incentive_commission"] integerValue];//获得现金券
                        InviteVC.invitationCount = [[dic objectForKey:@"invitationCount"] integerValue];//已返积分
                        InviteVC.refCode = [dic objectForKey:@"refCode"];
                        [self.navigationController pushViewController:InviteVC animated:YES];
                    }
                    else if ([[dic objectForKey:@"uid_level"] intValue] == 2)
                    {
                        HDFInviteFriendOtherViewController *otherVc = [[HDFInviteFriendOtherViewController alloc] init];
                        otherVc.recommendationUrl = [dic objectForKey:@"recommendationUrl"];
                        otherVc.cashReturned = [[dic objectForKey:@"cashReturned"] integerValue];//邀请人数
                        otherVc.cashToReturn = [[dic objectForKey:@"cashToReturn"] integerValue];//已返现金
                        otherVc.couponCashSum = [[dic objectForKey:@"couponCashSum"] integerValue];//待返现金
                        otherVc.incentive_commission = [[dic objectForKey:@"incentive_commission"] integerValue];//获得现金券
                        otherVc.invitationCount = [[dic objectForKey:@"invitationCount"] integerValue];//已返积分
                        otherVc.refCode = [dic objectForKey:@"refCode"];
                        [self.navigationController pushViewController:otherVc animated:YES];
                        
                    }
                } fail:^(NSError *error) {
                    
                    [hud dismiss];
                }];

                
            }else if (indexPath.row  ==1){
                //账户中心
                DHFUserCenterViewController *shiyanVC = [[DHFUserCenterViewController alloc] init];
                [self.navigationController pushViewController:shiyanVC animated:YES];
                
            }
            break;
            
        default:
            break;
    }
    NSLog(@"%ld, %ld", indexPath.row, indexPath.section);
}

//签到
-(void)createqiandaoView {
  
    UIView *background = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.qiandao.width, self.qiandao.height)];
    background.backgroundColor = [UIColor grayColor];
    background.alpha = 0.8;
    [self.qiandao addSubview: background];
    
    UIImageView *images = [[UIImageView alloc] initWithFrame:CGRectMake(29 *FitWidth, 109 * FitHeight, kWIDTH - 60 *FitWidth, kHEIGHT - 300 * FitHeight)];
    
    UILabel *qiandaolabel = [[UILabel alloc] initWithFrame:CGRectMake(150 *FitWidth, 175*FitHeight, 160 * FitWidth, 40 * FitHeight)];
    qiandaolabel.textColor = [XXColor labelGoldenColor];
    
    if ([self.signModel.signCnt isEqualToString:@"0"]) {
         images.image = [UIImage imageNamed:@"sign-60"];
        qiandaolabel.text = @"连续签到7天";
    }else {
        images.image = [UIImage imageNamed:@"sign-10"];
        qiandaolabel.text = [NSString stringWithFormat:@"连续签到%@天",self.signModel.signCnt];
    }
    
    
    UIButton *knowBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    knowBtn.frame = CGRectMake(130 * FitWidth, kHEIGHT - 275 * FitHeight, 160 * FitWidth, 60 * FitHeight);
    [knowBtn addTarget:self action:@selector(knowBtnDidSelected:) forControlEvents:UIControlEventTouchUpInside];
    
    
    [self.qiandao addSubview:images];
    [self.qiandao addSubview:qiandaolabel];
    [self.qiandao addSubview:knowBtn];

    
}

-(void)knowBtnDidSelected:(UIButton *)button {
    [self.qiandao removeFromSuperview];
}

-(void)getSigin{
    NSDictionary *dic = @{@"sid":[[NSUserDefaults standardUserDefaults] objectForKey:@"sid"]};
    [VVNetWorkTool postWithUrl:Url(SIGN) body:dic bodyType:BodyTypeDictionary httpHeader:nil responseType:0 progress:^(NSProgress *progress) {
        
    } success:^(id result) {
        self.signModel = [[signModel alloc] initWithDictionary:result];
         [self createqiandaoView];
    } fail:^(NSError *error) {
        
    }];
}

- (void)getMYInfo {
    NSDictionary *dic = @{@"sid":[[NSUserDefaults standardUserDefaults] objectForKey:@"sid"]};
    [VVNetWorkTool postWithUrl:Url(MY) body:dic bodyType:1 httpHeader:nil responseType:0 progress:^(NSProgress *progress) {
        
    } success:^(id result) {
        [self.userInfo setValuesForKeysWithDictionary:result];
        self.headView.userInfo = self.userInfo;
        
    } fail:^(NSError *error) {
        
    }];
}



- (void)getBasicInfo {
    JGProgressHUD *hud = [[JGProgressHUD alloc] initWithStyle:0];
    
    hud.textLabel.text = @"loading...";
    
    [hud showInView:self.view];

    NSDictionary *dic = @{@"sid":[[NSUserDefaults standardUserDefaults] objectForKey:@"sid"]};
    [VVNetWorkTool postWithUrl:Url(MYBASIC) body:dic bodyType:1 httpHeader:nil responseType:0 progress:^(NSProgress *progress) {
        
    } success:^(id result) {
        [hud dismiss];
        [self.basicInfo setValuesForKeysWithDictionary:result];
        self.headView.basicInfo = self.basicInfo;
        _titleText.text = self.basicInfo.name;
        NSString *VipImageName = [NSString stringWithFormat:@"vip_%@",self.basicInfo.member_level];
        _levelImgV.image = [UIImage imageNamed:VipImageName];
        self.navigationItem.titleView=self.titleViews;
        
        
    } fail:^(NSError *error) {
        
    }];
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
