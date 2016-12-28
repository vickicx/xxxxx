//
//  MoreInfoViewController.m
//  mingjieloan
//
//  Created by vicki on 2016/12/20.
//  Copyright © 2016年 vicki. All rights reserved.
//

#import "MoreInfoViewController.h"


@interface MoreInfoViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong)NSMutableArray *titleArray;
@property (nonatomic, strong)NSMutableArray *imageArray;



@end

@implementation MoreInfoViewController

-(void)viewWillAppear:(BOOL)animated{
    
    NSLog(@"%@",self.basicInfo.idCard);
    self.tabBarController.tabBar.hidden = false;
    
    if ([[[NSUserDefaults standardUserDefaults] objectForKey:@"isLogin"] length] > 0) {
        self.logOutBtn.hidden = NO;
    } else {
        self.logOutBtn.hidden = YES;
    }
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView *imageV= [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tab_logo"]];
    self.navigationItem.titleView = imageV;
    // Do any additional setup after loading the view.
    
    UIBarButtonItem *backbutton = [[UIBarButtonItem alloc]init];
    backbutton.title = @"返回";
    self.navigationItem.backBarButtonItem = backbutton;
    
    
    self.titleArray = [NSMutableArray arrayWithObjects:@"关于铭捷贷", @"平台公告", @"媒体报道", @"帮助中心", @"邀请好友", @"拨打客服电话",nil];
    self.imageArray = [NSMutableArray arrayWithObjects:@"more_aboutus", @"pingtaigonggao", @"meitibaodao", @"bangzhuzhongxin", @"fenxianghaoyou", @"kefudianhua",nil];
    
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kWIDTH, kHEIGHT) style:UITableViewStylePlain];
    _tableView.separatorStyle = UITableViewCellAccessoryNone;
    _tableView.backgroundColor = GetColor(@"#EAE9EF");
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    UIView *topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kWIDTH, 10)];
    topView.backgroundColor = GetColor(@"#E6E3EE");
    _tableView.tableHeaderView = topView;
    
    self.bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kWIDTH, 100)];
    _bottomView.backgroundColor = GetColor(@"#EAE9EF");
    _tableView.tableFooterView = _bottomView;
    
    self.logOutBtn = [[UIButton alloc] initWithFrame:CGRectMake(15, 5, kWIDTH - 30, 50)];
    [_logOutBtn addTarget:self action:@selector(logOutAction) forControlEvents:UIControlEventTouchUpInside];
    [_logOutBtn setTitle:@"退出登陆" forState:UIControlStateNormal];
    _logOutBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [_logOutBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _logOutBtn.backgroundColor = GetColor(@"#805919");
    [_bottomView addSubview:_logOutBtn];
}

//退出登录
- (void)logOutAction{
    
    
    
    AHAlertView *alert = [[AHAlertView alloc] initWithTitle:@"温馨提示"
                                                    message:@"确定要退出登陆吗"];
    [alert setCancelButtonTitle:@"取消" block:nil];
    __block MoreInfoViewController *blockSelf = self;
    [alert addButtonWithTitle:@"确定" block:^{
        
        [blockSelf logOut];//也可以不加到
    }];
    [alert show];
    
    
}

- (void)logOut{
    
    JGProgressHUD *hud = [[JGProgressHUD alloc] initWithStyle:0];
    
    hud.textLabel.text = @"退出中...";
    
    [hud showInView:self.view];
    
    NSDictionary *dic = @{@"sid":[[NSUserDefaults standardUserDefaults] valueForKey:@"sid"]};
    
    [VVNetWorkTool postWithUrl:Url(LOGOUT) body:dic bodyType:1 httpHeader:nil responseType:0 progress:^(NSProgress *progress) {
        
    } success:^(id result) {
        if (result) {
            [hud dismiss];
            // 储存用户的信息
            
            if ([result[@"status"] integerValue] == 0) {
                [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"sid"];
                [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"uid"];
                [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"username"];
                [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"rtnUrl"];
                [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"isLogin"];
                self.logOutBtn.hidden = YES;
                
                [[NSNotificationCenter defaultCenter] postNotificationName:@"logoutSuccess" object:nil];
            }
            
        }
        
    } fail:^(NSError *error) {
        [hud dismiss];
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 6;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0 || indexPath.row == 1 || indexPath.row == 2)
    {
        return 50;
    }
    else if(indexPath.row == 3 || indexPath.row == 4)
    {
        return 60;
    }
    else{
        return 65;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"MoreCell";
    DHFMoreTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[DHFMoreTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.titleImg.image = [UIImage imageNamed:self.imageArray[indexPath.row]];
    cell.titlLab.text = self.titleArray[indexPath.row];
    if (indexPath.row == 3 || indexPath.row == 4) {
        cell.bottomView.frame = CGRectMake(0, 50, kWIDTH, 10);
    }
    if (indexPath.row == 5){
        cell.bottomView.frame = CGRectMake(0, 50, kWIDTH, 15);
    }
    
    
    return  cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //跳转到关于铭捷贷
    if (indexPath.row == 0) {
        self.hidesBottomBarWhenPushed=YES;
        DHFAboutMJViewController *AboutVC = [[DHFAboutMJViewController alloc] init];
        [self.navigationController pushViewController:AboutVC animated:YES];
        self.hidesBottomBarWhenPushed=NO;
    }
    else if (indexPath.row == 1){
        self.hidesBottomBarWhenPushed=YES;
        DHFNoticeViewController *noticeVC = [[DHFNoticeViewController alloc]init];
        [self.navigationController pushViewController:noticeVC animated:YES];
        self.hidesBottomBarWhenPushed=NO;
    }
    //媒体报道
    else if(indexPath.row == 2){
        self.hidesBottomBarWhenPushed=YES;
        DHFReportViewController *reportVC = [[DHFReportViewController alloc] init];
        [self.navigationController pushViewController:reportVC animated:YES];
        self.hidesBottomBarWhenPushed=NO;
    }
    else if (indexPath.row == 3){
        self.hidesBottomBarWhenPushed=YES;
        DHFHelpCenterViewController  *helpVC = [[DHFHelpCenterViewController alloc] init];
        [self.navigationController pushViewController:helpVC animated:YES];
        self.hidesBottomBarWhenPushed=NO;
    }
    else if (indexPath.row == 4){
        
        if ([[NSUserDefaults standardUserDefaults] objectForKey:@"username"] != nil) {
            [self getInviteFriendViewVC];
        }
        else
        {
            AHAlertView *alert = [[AHAlertView alloc] initWithTitle:@"温馨提示"message:@"请先登陆"];
            [alert setCancelButtonTitle:@"取消" block:nil];
                [alert addButtonWithTitle:@"确定" block:^{
                    
                }];
            [alert show];
        }


    }
    else if (indexPath.row ==5){
        
//                AHAlertView *alert = [[AHAlertView alloc] initWithTitle:@"温馨提示"
//                                                                message:@"确定拨打客服电话400-807-6777"];
        //        [alert setCancelButtonTitle:@"取消" block:nil];
        //        __block MoreInfoViewController *blockSelf = self;
        //        [alert addButtonWithTitle:@"确定" block:^{
        //            UIWebView *callWebView = [[UIWebView alloc]init];
        //
        //            [callWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"4008076777"]]];
        //
        //            [blockSelf.view addSubview:callWebView];//也可以不加到
        //        }];
        //        [alert show];
        DHFUserCenterViewController *shiyanVC = [[DHFUserCenterViewController alloc] init];
        [self.navigationController pushViewController:shiyanVC animated:YES];
    }
}



- (void)getInviteFriendViewVC{
    
    JGProgressHUD *hud = [[JGProgressHUD alloc] initWithStyle:0];
    
    hud.textLabel.text = @"loading...";
    
    [hud showInView:self.view];
    NSDictionary *dic = @{@"sid":[[NSUserDefaults standardUserDefaults] valueForKey:@"sid"],@"page":@"0"};
    [VVNetWorkTool postWithUrl:Url(INVITATION) body:dic bodyType:BodyTypeDictionary httpHeader:nil responseType:ResponseTypeDATA progress:^(NSProgress *progress) {
        
        
    } success:^(id result) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:result options:NSJSONReadingMutableContainers error:nil];
        [hud dismiss];
        NSLog(@"dic == %@", dic);
        
        DHFInviteFriendViewController  *InviteVC = [[DHFInviteFriendViewController alloc] init];
        InviteVC.recommendationUrl = [dic objectForKey:@"recommendationUrl"];
        [self.navigationController pushViewController:InviteVC animated:YES];
        
        
    } fail:^(NSError *error) {
        
        [hud dismiss];
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
