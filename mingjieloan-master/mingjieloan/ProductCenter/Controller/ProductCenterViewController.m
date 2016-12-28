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

@end

@implementation ProductCenterViewController

-(void)viewWillAppear:(BOOL)animated{
    
    self.tabBarController.tabBar.hidden = false;
        [self dataHandle];
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
    
    self.sdcScrollView = [[SDCycleScrollView alloc] initWithFrame:CGRectMake(0, 0, kWIDTH, 160)];
    _sdcScrollView.delegate = self;
    _sdcScrollView.autoScrollTimeInterval = 4.0;
    _sdcScrollView.pageControlStyle = SDCycleScrollViewPageContolStyleClassic;
    _sdcScrollView.currentPageDotColor = [XXColor goldenColor];
    _sdcScrollView.pageDotColor = [UIColor whiteColor];
    _sdcScrollView.imageURLStringsGroup = self.netImages;
    
    _tableView.tableHeaderView = self.sdcScrollView;
    
    [_tableView reloadData];


    //默认不是上拉
    self.isUPLoad = NO;
    //上下拉刷新
    [self addHeaderRefresh];
    [self addFooterRefresh];
    
}

//设置下拉刷新
-(void)addHeaderRefresh
{
    [self.modelArray removeAllObjects];
    __block ProductCenterViewController *blockSelf = self;
    [self.tableView addHeaderWithCallback:^{
        _isUPLoad = NO;
        _page = 1;
        
        //重新请求数据
        [blockSelf dataHandle];
    }];
    //    [self.JonolTableView headerBeginRefreshing];
}


//上拉
- (void)addFooterRefresh
{
    __block ProductCenterViewController *blockSelf = self;
    self.page++;
    [self.tableView addFooterWithCallback:^{
        
        _isUPLoad = YES;
        
        [blockSelf dataHandle];
    }];
    //    [self.JonolTableView footerBeginRefreshing];
    
}


- (void)dataHandle {
    
    //    NSString *url = [NSString stringWithFormat:@"%@%@", HOSTURL, MEDIAREPORTS];
    
    JGProgressHUD *hud = [[JGProgressHUD alloc] initWithStyle:0];
    
    hud.textLabel.text = @"loading...";
    
    [hud showInView:self.view];
    
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:@"sid", @"sid",@"1", @"page", nil];
    [VVNetWorkTool postWithUrl:Url(PRODUCTALL) body:dic bodyType:BodyTypeDictionary httpHeader:nil responseType:ResponseTypeDATA progress:^(NSProgress *progress) {
        //        NSLog(@"progress ===== %@", progress);
        
    } success:^(id result) {
        
        [hud dismiss];
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:result options:NSJSONReadingMutableContainers error:nil];
        NSLog(@"%@",dic);
        
        NSMutableArray *dataArray = [dic objectForKey:@"product_list"];
        
        for (NSDictionary *dic in dataArray) {
            
            NoticeModel *model = [[NoticeModel alloc] init];
            
            [model setValuesForKeysWithDictionary:dic];
            
            
            [self.modelArray addObject:model];
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

/**
 *  懒加载网络图片数据
 */
-(NSArray *)netImages{
    
    if (!_netImages) {
        _netImages = @[
                       @"http://d.hiphotos.baidu.com/zhidao/pic/item/72f082025aafa40f507b2e99aa64034f78f01930.jpg",
                       @"http://b.hiphotos.baidu.com/zhidao/pic/item/4b90f603738da9770889666fb151f8198718e3d4.jpg",
                       @"http://g.hiphotos.baidu.com/zhidao/pic/item/f2deb48f8c5494ee4e84ef5d2cf5e0fe98257ed4.jpg",
                       @"http://d.hiphotos.baidu.com/zhidao/pic/item/9922720e0cf3d7ca104edf32f31fbe096b63a93e.jpg"
                       ];
    }
    return _netImages;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return  10;
    
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
    DHFThreeProductDetailViewController *ThreeVC = [[DHFThreeProductDetailViewController alloc] init];
    UIBarButtonItem *backbutton = [[UIBarButtonItem alloc]init];
    backbutton.title = @"产品中心";
    self.navigationItem.backBarButtonItem = backbutton;
    [self.navigationController pushViewController:ThreeVC animated:YES];
    self.hidesBottomBarWhenPushed=NO;
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
