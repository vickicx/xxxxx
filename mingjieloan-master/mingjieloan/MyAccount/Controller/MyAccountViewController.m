//
//  MyAccountViewController.m
//  mingjieloan
//
//  Created by vicki on 2016/12/20.
//  Copyright © 2016年 vicki. All rights reserved.
//

#import "MyAccountViewController.h"
#import "MyAccountTableViewCell.h"
#import "AccountHeadView.h"
@interface MyAccountViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation MyAccountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createView];
    
}

- (void)createView {
    AccountHeadView *headView = [[AccountHeadView alloc] initWithFrame:CGRectMake(0, 0, kWIDTH, kHEIGHT * 0.584)];
    [self.view addSubview:headView];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kWIDTH, kHEIGHT)];
    self.tableView.tableHeaderView = headView;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    UINib *nib = [UINib nibWithNibName:@"MyAccountTableViewCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"UITableViewCellIdentifier"];
    
    [self.view addSubview:self.tableView];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 8;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSArray *imagearr = @[@"sign-11",@"huiyuanzhongxin",@"jiaoyijilu",@"xianjinquan",@"zhaiquanzhuanrang",@"yaoqingma",@"touzijilu",@"zhanghuzhongxin"];
    NSArray *labelarr = @[@"签到获取积分",@"会员中心",@"我的积分",@"我的卡卷",@"债权转让",@"回款计划",@"我的邀请",@"账户中心"];
    
    MyAccountTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCellIdentifier"];
    [cell.imageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",imagearr[indexPath.row]]]];
    cell.label.text = labelarr[indexPath.row];
    
    return cell;
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
