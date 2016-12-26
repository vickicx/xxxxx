//
//  DHFTwoProductDetailViewController.m
//  mingjieloan
//
//  Created by 杜虹锋 on 2016/12/23.
//  Copyright © 2016年 mingjie. All rights reserved.
//

#import "DHFTwoProductDetailViewController.h"

@interface DHFTwoProductDetailViewController ()<UITableViewDelegate, UITableViewDataSource, PopUpViewDelegate>

@end

@implementation DHFTwoProductDetailViewController

- (void)viewWillAppear:(BOOL)animated{
    self.title = @"产品详情";
    
    NSDictionary * titleDict=[NSDictionary dictionaryWithObject:[UIColor whiteColor] forKey:UITextAttributeTextColor];
    self.navigationController.navigationBar.titleTextAttributes = titleDict;
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initButton];
    [self initTableView];
    [self initBottomView];
}

- (void)initButton{
    //产品详情Button
    self.CPXQButton = [[UIButton alloc] initWithFrame:CGRectMake((kWIDTH - 280) / 2, 64, 280 / 3, 45)];
    [self.CPXQButton setTitle:@"产品详情" forState:UIControlStateNormal];
    UIColor *selectColor = [XXColor goldenColor];
    [self.CPXQButton setTitleColor:selectColor forState:UIControlStateSelected];
    [self.CPXQButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.CPXQButton.titleLabel.font = [UIFont systemFontOfSize:17];
    [self.CPXQButton addTarget:self action:@selector(CPXQAction:) forControlEvents:UIControlEventTouchUpInside];
    _CPXQButton.selected = YES;
    [self.view addSubview:self.CPXQButton];
    
    //还款计划Button
    self.HKJHButton = [[UIButton alloc] initWithFrame:CGRectMake((kWIDTH - 280) / 2 + 280/3, 64, 280 / 3, 45)];
    [self.HKJHButton setTitle:@"还款计划" forState:UIControlStateNormal];
    [self.HKJHButton setTitleColor:selectColor forState:UIControlStateSelected];
    [self.HKJHButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.HKJHButton.titleLabel.font = [UIFont systemFontOfSize:17];
    [self.HKJHButton addTarget:self action:@selector(HKJHAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.HKJHButton];
    
    
    self.bottomView = [[UIView alloc] initWithFrame:CGRectMake((kWIDTH - 280) / 2, 64+43, 280/3, 2)];
    _bottomView.backgroundColor = selectColor;
    [self.view addSubview:_bottomView];
    
}

//产品详情
-(void)CPXQAction:(UIButton *)btn{
    _CPXQButton.selected = YES;
    _HKJHButton.selected = NO;
    [self.tableView reloadData];
    [UIView animateWithDuration:0.3 animations:^{
        self.bottomView.frame = CGRectMake((kWIDTH - 280) / 2, 64+43, 280/3, 2);
    }];
}

//还款计划
-(void)HKJHAction:(UIButton *)btn{
    _CPXQButton.selected = NO;
    _HKJHButton.selected = YES;
    [self.tableView reloadData];
    [UIView animateWithDuration:0.3 animations:^{
        self.bottomView.frame = CGRectMake((kWIDTH - 280) / 2 + 280/3, 64+43, 280/3, 2);
    }];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    //产品详情
    if (self.CPXQButton.selected == YES) {
        return  4;
    }
    else{
        return 2;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    //产品详情高度
    if (self.CPXQButton.selected == YES) {
        if (indexPath.row == 0)
        {
            return 170;
        }
        else if (indexPath.row == 1)
        {
            NSString *str = @"借款人经营一家汽车美容商行，有多年经营管理经验。车行有固定会员数百人。消费群体为中高档车主，群体稳定。商行经营状况良好，有员工数十人，收益稳定。本地有房产，具有良好的还款意愿和还款能力。\n该自然人在本平台借款余额未超过人民币20万元。";
            CGFloat hight = [HeightWithString heightForTextLable:str width:kWIDTH - 24 fontSize:13];
            return 47+hight+30+10;
        }
        else if (indexPath.row == 2)
        {
            NSString *str = @"资金用途：资金周转";
            CGFloat hight = [HeightWithString heightForTextLable:str width:kWIDTH - 24 fontSize:13];
            return 80+hight+20+10;
        }
        else     {
            NSString *str1 = @"大连亿嘉担保有限公司，成立于2008年06月30日，注册资本壹亿元，工作深入细致，业务开展有方，与银行合作默契，风险控制有力，社会一小明显。以“卓越、创新、执着”为企业精神，主张“专业沟通、实效营销”的服务理念。展望未来，一家担保将进一步加强与客户以及协作单位的友好合作，力求在充满机遇、挑战、希望的市场中成为大连地区担保行业的第一品牌";
            CGFloat hight = [HeightWithString heightForTextLable:str1 width:kWIDTH - 24 fontSize:13];
            
            CGFloat danbaoHight = 47 + hight + 10+10;
            NSString *str2 = @"1.明杰贷不触碰用户资金，交易资金完全由第三方支付机构监管。\n2.项目推荐方审核、筛选优质资产\n3.抵押物价值充足，足以支撑还款";
            CGFloat hight1 = [HeightWithString heightForTextLable:str2 width:kWIDTH - 24 fontSize:13];
            return 50+hight1+25+10 + danbaoHight + 130 * FitHeight + 33  + 10 + 150+33+20;
        }
    }
    //还款计划和投标记录的高度是一样的
    else
    {
        return 40;
    }
    
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //产品详情
    if (self.CPXQButton.selected == YES) {
        if (indexPath.row == 0) {
            ProductDetailFirstTableViewCell *cell = [[ProductDetailFirstTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
            
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return  cell;
        }
        else if (indexPath.row == 1)
        {
            ProductIntroductionTableViewCell *cell = [[ProductIntroductionTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
            
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return  cell;
        }
        else if (indexPath.row == 2)
        {
            ProductUserInforTableViewCell *cell = [[ProductUserInforTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
            
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return  cell;
        }
        else
        {
            ProductDetailThreeTableViewCell *cell = [[ProductDetailThreeTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
            cell.delegate = self;
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return  cell;
        }
    }
    else if(self.HKJHButton.selected == YES)
    {
        
        static NSString *cellIdentifier = @"HKJHcell";
        HKJHTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if (cell == nil) {
            cell = [[HKJHTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        if (indexPath.row == 0)
        {
            cell.timeLab.text = @"还款时间";
            cell.benjinLab.text = @"应还本金";
            cell.lixiLab.text = @"应还利息";
            cell.zongeLab.text = @"应还总额";
        }
        else
        {
            cell.timeLab.text = @"2017-01-01";
            cell.benjinLab.text = @"¥3000.00";
            cell.lixiLab.text = @"¥31.56";
            cell.zongeLab.text = @"¥3031.56";
        }
        return  cell;
    }
    return nil;
}

- (void)popViewAction{
    self.popView = [PopView defaultPopupView];
    self.popView.parentVC = self;
    
    [self lew_presentPopupView:self.popView animation:[LewPopupViewAnimationSlide new] dismissed:^{
        
        NSLog(@"动画结束");
        
    }];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}


- (void)initTableView{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 45 + 64, kWIDTH, kHEIGHT - 45 - 64 - 80) style:UITableViewStylePlain];
    _tableView.separatorStyle = UITableViewCellAccessoryNone;;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [self.view addSubview:_tableView];
}

- (void)initBottomView{
    self.touBiaoBtn = [[UIButton alloc] initWithFrame:CGRectMake(20, kHEIGHT - 70       , kWIDTH - 40, 40)];
    [_touBiaoBtn addTarget:self action:@selector(toubiaoAction) forControlEvents:UIControlEventTouchUpInside];
    [_touBiaoBtn setTitle:@"投标" forState:UIControlStateNormal];
    _touBiaoBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [_touBiaoBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _touBiaoBtn.backgroundColor = GetColor(@"#805919");
    [self.view addSubview:_touBiaoBtn];
    
    self.warningLab = [[UILabel alloc] initWithFrame:CGRectMake(0, kHEIGHT - 30, kWIDTH, 30)];
    _warningLab.textAlignment = NSTextAlignmentCenter;
    _warningLab.font = [UIFont systemFontOfSize:13];
    _warningLab.text = @"温馨提示：市场有风险，投资需谨慎";
    [self.view addSubview:_warningLab];
}

- (void)toubiaoAction{
    //    /*
    //     1，检查是否登录
    //     2，用户输入金额不能为空
    //     3，检查用户输入的金额必须小于等于用户可用余额 available
    //     4，检查用户输入的金额必须是baseLimitAmount的整数倍
    //     5，检查用户输入的金额必须大于最小购买金额 singlePurchaseLowerLimit
    //     6，检查用户输入的金额必须小于等于产品剩余可购买金额 remainingInvestmentAmount
    //     */
    //
    //    //1，检查是否登录
    //    if LoginUser.readLoginUser() == nil {
    //
    //        UIhelper.loginTimeout()
    //
    //        return
    //    }
    //
    //    let submitOrderTableViewController = self.storyboard?.instantiateViewControllerWithIdentifier("SubmitOrderTableViewController") as! SubmitOrderTableViewController
    //
    //
    //    submitOrderTableViewController.productId = self.productId
    //
    //    submitOrderTableViewController.productInfo = productInfo!
    //
    //    submitOrderTableViewController.product = product!
    //    
    //    self.navigationController!.showViewController(submitOrderTableViewController, sender: nil)
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
