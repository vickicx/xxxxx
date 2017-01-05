//
//  DHFZRTBViewController.m
//  mingjieloan
//
//  Created by kang on 17/1/5.
//  Copyright © 2017年 mingjie. All rights reserved.
//

#import "DHFZRTBViewController.h"

@interface DHFZRTBViewController ()<UITableViewDataSource, UITableViewDelegate,UITextFieldDelegate, JGProgressHUDDelegate>

@end

@implementation DHFZRTBViewController

- (void)viewWillAppear:(BOOL)animated{
    
    self.tabBarController.tabBar.hidden = YES;
    
    self.title = @"投标";
    
    NSDictionary * titleDict=[NSDictionary dictionaryWithObject:[UIColor whiteColor] forKey:UITextAttributeTextColor];
    self.navigationController.navigationBar.titleTextAttributes = titleDict;
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0,0, kWIDTH, kHEIGHT ) style:UITableViewStylePlain];
    _tableView.separatorStyle = UITableViewCellAccessoryNone;;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    self.navigationController.navigationBar.translucent = YES;
    
    [self.view addSubview:_tableView];
    
    [self initTabelViewFootView];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeAction:) name:UITextFieldTextDidChangeNotification object:nil];
}

- (void)changeAction:(NSNotification *)ification
{
    
    UITextField *textFiled = ification.object;
    
    self.moneyLab.text = [NSString stringWithFormat:@"%@元", textFiled.text];
    self.money = textFiled.text;
    
}
- (void)dealloc
{
    //移除指定的通知，不然会造成内存泄露
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextFieldTextDidChangeNotification object:nil];
    
}


//同意协议
- (void)agreeProtolAction{
    self.agreeBtn.selected = !self.agreeBtn.selected;
}
//看协议
- (void)showProtolAction{
    JGProgressHUD *hud = [[JGProgressHUD alloc] initWithStyle:0];
    
    hud.textLabel.text = @"loading...";
    
    [hud showInView:self.view];
    
    NSString *idStr = @"id";
    NSDictionary *dic = @{idStr:self.idNumber,
                          @"sid" : [[NSUserDefaults standardUserDefaults] objectForKey:@"sid"]};
    NSLog(@"idStrdic ===== %@", dic);
    NSString *strUrl = [NSString stringWithFormat:@"%@/%@",Url(CONTRACT),_idNumber];
    [VVNetWorkTool postWithUrl:Url(CONTRACT) body:dic bodyType:BodyTypeDictionary httpHeader:nil responseType:ResponseTypeDATA progress:^(NSProgress *progress) {
        //        NSLog(@"progress ===== %@", progress);
        
    } success:^(id result) {
        [hud dismiss];
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:result options:NSJSONReadingMutableContainers error:nil];
        NSLog(@"dic ====== %@",dic);
        //                    NSLog(@"dic = %@", dic);
        // 借款人信息Model
        
    } fail:^(NSError *error) {
        [hud dismiss];
        NSLog(@"error  %@",error);
    }];
}

//投资
- (void)touZiAction{
    
    int money  = [self.money intValue];
    if (self.agreeBtn.selected == YES) {
        //2，用户输入金额不能为空
        if(self.money < 0){
            //3，检查用户输入的金额必须小于等于用户可用余额 available
            if (money <= [[BasicInfo sharedInstance].available intValue]){
                //4，检查用户输入的金额必须是baseLimitAmount的整数倍
                double x = money / self.detailModel.singlePurchaseLowerLimit;
                if ((int)x == x) {
                    //检查用户输入的金额必须大于最小购买金额 singlePurchaseLowerLimit
                    if (money > self.detailModel.singlePurchaseLowerLimit) {
                        //6，检查用户输入的金额必须小于等于产品剩余可购买金额 remainingInvestmentAmount
                        if (money <= self.detailModel.remainingInvestmentAmount) {
                            //投标
                            [self TBAction];
                        }
                        else
                        {
                            JGProgressHUD *hud1 = [[JGProgressHUD alloc]init];
                            hud1.tag = 1;
                            hud1.indicatorView = nil;
                            hud1.textLabel.text = @"投资金额必须小于等于产品剩余可购买金额 ";
                            hud1.delegate = self;
                            hud1.position = 0;
                            [hud1 showInView:self.view];
                            [hud1 dismissAfterDelay:2.0];
                        }
                    }
                    else
                    {
                        JGProgressHUD *hud1 = [[JGProgressHUD alloc]init];
                        hud1.tag = 1;
                        hud1.indicatorView = nil;
                        hud1.textLabel.text = @"投资金额必须大于最小购买金额";
                        hud1.delegate = self;
                        hud1.position = 0;
                        [hud1 showInView:self.view];
                        [hud1 dismissAfterDelay:2.0];
                    }
                }
                else
                {
                    JGProgressHUD *hud1 = [[JGProgressHUD alloc]init];
                    hud1.tag = 1;
                    hud1.indicatorView = nil;
                    hud1.textLabel.text = @"投资金额必须是起投金额的整数倍";
                    hud1.delegate = self;
                    hud1.position = 0;
                    [hud1 showInView:self.view];
                    [hud1 dismissAfterDelay:2.0];
                }
            }
            else
            {
                JGProgressHUD *hud1 = [[JGProgressHUD alloc]init];
                hud1.tag = 1;
                hud1.indicatorView = nil;
                hud1.textLabel.text = @"投资金额需要小于等于用户可用余额";
                hud1.delegate = self;
                hud1.position = 0;
                [hud1 showInView:self.view];
                [hud1 dismissAfterDelay:2.0];
            }
        }
        else
        {
            JGProgressHUD *hud1 = [[JGProgressHUD alloc]init];
            hud1.tag = 1;
            hud1.indicatorView = nil;
            hud1.textLabel.text = @"投资金额不能为零";
            hud1.delegate = self;
            hud1.position = 0;
            [hud1 showInView:self.view];
            [hud1 dismissAfterDelay:2.0];
        }
        
    }
    else
    {
        
        JGProgressHUD *hud1 = [[JGProgressHUD alloc]init];
        hud1.tag = 1;
        hud1.indicatorView = nil;
        hud1.textLabel.text = @"请同意协议合同";
        hud1.delegate = self;
        hud1.position = 0;
        [hud1 showInView:self.view];
        [hud1 dismissAfterDelay:2.0];
    }
}



- (void)TBAction{
    
    
    
    JGProgressHUD *hud = [[JGProgressHUD alloc] initWithStyle:0];
    
    hud.textLabel.text = @"loading...";
    
    [hud showInView:self.view];
    
    NSString *idStr = @"id";
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
        dic = [NSMutableDictionary dictionaryWithObjectsAndKeys:self.idNumber, idStr, [[NSUserDefaults standardUserDefaults] objectForKey:@"sid"], @"sid", self.money, @"amount", nil];

    
    NSString *pinjie = [NSString stringWithFormat:@"/product/%@/order/pay", _idNumber];
    NSString *urlStr = Url(pinjie);
    
    [VVNetWorkTool postWithUrl:urlStr body:dic bodyType:BodyTypeDictionary httpHeader:nil responseType:ResponseTypeDATA progress:^(NSProgress *progress) {
        //        NSLog(@"progress ===== %@", progress);
        
        
    } success:^(id result) {
        [hud dismiss];
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:result options:NSJSONReadingMutableContainers error:nil];
        int status = [[dic objectForKey:@"status"] intValue];
        if (status == 0) {
            NSString *uri = [dic objectForKey:@"uri"];
            NSString *req = [dic objectForKey:@"req"];
            NSString *sign = [dic objectForKey:@"sign"];
            NSString *provider = [dic objectForKey:@"pay.provider"];
            if ([provider isEqualToString:@"SINAPAY"]) {
                req = [dic objectForKey:@"postStr"];
                sign = provider;
            }
            if (uri == nil) {
                if (req != nil) {
                    //成功跳到支付页面
                    DHFcommonWebViewVC *webVC = [[DHFcommonWebViewVC alloc] init];
                    webVC.redirectUrl = req;
                }
                else
                {
                    JGProgressHUD *hud1 = [[JGProgressHUD alloc]init];
                    hud1.tag = 1;
                    hud1.indicatorView = nil;
                    hud1.textLabel.text = @"链接错误";
                    hud1.delegate = self;
                    hud1.position = 0;
                    [hud1 showInView:self.view];
                    [hud1 dismissAfterDelay:2.0];
                }
            }
            else
            {
                JGProgressHUD *hud1 = [[JGProgressHUD alloc]init];
                hud1.tag = 1;
                hud1.indicatorView = nil;
                hud1.textLabel.text = @"两个账号不能同时登入";
                hud1.delegate = self;
                hud1.position = 0;
                [hud1 showInView:self.view];
                [hud1 dismissAfterDelay:2.0];
            }
        }
        else
        {
            JGProgressHUD *hud1 = [[JGProgressHUD alloc]init];
            hud1.tag = 1;
            hud1.indicatorView = nil;
            hud1.textLabel.text = [dic objectForKey:@"msg"];
            hud1.delegate = self;
            hud1.position = 0;
            [hud1 showInView:self.view];
            [hud1 dismissAfterDelay:2.0];
        }
        
    } fail:^(NSError *error) {
        [hud dismiss];
        //            NSLog(@"error  %@",error);
    }];
    
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        DHFZRProductCell *cell = [[DHFZRProductCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
        cell.detailPModel = self.detailModel;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return  cell;
    }
    
    int money =  [[BasicInfo sharedInstance].available intValue];
    if(indexPath.row == 1){
        TBTableViewCell *cell = [[TBTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"TBcell"];
        NSMutableAttributedString *ketoustr = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"可用金额: %d", money]];
        [ketoustr addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:NSMakeRange(0,4)];
        cell.useMoneyLab.attributedText = ketoustr;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.inPutField.delegate = self;
        
        return  cell;
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    //产品详情高度
    if (indexPath.row == 0)
    {
        return 240;
    }
    else
    {
    return 160;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}




- (void)initTabelViewFootView{
    
    UIView *bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kWIDTH, 105)];
    
    self.agreeBtn = [[UIButton alloc] initWithFrame:CGRectMake(60, 0, 30, 30)];
    [_agreeBtn setImage:[UIImage imageNamed:@"cashNotSelected"] forState:UIControlStateNormal];
    [_agreeBtn setImage:[UIImage imageNamed:@"cashSelected"] forState:UIControlStateSelected];
    _agreeBtn.selected = YES;
    _agreeBtn.imageEdgeInsets = UIEdgeInsetsMake(15, 0, 0, 15);
    [_agreeBtn addTarget:self action:@selector(agreeProtolAction) forControlEvents:UIControlEventTouchUpInside];
    [bottomView addSubview:_agreeBtn];
    self.protolBtn = [[UIButton alloc] initWithFrame:CGRectMake(90, 15, 240, 15)];
    [_protolBtn addTarget:self action:@selector(showProtolAction) forControlEvents:UIControlEventTouchUpInside];
    _protolBtn.titleLabel.font = [UIFont systemFontOfSize:10];
    [_protolBtn setTitle:@"《借款协议》《出借人咨询服务协议》《保证合同》" forState:UIControlStateNormal];
    [_protolBtn setTitleColor:[XXColor labelGoldenColor] forState:UIControlStateNormal];
    [bottomView addSubview:_protolBtn];
    
    self.touziBtn = [[UIButton alloc] initWithFrame:CGRectMake(20, 35, kWIDTH - 40, 40)];
    _touziBtn.backgroundColor = [XXColor purchaseBtnBgrdColor];
    [_touziBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _touziBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [_touziBtn setTitle:@"立即投资" forState:UIControlStateNormal];
    [_touziBtn addTarget:self action:@selector(touZiAction) forControlEvents:UIControlEventTouchUpInside];
    [bottomView addSubview:_touziBtn];
    
    self.warningLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 75, kWIDTH, 30)];
    _warningLabel.font = [UIFont systemFontOfSize:13];
    _warningLabel.textColor = GetColor(@"#AEAEAE");
    _warningLabel.textAlignment = NSTextAlignmentCenter;
    _warningLabel.text = @"温馨提示：市场有风险，投资需谨慎";
    [bottomView addSubview:_warningLabel];
    
    self.tableView.tableFooterView = bottomView;
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
