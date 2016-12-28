//
//  JFDetialViewController.m
//  Yilicai
//
//  Created by 盐商 on 16/4/8.
//  Copyright © 2016年 Louding. All rights reserved.
//

#import "JFDetialViewController.h"
#import "JFDetailTableViewCell.h"
#import "MJRefresh.h"

@interface JFDetialViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *jfDetailTableView;

@property (nonatomic, assign) NSInteger page;

@property (nonatomic, strong) NSMutableArray *dataArr;

@property (nonatomic, strong) NSMutableArray *mainArr;

@property (nonatomic, strong) UIImageView *emptyImageView;

@property (nonatomic, strong) UILabel *emptyLabel;

@property (nonatomic, assign) NSInteger maxPageId;

@end

@implementation JFDetialViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.dataArr = [NSMutableArray array];
        self.mainArr = [NSMutableArray array];
        self.page = 1;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    UIColor * color = [UIColor whiteColor];
    NSDictionary * dict=[NSDictionary dictionaryWithObject:color forKey:NSForegroundColorAttributeName];
    self.navigationController.navigationBar.titleTextAttributes = dict;
    
    if (self.detailType == 1) {
        
        self.navigationItem.title = @"积分明细";
    }
    if (self.detailType == 2) {
        
        self.navigationItem.title = @"积分收入";
    }
    if (self.detailType == 3) {
        
        self.navigationItem.title = @"积分支出";
    }
    if (self.detailType == 4) {
        
        self.navigationItem.title = @"已过期";
    }
    
    
    [self dataHandle];
    
    [self createTableView];
    
    self.emptyImageView = [[UIImageView alloc] initWithFrame:CGRectMake(105 * FitWidth, 270 * FitHeight - 64, 375 * FitWidth - 210 * FitWidth, 110 * FitHeight)];
    [self.jfDetailTableView addSubview:self.emptyImageView];
    self.emptyImageView.image = [UIImage imageNamed:@"empty"];
    
    self.emptyLabel = [[UILabel alloc] initWithFrame:CGRectMake(105 * FitWidth , 280 * FitHeight + self.emptyImageView.frame.size.height - 64, 375 * FitWidth - 210 * FitWidth, 40 * FitHeight)];
    [self.jfDetailTableView addSubview:self.emptyLabel];
    self.emptyLabel.text = @"暂无数据!";
    self.emptyLabel.textColor = [UIColor lightGrayColor];
    self.emptyLabel.font = [UIFont systemFontOfSize:20];
    self.emptyLabel.textAlignment = NSTextAlignmentCenter;
    
    self.emptyImageView.hidden = YES;
    
    self.emptyLabel.hidden = YES;
}

- (void)dataHandle
{
    NSString *url = [NSString stringWithFormat:@"%@%@", HOSTURL, WDJFDETAIL];
    
    NSString *body = [NSString stringWithFormat:@"sid=%@&page=%ld&type=%ld", self.sid, self.page, self.detailType];
    [VVNetWorkTool postWithUrl:url body:body bodyType:BodyTypeDictionary httpHeader:nil responseType:0 progress:^(NSProgress *progress) {
        
    } success:^(id result) {
        
        self.dataArr = [result objectForKey:@"integralMapList"];
        
        for (NSDictionary *dic in self.dataArr) {
            
            JFDetailModel *model = [[JFDetailModel alloc] init];
            
            [model setValuesForKeysWithDictionary:dic];
            
            [self.mainArr addObject:model];
            
        }
        
//        if (self.mainArr.count > 0) {
        
            [self.jfDetailTableView reloadData];
//        }
        
        if (self.mainArr.count == 0) {
            
            self.emptyImageView.hidden = NO;
            
            self.emptyLabel.hidden = NO;
            
        }else{
            
            self.emptyImageView.hidden = YES;
            
            self.emptyLabel.hidden = YES;
        }
    
           } fail:^(NSError *error) {
    }];
}


- (void)createTableView
{
    self.jfDetailTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, FitWidth * 375, 667 * FitHeight - 64) style:UITableViewStyleGrouped];
    [self.view addSubview:self.jfDetailTableView];
    self.jfDetailTableView.dataSource = self;
    self.jfDetailTableView.delegate = self;
    
    self.jfDetailTableView.rowHeight = 80 * FitHeight;
    
    [self.jfDetailTableView addHeaderWithTarget:self action:@selector(headerRefreshing)];
    
    [self.jfDetailTableView addFooterWithTarget:self action:@selector(footerRefreshing)];
}

//下拉
- (void)headerRefreshing
{

    //把已经刷新的数据删除,否则越刷新重复数据越多
    [self.mainArr removeAllObjects];
    
    self.page = 1;
    
    NSString *url = [NSString stringWithFormat:@"%@%@", HOSTURL, WDJFDETAIL];
    
    NSString *body = [NSString stringWithFormat:@"sid=%@&page=%ld&type=%ld", self.sid, self.page, self.detailType];
<<<<<<< HEAD
    [VVNetWorkTool postWithUrl:url body:body bodyType:0 httpHeader:nil responseType:0 progress:^(NSProgress *progress) {
=======
    
    [VVNetWorkTool postWithUrl:url body:body bodyType:BodyTypeDictionary httpHeader:nil responseType:0 progress:^(NSProgress *progress) {
        
    } success:^(id result) {
>>>>>>> 856e8b060fd71650b68b1f2f8a71eb6ab6b0934f
        
    } success:^(id result) {
        self.dataArr = [result objectForKey:@"integralMapList"];
        
        for (NSDictionary *dic in self.dataArr) {
            
            JFDetailModel *model = [[JFDetailModel alloc] init];
            
            [model setValuesForKeysWithDictionary:dic];
            
            [self.mainArr addObject:model];
            
        }
        
        //        if (self.mainArr.count > 0) {
        
        [self.jfDetailTableView reloadData];
        //        }
        
        if (self.mainArr.count == 0) {
            
            self.emptyImageView.hidden = NO;
            
            self.emptyLabel.hidden = NO;
            
        }else{
            
            self.emptyImageView.hidden = YES;
            
            self.emptyLabel.hidden = YES;
        }
        
        [self.jfDetailTableView headerEndRefreshing];
<<<<<<< HEAD
    } fail:^(NSError *error) {
        
=======
       
         } fail:^(NSError *error) {
             
>>>>>>> 856e8b060fd71650b68b1f2f8a71eb6ab6b0934f
    }];
    
    
}

- (void)footerRefreshing
{
    self.page++;
    
    NSString *url = [NSString stringWithFormat:@"%@%@", HOSTURL, WDJFDETAIL];
    
    NSString *body = [NSString stringWithFormat:@"sid=%@&page=%ld&type=%ld", self.sid, self.page, self.detailType];
    
    [VVNetWorkTool postWithUrl:url body:body bodyType:BodyTypeDictionary httpHeader:nil responseType:0 progress:^(NSProgress *progress) {
        
    } success:^(id result) {
        
        self.dataArr = [result objectForKey:@"integralMapList"];
        
        for (NSDictionary *dic in self.dataArr) {
            
            JFDetailModel *model = [[JFDetailModel alloc] init];
            
            [model setValuesForKeysWithDictionary:dic];
            
            [self.mainArr addObject:model];
            
        }
        
        //        if (self.mainArr.count > 0) {
        
        [self.jfDetailTableView reloadData];
        //        }
        
        if (self.mainArr.count == 0) {
            
            self.emptyImageView.hidden = NO;
            
            self.emptyLabel.hidden = NO;
            
        }else{
            
            self.emptyImageView.hidden = YES;
            
            self.emptyLabel.hidden = YES;
        }
        
        [self.jfDetailTableView footerEndRefreshing];
        
         } fail:^(NSError *error) {
    }];
    
    if (self.maxPageId) {
        //NSLog(@"%ld, %ld", (long)self.page, (long)self.maxPageId);
        self.jfDetailTableView.footerHidden = YES;
    }
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.mainArr.count > 0) {
        
        return self.mainArr.count;
    }else{
        
        return 0;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    JFDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JFDetailTableViewCell"];
    if (!cell) {
        
        cell = [[JFDetailTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"JFDetailTableViewCell"];
    }
    
    if (self.mainArr.count > 0) {
        
        cell.model = [self.mainArr objectAtIndex:indexPath.row];
        
    }
    
    cell.detailType = self.detailType;
//    cell.dateLabel.text = @"2016-02-24 11:57:08";
//    cell.priceLabel.text = @"+1000.00";
//    cell.descriptionLabel.text = @"成功兑换商品扣除积分";
    
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1;
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
