//
//  DHFUserCouponViewController.m
//  mingjieloan
//
//  Created by 杜虹锋 on 2017/1/3.
//  Copyright © 2017年 mingjie. All rights reserved.
//

#import "DHFUserCouponViewController.h"

@interface DHFUserCouponViewController ()

<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, assign)BOOL isUPLoad;//判断上下
@property (nonatomic, assign) NSInteger page;
@property (nonatomic, assign) NSInteger maxPageId;


@property (nonatomic, strong) NSMutableArray *mainArr;

@end

@implementation DHFUserCouponViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.translucent = YES;
    self.title = @"使用卡券";
    
    self.mainArr = [NSMutableArray array];
    self.view.backgroundColor = [UIColor whiteColor];
    NSDictionary * titleDict=[NSDictionary dictionaryWithObject:[UIColor whiteColor] forKey:NSForegroundColorAttributeName];
    self.navigationController.navigationBar.titleTextAttributes = titleDict;
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    self.tabBarController.tabBar.hidden=YES;
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kWIDTH, kHEIGHT) style:UITableViewStylePlain];
    _tableView.separatorStyle = UITableViewCellAccessoryNone;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    [self initBottomView];
    [self getCoupon];
    
    //默认不是上拉
    self.isUPLoad = NO;
    //上下拉刷新
    [self addHeaderRefresh];
    [self addFooterRefresh];
}

- (void)returnCouponBlock:(ReturnCouponInfo)block{
    self.returnCouponBlock = block;
}
- (void)confirmUseCashList{
    if (self.returnCouponBlock != nil) {
        self.returnCouponBlock(@"呵呵哒");
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 120;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"CouponCell";
    DHFUseCouponTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[DHFUseCouponTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    if (_mainArr.count > 0) {
        
    }
    if(cell.isSelected)
    {
        cell.selectedImg.image = [UIImage imageNamed:@"circle_small"];
    }
    else
    {
        cell.selectedImg.image = [UIImage imageNamed:@"cashNotSelectedCircle"];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSArray *array = [tableView visibleCells];
    for (DHFUseCouponTableViewCell *cell in array) {

        cell.isSelected = NO;
    }
    
    DHFUseCouponTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.isSelected = !cell.isSelected;
    if (cell.isSelected) {
        self.selectedIndexPath = indexPath;
    }
    [self.tableView reloadData];
}

//设置下拉刷新
-(void)addHeaderRefresh
{
    [self.mainArr removeAllObjects];
    __weak DHFUserCouponViewController *blockSelf = self;
    [self.tableView addHeaderWithCallback:^{
        _isUPLoad = NO;
        _page = 1;
        
        //重新请求数据
        [blockSelf getCoupon];
    }];
    //    [self.JonolTableView headerBeginRefreshing];
}


//上拉
- (void)addFooterRefresh
{
    if (self.page < self.maxPageId) {
        __weak DHFUserCouponViewController *blockSelf = self;
        self.page++;
        [self.tableView addFooterWithCallback:^{
            
            _isUPLoad = YES;
            
            [blockSelf getCoupon];
        }];
    }
    
}

- (void)getCoupon{
    
    NSDictionary *dic = @{@"sid":
    [[NSUserDefaults standardUserDefaults] objectForKey:@"sid"],
                         @"productid":_productID,
                         @"amount":@"1000",
                         @"page":[NSString stringWithFormat:@"%ld", self.page]};
    
    [VVNetWorkTool postWithUrl:Url(ENABLECASH) body:dic bodyType:BodyTypeDictionary httpHeader:nil responseType:ResponseTypeDATA progress:^(NSProgress *progress) {
        //        NSLog(@"progress ===== %@", progress);
        
    } success:^(id result) {
        
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:result options:NSJSONReadingMutableContainers error:nil];
        NSLog(@"%@",dic);
        
        NSMutableArray *dataArray = [[dic objectForKey:@"articles"] objectForKey:@"items"];
        
        for (NSDictionary *dic in dataArray) {
            
            NoticeModel *model = [[NoticeModel alloc] init];
            
            [model setValuesForKeysWithDictionary:dic];
            
            
            [self.mainArr addObject:model];
        }
        
        if (self.mainArr.count > 0) {
            
            [_tableView headerEndRefreshing];
            [_tableView footerEndRefreshing];
            [_tableView reloadData];
        }
        
        
    } fail:^(NSError *error) {
        
        
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 40;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kWIDTH, 60)];
    headerView.backgroundColor =  [UIColor colorWithRed:244.0/255.0 green:244.0/255.0 blue:244.0/255.0 alpha:1.0];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, kWIDTH, 20)];
    [headerView addSubview:label];
    label.text = @"   选择当前可用的卡券";
    label.textColor = [UIColor darkGrayColor];
    label.backgroundColor = [UIColor colorWithRed:244.0/255.0 green:244.0/255.0 blue:244.0/255.0 alpha:1.0];
    label.font = [UIFont systemFontOfSize:14];
    
    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(0, 30, kWIDTH, 20)];
    [headerView addSubview:label2];
    label2.text = @"   温馨提示:限每个投资项目仅可使用1张卡券";
    label2.textColor = [UIColor darkGrayColor];
    label2.backgroundColor = [UIColor colorWithRed:244.0/255.0 green:244.0/255.0 blue:244.0/255.0 alpha:1.0];
    label2.font = [UIFont systemFontOfSize:11];
    
    return headerView;
}


- (void)initBottomView{
    
    UIView *bottomView = [[UIView alloc]initWithFrame:CGRectMake(0, kHEIGHT - 60, kWIDTH, 60)];
    bottomView.backgroundColor = [UIColor whiteColor];
    
    UIButton *confirmUseCashListBtn = [[UIButton alloc] initWithFrame:CGRectMake(10, 10,kWIDTH-20, 40)];
    [confirmUseCashListBtn setTitle:@"确认使用" forState:UIControlStateNormal];
    confirmUseCashListBtn.backgroundColor = [XXColor btnGoldenColor];
    [confirmUseCashListBtn addTarget:self action:@selector(confirmUseCashList) forControlEvents:UIControlEventTouchUpInside];
    [bottomView addSubview:confirmUseCashListBtn];
    [self.view addSubview:bottomView];
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
