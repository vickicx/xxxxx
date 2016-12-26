//
//  DHFReportViewController.m
//  mingjieloan
//
//  Created by 杜虹锋 on 2016/12/25.
//  Copyright © 2016年 mingjie. All rights reserved.
//

#import "DHFReportViewController.h"

@interface DHFReportViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, assign)BOOL isUPLoad;//判断上下
@property (nonatomic, assign) NSInteger page;

@property (nonatomic, strong) NSArray *dataArr;

@property (nonatomic, strong) NSMutableArray *mainArr;

@property (nonatomic, assign) NSInteger maxPageId;

@property (nonatomic, strong) UITableView *mediaReportTableView;

@end

@implementation DHFReportViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.page = 1;
    
    self.dataArr = [NSArray array];
    
    self.mainArr = [NSMutableArray array];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    UIColor *color = [UIColor whiteColor];
    
    NSDictionary * dict=[NSDictionary dictionaryWithObject:color forKey:NSForegroundColorAttributeName];
    
    self.navigationController.navigationBar.titleTextAttributes = dict;
    
    self.navigationItem.title = @"媒体报道";
    
    [self dataHandle];
    
    [self createTableView];
    
}

- (void)dataHandle {
    
    NSString *url = [NSString stringWithFormat:@"%@%@", HOSTURL, MEDIAREPORTS];
    
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:@"sid", @"sid",@"1", @"page", nil];
    [VVNetWorkTool postWithUrl:url body:dic bodyType:BodyTypeDictionary httpHeader:nil responseType:ResponseTypeDATA progress:^(NSProgress *progress) {
        NSLog(@"progress ===== %@", progress);
        
    } success:^(id result) {
        NSLog(@"%@",result);

    } fail:^(NSError *error) {
        
        NSLog(@"error ===== %@", error);
    }];
    
//    [AppTools getPostWithURL:url Body:body Block:^(id resultX) {
//        
//        self.dataArr = [[resultX objectForKey:@"articles"] objectForKey:@"items"];
//        
//        for (NSDictionary *dic in self.dataArr) {
//            
//            MediaReportModel *model = [[MediaReportModel alloc] init];
//            
//            [model setValuesForKeysWithDictionary:dic];
//            
//            
//            [self.mainArr addObject:model];
//        }
//        
//        if (self.mainArr.count > 0) {
//            
//            [self.mediaReportTableView reloadData];
//        }
//    }];

}



/**
 * XXXXX
 */
- (void)createTableView {
    
    self.mediaReportTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 64) style:UITableViewStyleGrouped];
    
    [self.view addSubview:self.mediaReportTableView];
    
    self.mediaReportTableView.dataSource = self;
    
    self.mediaReportTableView.delegate = self;
    
    self.mediaReportTableView.rowHeight = 100 * FitHeight;
    
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
    __block DHFReportViewController *blockSelf = self;
    [self.mediaReportTableView addHeaderWithCallback:^{
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
    __block DHFReportViewController *blockSelf = self;
    self.page++;
    [self.mediaReportTableView addFooterWithCallback:^{
        
        _isUPLoad = YES;
        
        [blockSelf dataHandle];
    }];
    //    [self.JonolTableView footerBeginRefreshing];
    
}




/**
 * XXXX
 */
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    if (self.mainArr.count > 0) {
        
        return self.mainArr.count;
        
    }else{
        
        return 0;
    }
}


/**
 * XXXX
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1;
}


/**
 * XXXX
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    DHFReportTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MediaReportsCell"];
    
    if (!cell) {
        
        cell = [[DHFReportTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MediaReportsCell"];
    }
    
    if (self.mainArr.count > 0) {
        
        cell.model = [self.mainArr objectAtIndex:indexPath.section];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

/**
 * XXXX
 */
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 5 * FitHeight;
}

/**
 * XXXX
 */
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    return 0.1;
}


/**
 * XXXX
 */
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    DHFReportDetailViewController *mediaReportsDetailViewController = [[DHFReportDetailViewController alloc] init];
    
    mediaReportsDetailViewController.model = [self.mainArr objectAtIndex:indexPath.section];
    
    UIBarButtonItem *backIetm = [[UIBarButtonItem alloc] init];
    
    backIetm.title = @"返回";
    
    self.navigationItem.backBarButtonItem = backIetm;
    
    [self.navigationController pushViewController:mediaReportsDetailViewController animated:YES];
    
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
