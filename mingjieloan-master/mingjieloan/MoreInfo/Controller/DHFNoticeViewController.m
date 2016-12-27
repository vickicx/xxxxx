//
//  DHFNoticeViewController.m
//  mingjieloan
//
//  Created by 杜虹锋 on 2016/12/25.
//  Copyright © 2016年 mingjie. All rights reserved.
//

#import "DHFNoticeViewController.h"

@interface DHFNoticeViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, assign)BOOL isUPLoad;//判断上下
@property (nonatomic, assign) NSInteger page;



@property (nonatomic, strong) NSMutableArray *mainArr;

@property (nonatomic, assign) NSInteger maxPageId;

@end

@implementation DHFNoticeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"平台公告";
    
    self.mainArr = [NSMutableArray array];
    self.view.backgroundColor = [UIColor whiteColor];
    NSDictionary * titleDict=[NSDictionary dictionaryWithObject:[UIColor whiteColor] forKey:UITextAttributeTextColor];
    self.navigationController.navigationBar.titleTextAttributes = titleDict;
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    self.tabBarController.tabBar.hidden=YES; 
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kWIDTH, kHEIGHT) style:UITableViewStylePlain];
    _tableView.separatorStyle = UITableViewCellAccessoryNone;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    [self dataHandle];
    
    //默认不是上拉
    self.isUPLoad = NO;
    //上下拉刷新
    [self addHeaderRefresh];
    [self addFooterRefresh];
    
}

//设置下拉刷新
-(void)addHeaderRefresh
{
    [self.mainArr removeAllObjects];
    __block DHFNoticeViewController *blockSelf = self;
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
    __block DHFNoticeViewController *blockSelf = self;
    self.page++;
    [self.tableView addFooterWithCallback:^{
        
        _isUPLoad = YES;
        
        [blockSelf dataHandle];
    }];
    //    [self.JonolTableView footerBeginRefreshing];
    
}



- (void)dataHandle {
    
//    NSString *url = [NSString stringWithFormat:@"%@%@", HOSTURL, MEDIAREPORTS];
    
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:@"sid", @"sid",@"1", @"page", nil];
    [VVNetWorkTool postWithUrl:Url(ANNOUNCE) body:dic bodyType:BodyTypeDictionary httpHeader:nil responseType:ResponseTypeDATA progress:^(NSProgress *progress) {
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


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _mainArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"NoticeCell";
    DHFNoticeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[DHFNoticeTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    if (_mainArr.count > 0) {
        cell.noticeModel = [_mainArr objectAtIndex:indexPath.row];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
//    self.hidesBottomBarWhenPushed=YES;
    DHFNoticeDetailViewController *noticeDetailVC = [[DHFNoticeDetailViewController alloc] init];
    noticeDetailVC.noticeModel = [self.mainArr  objectAtIndex:indexPath.row];
    UIBarButtonItem *backIetm = [[UIBarButtonItem alloc] init];
    
    backIetm.title = @"返回";
    
    self.navigationItem.backBarButtonItem = backIetm;
    [self.navigationController pushViewController:noticeDetailVC animated:YES];
    
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
