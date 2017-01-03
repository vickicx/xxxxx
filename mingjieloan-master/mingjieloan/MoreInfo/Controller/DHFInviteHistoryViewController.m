//
//  DHFInviteHistoryViewController.m
//  mingjieloan
//
//  Created by kang on 16/12/29.
//  Copyright © 2016年 mingjie. All rights reserved.
//

#import "DHFInviteHistoryViewController.h"

@interface DHFInviteHistoryViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, assign)BOOL isUPLoad;//判断上下
@property (nonatomic, assign) NSInteger page;
@property (nonatomic, assign) NSInteger maxPageId;


@property (nonatomic, strong) NSMutableArray *mainArr;


@end

@implementation DHFInviteHistoryViewController

- (void)viewWillAppear:(BOOL)animated{
    [self getDataList];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.mainArr = [NSMutableArray array];
    
    UIBarButtonItem *backbutton = [[UIBarButtonItem alloc]init];
    backbutton.title = @"返回";
    self.navigationItem.backBarButtonItem = backbutton;
    self.title = @"邀请记录";
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kWIDTH, kHEIGHT) style:UITableViewStylePlain];
    _tableView.separatorStyle = UITableViewCellAccessoryNone;
    _tableView.backgroundColor = GetColor(@"#EAE9EF");
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    self.backImage = [[UIImageView alloc] initWithFrame:CGRectMake(kWIDTH/ 2 -83*FitWidth, 270 * FitHeight - 64, 165 * FitWidth, 110 * FitHeight)];
    self.backImage.image = [UIImage imageNamed:@"empty"];
    [self.view addSubview:_backImage];
    
    self.textLabel = [[UILabel alloc] initWithFrame:CGRectMake(kWIDTH/2 -105*FitWidth , 280 * FitHeight + self.backImage.frame.size.height - 64, 210 * FitWidth, 40 * FitHeight)];
    self.textLabel.font = [UIFont systemFontOfSize:18];
    self.textLabel.text = @"暂无数据!";
    self.textLabel.textAlignment = NSTextAlignmentCenter;
    self.textLabel.textColor = GetColor(@"#e9e9e9");
    [self.view addSubview:_textLabel];
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
    __block DHFInviteHistoryViewController *blockSelf = self;
    [self.tableView addHeaderWithCallback:^{
        _isUPLoad = NO;
        _page = 1;
        
        //重新请求数据
        [blockSelf getDataList];
    }];
    //    [self.JonolTableView headerBeginRefreshing];
}


//上拉
- (void)addFooterRefresh
{
    if (self.page < self.maxPageId) {
        __block DHFInviteHistoryViewController *blockSelf = self;
        self.page++;
        [self.tableView addFooterWithCallback:^{
            
            _isUPLoad = YES;
            
            [blockSelf getDataList];
        }];
    }

    //    [self.JonolTableView footerBeginRefreshing];
    
}



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 75;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.mainArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellIdentifier = @"MoreCell";
    DHFInviteHistoryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[DHFInviteHistoryTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return  cell;
    
}



- (void)getDataList {
    
    if (_isUPLoad == NO) {
        [self.mainArr removeAllObjects];
    }
    
    NSString *page = [NSString stringWithFormat:@"%ld", self.page];
    
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:[[NSUserDefaults standardUserDefaults] objectForKey:@"sid"], @"sid",page, @"page", nil];
     
    [VVNetWorkTool postWithUrl:Url(INVITATION) body:dic bodyType:BodyTypeDictionary httpHeader:nil responseType:ResponseTypeDATA progress:^(NSProgress *progress) {
        //        NSLog(@"progress ===== %@", progress);
        
    } success:^(id result) {
        
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:result options:NSJSONReadingMutableContainers error:nil];
        NSLog(@"asdfasdfasdfadsf %@",dic);
        
        NSMutableArray *dataArray = [[dic objectForKey:@"invitations"] objectForKey:@"items"];
        
        self.maxPageId = [[[[dic objectForKey:@"invitations"] objectForKey:@"pager"] objectForKey:@"maxPage"] integerValue];
//        for (NSDictionary *dic in dataArray) {
//            
//        }
//
//        if (self.mainArr.count > 0) {
        if (dataArray.count > 0) {
            self.tableView.hidden = NO;
            self.textLabel.hidden = YES;
            self.backImage.hidden = YES;
        }
        else
        {
            self.tableView.hidden = YES;
            self.textLabel.hidden = NO;
            self.backImage.hidden = NO;
        }
            [_tableView headerEndRefreshing];
            [_tableView footerEndRefreshing];
            [_tableView reloadData];
//        }
        
        
    } fail:^(NSError *error) {
        
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
