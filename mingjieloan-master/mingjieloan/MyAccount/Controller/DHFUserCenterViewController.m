//
//  DHFUserCenterViewController.m
//  mingjieloan
//
//  Created by kang on 16/12/27.
//  Copyright © 2016年 mingjie. All rights reserved.
//

#import "DHFUserCenterViewController.h"

@interface DHFUserCenterViewController ()<UITableViewDelegate, UITableViewDataSource, JGProgressHUDDelegate>

@property (nonatomic, strong)NSArray *imageArray;
@property (nonatomic, strong)NSArray *nameArray;

@end

@implementation DHFUserCenterViewController


- (void)viewWillAppear:(BOOL)animated {
    
    self.passWord = [[NSUserDefaults standardUserDefaults] objectForKey:@"UserGesturePassword"];
    if (self.passWord == nil) {
        self.switchView.on = NO;
    }
    else
    {
        self.switchView.on = YES;
    }
    [self getUserInfo];
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.imageArray = [NSArray arrayWithObjects:@"shezhiyonghuming", @"bangdingshouji", @"bangdingsfz", @"card", @"shezhishoushimima", @"xiugaidenglumima", @"xiugaidenglumima", nil];
    self.nameArray = [NSArray arrayWithObjects:@"用户名", @"修改绑定手机号", @"身份认证", @"绑定银行卡", @"启用手势密码", @"修改登陆密码", @"修改支付密码", nil];
    
    
    
    self.title = @"帐户中心";
    self.view.backgroundColor = [UIColor whiteColor];
    NSDictionary * titleDict=[NSDictionary dictionaryWithObject:[UIColor whiteColor] forKey:UITextAttributeTextColor];
    self.navigationController.navigationBar.titleTextAttributes = titleDict;
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    
    self.switchView = [[UISwitch alloc] initWithFrame:CGRectMake(kWIDTH - 70, 10, 40, 40)];
    [self.switchView addTarget:self action:@selector(switchAction:) forControlEvents:UIControlEventValueChanged];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kWIDTH, kHEIGHT) style:UITableViewStylePlain];
    _tableView.separatorStyle = UITableViewCellAccessoryNone;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 7;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellIdentifier = @"UserCenterCell";
    DHFUserCenterCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[DHFUserCenterCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    cell.titleImg.image = [UIImage imageNamed:self.imageArray[indexPath.row]];
    cell.titleLab.text = self.nameArray[indexPath.row];
    cell.textLab.hidden = NO;
    cell.rightImg.hidden = NO;
    cell.textLab.hidden = NO;
    if (indexPath.row == 0) {
        cell.rightImg.hidden = YES;
        cell.textLab.frame = CGRectMake(kWIDTH - 216, 0, 200, 50);
        cell.textLab.text = _nameStr;
    }
    
    if(indexPath.row == 1){
        cell.titleImg.frame = CGRectMake(20, 12.5, 13, 25);
        cell.textLab.frame = CGRectMake(kWIDTH - 200 - 50, 0, 200, 50);
        cell.textLab.text = [NSString stringWithFormat:@"%lld ", _phoneNumber];
        
    }
    if(indexPath.row == 2){
        cell.titleImg.frame = CGRectMake(20, 17.5, 22, 15);
        cell.rightImg.hidden = YES;
        cell.textLab.frame = CGRectMake(kWIDTH - 216, 0, 200, 50);
        cell.textLab.text = _idCard;
    }
    if(indexPath.row == 3){
        cell.titleImg.frame = CGRectMake(20, 17.5, 20, 15);
        cell.textLab.frame = CGRectMake(kWIDTH - 200 - 50, 0, 200, 50);
        cell.textLab.text = @"未绑卡";
    }
    if(indexPath.row == 4){
        cell.titleImg.frame = CGRectMake(20, 12.5, 17, 25.5);
        cell.rightImg.hidden = YES;
        cell.textLab.hidden = YES;
        [cell.contentView addSubview:self.switchView];
    }
    if(indexPath.row == 5){
        cell.titleImg.frame = CGRectMake(20, 13.5, 18, 23);
        cell.textLab.hidden = YES;
    }
    if(indexPath.row == 6){
        cell.titleImg.frame = CGRectMake(20, 13.5, 18, 23);
        cell.textLab.hidden = YES;
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    if (indexPath.row == 0) {
        if (self.nameStr.length > 0) {
            JGProgressHUD *hud = [[JGProgressHUD alloc]init];
            hud.tag = 1;
            hud.indicatorView = nil;
            hud.textLabel.text = @"用户名不能修改";
            hud.delegate = self;
            hud.position = 0;
            [hud showInView:self.view];
            [hud dismissAfterDelay:2.0];
        }
        else
        {
        DHFSetUserNameViewController *setUN = [[DHFSetUserNameViewController alloc] init];
        [self.navigationController pushViewController:setUN animated:YES];
        }
    }
    
    else if(indexPath.row == 1){
        DHFChangPhoneViewController *changeVC = [[DHFChangPhoneViewController alloc] init];
        [self.navigationController pushViewController:changeVC animated:YES];
        
        
    }
    else if(indexPath.row == 2){
        //2：有效：0审核中 1：未绑身份证
        if(self.accountStatus == 0)
        {
            JGProgressHUD *hud = [[JGProgressHUD alloc]init];
            hud.tag = 1;
            hud.indicatorView = nil;
            hud.textLabel.text = @"审核中请耐心等待";
            hud.delegate = self;
            hud.position = 0;
            [hud showInView:self.view];
            [hud dismissAfterDelay:2.0];
        }
        if(self.accountStatus == 1)
        {
            DHFSetCardViewController *setCard = [[DHFSetCardViewController alloc] init];
            [self.navigationController pushViewController:setCard animated:YES];
        }
        if (self.accountStatus == 2)
        {
            JGProgressHUD *hud = [[JGProgressHUD alloc]init];
            hud.tag = 1;
            hud.indicatorView = nil;
            hud.textLabel.text = @"无法更改身份证信息";
            hud.delegate = self;
            hud.position = 0;
            [hud showInView:self.view];
            [hud dismissAfterDelay:2.0];
        }

    }
    else if(indexPath.row == 3){
        //2：有效：0审核中 1：未绑身份证
        if(self.accountStatus == 0)
        {
            JGProgressHUD *hud = [[JGProgressHUD alloc]init];
            hud.tag = 1;
            hud.indicatorView = nil;
            hud.textLabel.text = @"审核通过方可绑卡";
            hud.delegate = self;
            hud.position = 0;
            [hud showInView:self.view];
            [hud dismissAfterDelay:2.0];
        }
        if(self.accountStatus == 1)
        {
            JGProgressHUD *hud = [[JGProgressHUD alloc]init];
            hud.tag = 1;
            hud.indicatorView = nil;
            hud.textLabel.text = @"请先绑定身份证";
            hud.delegate = self;
            hud.position = 0;
            [hud showInView:self.view];
            [hud dismissAfterDelay:2.0];
        }
        if (self.accountStatus == 2)
        {
            //DHFcommonWebViewVC 网页
            [self getCommonWebViewVC];
        }

        
    }
    else if(indexPath.row == 4){
        if(self.switchView.on){
            DHFGesturePassVC *passVC = [[DHFGesturePassVC alloc] init];
            [self.navigationController pushViewController:passVC animated:YES];
        }
    }
    else if(indexPath.row == 5){
        
        DHFChangeLogPassWordVC *changePassWordVC = [[DHFChangeLogPassWordVC alloc] init];
        [self.navigationController pushViewController:changePassWordVC animated:YES];
        
    }
    else if(indexPath.row == 6){
        //如果身份证已经认证 则直接跳转到充值界面
        if(self.cardStatus == 2)
        {
            //应该是充值页面
            [self getCommonWebViewVC];
        }
        else
        {
            JGProgressHUD *hud = [[JGProgressHUD alloc]init];
            hud.tag = 1;
            hud.indicatorView = nil;
            hud.textLabel.text = @"请先绑定身份证";
            hud.delegate = self;
            hud.position = 0;
            [hud showInView:self.view];
            [hud dismissAfterDelay:2.0];
        }
        // 和绑定银行卡 是一个页面
        //银行卡是否有效
    }
    
    
}


- (void)switchAction:(UISwitch *)sender{
    if(sender.on){
        DHFGesturePassVC *passVC = [[DHFGesturePassVC alloc] init];
        [self.navigationController pushViewController:passVC animated:YES];
    }
    else
    {
        DHFGestureCloseVC *closeVC = [[DHFGestureCloseVC alloc] init];
        closeVC.isShutDownGesturePassword = true;
        [self.navigationController pushViewController:closeVC animated:YES];
    }
}


- (void)getCommonWebViewVC{
    IPToolManager *ipManager = [IPToolManager sharedManager];
    
    
    JGProgressHUD *hud = [[JGProgressHUD alloc] initWithStyle:0];
    
    hud.textLabel.text = @"loading...";
    
    [hud showInView:self.view];
    NSDictionary *dic = @{@"sid":[[NSUserDefaults standardUserDefaults] valueForKey:@"sid"],@"clientIp":[ipManager currentIpAddress]};
    [VVNetWorkTool postWithUrl:Url(BINDCARD) body:dic bodyType:BodyTypeDictionary httpHeader:nil responseType:ResponseTypeDATA progress:^(NSProgress *progress) {
        
        
    } success:^(id result) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:result options:NSJSONReadingMutableContainers error:nil];
        [hud dismiss];
        //        NSLog(@"dic == %@", dic);
        DHFcommonWebViewVC *commonVC = [[DHFcommonWebViewVC alloc] init];
        commonVC.redirectUrl = [dic objectForKey:@"redirectUrl"];
        [self.navigationController pushViewController:commonVC animated:YES];
        
        
    } fail:^(NSError *error) {
        
        [hud dismiss];
    }];
    
}


- (void)getUserInfo {
    
    //    NSString *url = [NSString stringWithFormat:@"%@%@", HOSTURL, MEDIAREPORTS];
    JGProgressHUD *hud = [[JGProgressHUD alloc] initWithStyle:0];
    
    hud.textLabel.text = @"同步信息...";
    
    [hud showInView:self.view];
    
    
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:[[NSUserDefaults standardUserDefaults] objectForKey:@"sid"], @"sid", nil];
    [VVNetWorkTool postWithUrl:Url(MYBASIC) body:dic bodyType:BodyTypeDictionary httpHeader:nil responseType:ResponseTypeDATA progress:^(NSProgress *progress) {
        //        NSLog(@"progress ===== %@", progress);
        
    } success:^(id result) {
        
        [hud dismiss];
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:result options:NSJSONReadingMutableContainers error:nil];
//        NSLog(@"%@",dic);
    
        
        self.nameValidated = [[[dic objectForKey:@"user"] objectForKey:@"nameValidated"] integerValue];//呢称标示，1.有效 0.无效
            self.phoneNumber = [[[dic objectForKey:@"user"] objectForKey:@"phone"] integerValue];
            self.cardStatus = [[[dic objectForKey:@"account"] objectForKey:@"cardStatus"] integerValue];//银行卡的状态
            self.accountStatus = [[[dic objectForKey:@"account"] objectForKey:@"accountStatus"] integerValue];// 身份证有效标识 2：有效：0审核中 1：未绑身份证
            self.nameStr = [[dic objectForKey:@"user"] objectForKey:@"name"];//名字
            self.idCard = [[dic objectForKey:@"account"] objectForKey:@"idCard"];//银行卡
        [self.tableView reloadData];
        
    } fail:^(NSError *error) {
        [hud dismiss];
        NSLog(@"%@",error);
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
