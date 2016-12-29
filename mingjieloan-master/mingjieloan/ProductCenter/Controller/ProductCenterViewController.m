//
//  ProductCenterViewController.m
//  mingjieloan
//
//  Created by vicki on 2016/12/20.
//  Copyright © 2016年 vicki. All rights reserved.
//

#import "ProductCenterViewController.h"

@interface ProductCenterViewController ()<UITableViewDelegate, UITableViewDataSource, SDCycleScrollViewDelegate>

@property (nonatomic, assign)BOOL isUPLoad;//判断上下
@property (nonatomic, assign) NSInteger page;
@property (nonatomic, assign) NSInteger maxPage;

@end

@implementation ProductCenterViewController

-(void)viewWillAppear:(BOOL)animated{
    
    self.tabBarController.tabBar.hidden = false;
    [self dataDownHandle];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView *imageV= [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tab_logo"]];
    self.navigationItem.titleView = imageV;
    // Do any additional setup after loading the view.
    
    self.modelArray = [NSMutableArray array];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kWIDTH, kHEIGHT) style:UITableViewStylePlain];
    _tableView.separatorStyle = UITableViewCellAccessoryNone;
    _tableView.backgroundColor = [UIColor colorWithRed:239.0/255.0 green:239.0/255.0 blue:239.0/255.0 alpha:1];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [self.view addSubview:_tableView];
    
    [self  createBanner];
    
    
    
    
    
    //默认不是上拉
    self.isUPLoad = NO;
    //上下拉刷新
    [self addHeaderRefresh];
    [self addFooterRefresh];
    
}

//设置下拉刷新
-(void)addHeaderRefresh
{
    //    [self.modelArray removeAllObjects];
    __weak ProductCenterViewController *blockSelf = self;
    [self.tableView addHeaderWithCallback:^{
        _isUPLoad = NO;
        _page = 1;
        
        //重新请求数据
        [blockSelf dataDownHandle];
    }];
    //    [self.JonolTableView headerBeginRefreshing];
}


//上拉
- (void)addFooterRefresh
{
    __weak ProductCenterViewController *blockSelf = self;
    self.page++;
    if (self.page < self.maxPage) {
        [self.tableView addFooterWithCallback:^{
            
            _isUPLoad = YES;
            
            [blockSelf dataHandle];
        }];
    }
    
    
    //    [self.JonolTableView footerBeginRefreshing];
    
}


- (void)dataHandle {
    
        NSString *page = [NSString stringWithFormat:@"%ld", self.page];
    JGProgressHUD *hud = [[JGProgressHUD alloc] initWithStyle:0];
    
    hud.textLabel.text = @"loading...";
    
    [hud showInView:self.view];
    
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:@"sid", @"sid",page, @"page", nil];
    [VVNetWorkTool postWithUrl:Url(PRODUCTALL) body:dic bodyType:BodyTypeDictionary httpHeader:nil responseType:ResponseTypeDATA progress:^(NSProgress *progress) {
        //        NSLog(@"progress ===== %@", progress);
        
    } success:^(id result) {
        
        [hud dismiss];
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:result options:NSJSONReadingMutableContainers error:nil];
        //        NSLog(@"%@",dic);
        self.maxPage = [[[dic objectForKey:@"pagerParam"] objectForKey:@"maxPage"] intValue];
        NSMutableArray *dataArray = [dic objectForKey:@"product_list"];
        
        for (NSDictionary *dic in dataArray) {
            
            ProductModel *productModel = [[ProductModel alloc] init];
            [productModel setValuesForKeysWithDictionary:dic];
            [self.modelArray addObject:productModel];
        }
        
        if (self.modelArray.count > 0) {
            
            [_tableView headerEndRefreshing];
            [_tableView footerEndRefreshing];
            [_tableView reloadData];
        }
        
        
    } fail:^(NSError *error) {
        [hud dismiss];
        
    }];
}


- (void)dataDownHandle {
    
    NSString *page = [NSString stringWithFormat:@"%ld", self.page];
    JGProgressHUD *hud = [[JGProgressHUD alloc] initWithStyle:0];
    
    hud.textLabel.text = @"loading...";
    
    [hud showInView:self.view];
    
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:@"sid", @"sid",page, @"page", nil];
    [VVNetWorkTool postWithUrl:Url(PRODUCTALL) body:dic bodyType:BodyTypeDictionary httpHeader:nil responseType:ResponseTypeDATA progress:^(NSProgress *progress) {
        //        NSLog(@"progress ===== %@", progress);
        
    } success:^(id result) {
        [self.modelArray removeAllObjects];
        [hud dismiss];
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:result options:NSJSONReadingMutableContainers error:nil];
        //        NSLog(@"%@",dic);
        self.maxPage = [[[dic objectForKey:@"pagerParam"] objectForKey:@"maxPage"] intValue];
        NSMutableArray *dataArray = [dic objectForKey:@"product_list"];
        
        for (NSDictionary *dic in dataArray) {
            
            ProductModel *productModel = [[ProductModel alloc] init];
            [productModel setValuesForKeysWithDictionary:dic];
            [self.modelArray addObject:productModel];
        }
        
        if (self.modelArray.count > 0) {
            
            [_tableView headerEndRefreshing];
            [_tableView footerEndRefreshing];
            [_tableView reloadData];
        }
        
        
    } fail:^(NSError *error) {
        [hud dismiss];
        
    }];
    
    
}


/** 点击图片回调 */
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    
    //NSLog(@"%ld",index);
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return  self.modelArray.count;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 140;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"ProductCenterCell";
    DHFProductCenterCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[DHFProductCenterCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    cell.productModel = [self.modelArray objectAtIndex:indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return  cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.hidesBottomBarWhenPushed=YES;
    
    ProductModel *productModel = [self.modelArray objectAtIndex:indexPath.row];
    
    
    DHFThreeProductDetailViewController *ThreeVC = [[DHFThreeProductDetailViewController alloc] init];
    UIBarButtonItem *backbutton = [[UIBarButtonItem alloc]init];
    backbutton.title = @"产品中心";
    ThreeVC.idNumber = productModel.strId;
    self.navigationItem.backBarButtonItem = backbutton;
    [self.navigationController pushViewController:ThreeVC animated:YES];
    self.hidesBottomBarWhenPushed=NO;
}

- (void)createBanner{
    
    self.sdcScrollView = [[SDCycleScrollView alloc] initWithFrame:CGRectMake(0, 0, kWIDTH, 160)];
    _sdcScrollView.delegate = self;
    _sdcScrollView.autoScrollTimeInterval = 4.0;
    _sdcScrollView.pageControlStyle = SDCycleScrollViewPageContolStyleClassic;
    _sdcScrollView.currentPageDotColor = [XXColor goldenColor];
    _sdcScrollView.pageDotColor = [UIColor whiteColor];
    //    _sdcScrollView.imageURLStringsGroup = self.netImages;
    
    
    
    [VVNetWorkTool postWithUrl:Url(BANNER) body:nil bodyType:BodyTypeDictionary httpHeader:nil responseType:ResponseTypeDATA progress:^(NSProgress *progress) {
        //        NSLog(@"progress ===== %@", progress);
        
    } success:^(id result) {
        
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:result options:NSJSONReadingMutableContainers error:nil];
        //        NSLog(@"%@",dic);
        //        NSLog(@"dic = %@", dic);
        NSMutableArray *bigArray = [dic objectForKey:@"data"];
        NSMutableArray *imgArray = [NSMutableArray array];
        if(bigArray.count == 0){
            self.sdcScrollView.frame = CGRectZero;
            self.tableView.tableHeaderView = _sdcScrollView;
            [_tableView reloadData];
        }
        else{
            for(int i = 0; i<bigArray.count; i++){
                [imgArray addObject:[[bigArray[i] objectForKey:@"extra"] objectForKey:@"img"]];
                _sdcScrollView.imageURLStringsGroup = [imgArray copy];
                
                _tableView.tableHeaderView = self.sdcScrollView;
                [_tableView reloadData];
            }
        }
        
        
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
