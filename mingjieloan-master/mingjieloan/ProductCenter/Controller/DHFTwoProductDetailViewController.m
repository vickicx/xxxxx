//
//  DHFThreeProductDetailViewController.m
//  mingjieloan
//
//  Created by 杜虹锋 on 2016/12/23.
//  Copyright © 2016年 mingjie. All rights reserved.
//

#import "DHFThreeProductDetailViewController.h"

@interface DHFTwoProductDetailViewController ()<UITableViewDelegate, UITableViewDataSource, PopUpViewDelegate, JGProgressHUDDelegate>

@property (nonatomic, assign)BOOL isUPLoad;//判断上下
@property (nonatomic, assign) NSInteger page;
@property (nonatomic, assign) NSInteger maxPageId;

@end

@implementation DHFTwoProductDetailViewController

- (void)viewWillAppear:(BOOL)animated{
    self.title = @"产品详情";
    
    NSDictionary * titleDict=[NSDictionary dictionaryWithObject:[UIColor whiteColor] forKey:UITextAttributeTextColor];
    self.navigationController.navigationBar.titleTextAttributes = titleDict;
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    [self getProductDetail];
}

- (void)viewDidLoad {
    
    
    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.TBJLArray = [NSMutableArray array];
    self.HKJHArray = [NSMutableArray array];
    self.informaModel = [[NSMutableArray alloc] init];
    
    
    
    self.navigationController.navigationBar.translucent = YES;
    [self initButton];
    [self initTableView];
    [self initBottomView];
    //默认不是上拉
    _isUPLoad = NO;
    
}

//设置下拉刷新
-(void)addHeaderRefresh
{
    //    if (self.TBJLButton.selected == YES) {
    //        [self.TBJLArray removeAllObjects];
    __block DHFTwoProductDetailViewController *blockSelf = self;
    [self.tableView addHeaderWithCallback:^{
        _isUPLoad = NO;
        _page = 1;
        
        //重新请求数据
        [blockSelf getProductDetail];
    }];
    //        [self.tableView headerBeginRefreshing];
    //
    //    }
    
}


//上拉
- (void)addFooterRefresh
{
    //    if (self.TBJLButton.selected == YES) {
    if (self.page < self.maxPageId) {
        __block DHFTwoProductDetailViewController *blockSelf = self;
        self.page++;
        [self.tableView addFooterWithCallback:^{
            
            _isUPLoad = YES;
            
            [blockSelf getProductDetail];
        }];
        [self.tableView footerBeginRefreshing];
    }
    
    //    }
}

- (void)initButton{
    //产品详情Button
    self.CPXQButton = [[UIButton alloc] initWithFrame:CGRectMake((kWIDTH - 280) / 2, 64, 280 / 2, 45)];
    [self.CPXQButton setTitle:@"产品详情" forState:UIControlStateNormal];
    UIColor *selectColor = [XXColor goldenColor];
    [self.CPXQButton setTitleColor:selectColor forState:UIControlStateSelected];
    [self.CPXQButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.CPXQButton.titleLabel.font = [UIFont systemFontOfSize:17];
    [self.CPXQButton addTarget:self action:@selector(CPXQAction:) forControlEvents:UIControlEventTouchUpInside];
    _CPXQButton.selected = YES;
    [self.view addSubview:self.CPXQButton];
    
    //投标记录Button
    self.TBJLButton = [[UIButton alloc] initWithFrame:CGRectMake((kWIDTH - 280) / 2 + 280/2, 64, 280 / 2, 45)];
    [self.TBJLButton setTitle:@"投标记录" forState:UIControlStateNormal];
    [self.TBJLButton setTitleColor:selectColor forState:UIControlStateSelected];
    [self.TBJLButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.TBJLButton.titleLabel.font = [UIFont systemFontOfSize:17];
    [self.TBJLButton addTarget:self action:@selector(TBJLAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.TBJLButton];
    
    
    self.bottomView = [[UIView alloc] initWithFrame:CGRectMake((kWIDTH - 280) / 2, 64+43, 280/2, 2)];
    _bottomView.backgroundColor = selectColor;
    [self.view addSubview:_bottomView];
    
}

//产品详情
-(void)CPXQAction:(UIButton *)btn{
    _CPXQButton.selected = YES;
    _TBJLButton.selected = NO;
    [self.tableView removeFooter];
    [self.tableView removeHeader];
    [self.tableView reloadData];
    [UIView animateWithDuration:0.3 animations:^{
        self.bottomView.frame = CGRectMake((kWIDTH - 280) / 2, 64+43, 280/2, 2);
    }];
}


//投标记录
-(void)TBJLAction:(UIButton *)btn{
    _CPXQButton.selected = NO;
    _TBJLButton.selected = YES;
    [self addHeaderRefresh];
    [self addFooterRefresh];
    [self.tableView reloadData];
    [UIView animateWithDuration:0.3 animations:^{
        
        self.bottomView.frame = CGRectMake((kWIDTH - 280) / 2 + 280 /2, 64+43, 280/2, 2);
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    //产品详情
    if (self.CPXQButton.selected == YES) {
        return  4;
    }
    else
    {
        return (self.TBJLArray.count + 1);
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
            CGFloat hight = [HeightWithString heightForTextLable:_detailModel.detailDescription width:kWIDTH - 26 fontSize:13];
            return 47+hight+20;
        }
        else if (indexPath.row == 2)
        {
            NSString *str = [NSString stringWithFormat:@"资金用途：%@", self.pApplocationModel.pPurpose];
            CGFloat hight = [HeightWithString heightForTextLable:str width:kWIDTH - 24 fontSize:13];
            return 80+hight+20+10;
        }
        else     {
            NSString *str1 = self.detailModel.descriptionJS;
            CGFloat hight = [HeightWithString heightForTextLable:str1 width:kWIDTH - 24 fontSize:13];
            
            CGFloat danbaoHight = 47 + hight + 10+10;
            NSString *str2 = self.detailModel.descriptionRiskDescri;
            CGFloat hight1 = [HeightWithString heightForTextLable:str2 width:kWIDTH - 24 fontSize:13];
            return 50+hight1+25+10 + danbaoHight + 130 * FitHeight + 33  + 10 + 150+33+20+ 10;
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
            cell.detailPModel = self.detailModel;
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return  cell;
        }
        else if (indexPath.row == 1)
        {
            ProductIntroductionTableViewCell *cell = [[ProductIntroductionTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
            cell.detailPModel = self.detailModel;
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return  cell;
        }
        else if (indexPath.row == 2)
        {
            ProductUserInforTableViewCell *cell = [[ProductUserInforTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
            cell.pApplocationModel = self.pApplocationModel;
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return  cell;
        }
        else
        {
            ProductDetailThreeTableViewCell *cell = [[ProductDetailThreeTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
            cell.delegate = self;
            cell.detailPModel = self.detailModel;
            cell.checkModel = self.checkModel;
            cell.informaModel = _informaModel;
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return  cell;
        }
    }
    else
    {
        static NSString *cellIdentifier = @"TBJLcell";
        TBJLTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if (cell == nil) {
            cell = [[TBJLTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        if (indexPath.row == 0)
        {
            cell.peopleLab.text = @"投资人";
            cell.moneyLab.text = @"投资金额";
            cell.timeLab.text = @"投标时间";
            
        }
        else
        {
            cell.ordersModel = [self.TBJLArray objectAtIndex:(indexPath.row - 1)];
        }
        return  cell;
    }
}

- (void)popViewAction:(NSInteger )num{
    self.popView = [PopView defaultPopupView];
    InformationModel *model = [_informaModel objectAtIndex:num];
    _popView.imgUrlArray = model.informationImageList;
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
    NSString *longinStr =[[NSUserDefaults standardUserDefaults] objectForKey:@"sid"];
    if (longinStr.length > 0) {
        
        if(self.detailModel.newstatus == 5){
            UIBarButtonItem *backbutton = [[UIBarButtonItem alloc]init];
            backbutton.title = @"产品中心";
            self.navigationItem.backBarButtonItem = backbutton;
            DHFTBViewController *tbVC = [[DHFTBViewController alloc] init];
            tbVC.idNumber = self.idNumber;
            tbVC.productDic = [NSMutableDictionary dictionaryWithDictionary:self.productDic];
            tbVC.detailModel = self.detailModel;
            [self.navigationController pushViewController:tbVC animated:YES];
        }
        
        
    }
    else
    {
        JGProgressHUD *hud = [[JGProgressHUD alloc]init];
        hud.tag = 1;
        hud.indicatorView = nil;
        hud.textLabel.text = @"请先登陆";
        hud.delegate = self;
        hud.position = 0;
        [hud showInView:self.view];
        [hud dismissAfterDelay:2.0];
    }
    
}


- (void)getProductDetail{
    
    JGProgressHUD *hud = [[JGProgressHUD alloc] initWithStyle:0];
    
    hud.textLabel.text = @"loading...";
    
    [hud showInView:self.view];
    
    NSString *idStr = @"id";
    NSDictionary *dic = @{idStr:_idNumber,
                          @"sid" : @"",
                          @"page" : @"0"};
    
    NSString *urlStr = [NSString stringWithFormat:@"%@/%@", Url(PRODUCTDETAIL), self.idNumber];
    //    NSString *csStr = [NSString stringWithFormat:@"jiahairan123.55555.io:19883/mapp/product/personal-loan/detail/%@", _idNumber];
    //    NSLog(@"urlStr=========%@",urlStr);
    [VVNetWorkTool postWithUrl:urlStr body:dic bodyType:BodyTypeDictionary httpHeader:nil responseType:ResponseTypeDATA progress:^(NSProgress *progress) {
        //        NSLog(@"progress ===== %@", progress);
        
    } success:^(id result) {
        [hud dismiss];
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:result options:NSJSONReadingMutableContainers error:nil];
        NSLog(@"%@",dic);
        //        NSLog(@"dic = %@", dic);
        //项目资料
        NSMutableArray *inforArray = [dic objectForKey:@"information"];
        for (NSDictionary *dic in inforArray) {
            InformationModel *inforModel = [[InformationModel alloc] init];
            [inforModel setValuesForKeysWithDictionary:dic];
            [self.informaModel addObject:inforModel];
        }
        
        
        //借款人信息Model
        [self.pApplocationModel setValuesForKeysWithDictionary:[dic objectForKey:@"pApplication"]];
        
        //项目详情Model
        [self.detailModel setValuesForKeysWithDictionary:[dic objectForKey:@"product"]];
        
        //审核信息model
        [self.checkModel setValuesForKeysWithDictionary:[dic objectForKey:@"pApplicationCheck"]];
        
        if(_isUPLoad == NO){
            [self.TBJLArray removeAllObjects];
        }
        //投标记录的数据
        NSMutableArray *orderArray = [[dic objectForKey:@"productOrders"] objectForKey:@"items"];
        for (NSDictionary *dic in orderArray) {
            ProductOrdersModel *orderModel = [[ProductOrdersModel alloc] init];
            [orderModel setValuesForKeysWithDictionary:dic];
            [self.TBJLArray addObject:orderModel];
        }
        //        //还款计划的数据
        //        NSMutableArray *planArray = [dic objectForKey:@"productRepayPlan"];
        //        for (NSDictionary *dic in planArray) {
        //            ProductRepayPlanModel *planModel = [[ProductRepayPlanModel alloc] init];
        //            [planModel setValuesForKeysWithDictionary:dic];
        //            [self.HKJHArray addObject:planModel];
        //        }
        
        //最大页数
        self.maxPageId = [[[dic objectForKey:@"productOrders"] objectForKey:@"maxPage"] intValue];
        if (self.detailModel.newstatus == 5)
        {
            self.touBiaoBtn.backgroundColor = GetColor(@"#805919");
        }
        else
        {
            self.touBiaoBtn.backgroundColor = [XXColor grayAllColor];
        }
        [_tableView headerEndRefreshing];
        [_tableView footerEndRefreshing];
        [self.tableView reloadData];
    } fail:^(NSError *error) {
        [hud dismiss];
        [_tableView headerEndRefreshing];
        [_tableView footerEndRefreshing];
        NSLog(@"error  %@",error);
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
