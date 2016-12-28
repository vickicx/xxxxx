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
    [self getMYInfo];
    [self getBasicInfo];
    
}

- (void)createView {
    AccountHeadView *headView = [[AccountHeadView alloc] initWithFrame:CGRectMake(0, 0, kWIDTH, kHEIGHT * 0.584)];
    [self.view addSubview:headView];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kWIDTH, kHEIGHT) style:UITableViewStyleGrouped];
    self.tableView.tableHeaderView = headView;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.sectionHeaderHeight = 10 * FitHeight;
    self.tableView.sectionFooterHeight = 0;
    UINib *nib = [UINib nibWithNibName:@"MyAccountTableViewCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"UITableViewCellIdentifier"];
    
    [self.view addSubview:self.tableView];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 4;
    }else {
        return 2;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSArray *imagearr = @[@"sign-11",@"huiyuanzhongxin",@"jiaoyijilu",@"xianjinquan",@"zhaiquanzhuanrang",@"yaoqingma",@"touzijilu",@"zhanghuzhongxin"];
    NSArray *labelarr = @[@"签到获取积分",@"会员中心",@"我的积分",@"我的卡卷",@"债权转让",@"回款计划",@"我的邀请",@"账户中心"];
    
    MyAccountTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCellIdentifier"];
    
    switch (indexPath.section) {
        case 0:
            [cell.imageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",imagearr[indexPath.row]]]];
            cell.label.text = labelarr[indexPath.row];
            break;
        case 1:
            [cell.imageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",imagearr[indexPath.row + 4]]]];
            cell.label.text = labelarr[indexPath.row + 4];
            break;
            
        case 2:
            [cell.imageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",imagearr[indexPath.row + 6]]]];
            cell.label.text = labelarr[indexPath.row + 6];
            break;
            
        default:
            break;
    }
    
    return cell;
}

- (void)getMYInfo {
    NSDictionary *dic = @{@"sid":[[NSUserDefaults standardUserDefaults] objectForKey:@"sid"]};
    [VVNetWorkTool postWithUrl:Url(MY) body:dic bodyType:1 httpHeader:nil responseType:0 progress:^(NSProgress *progress) {
        
    } success:^(id result) {
        [self.userInfo setValuesForKeysWithDictionary:result];
    } fail:^(NSError *error) {
        
    }];
}

- (void)getBasicInfo {
    NSDictionary *dic = @{@"sid":[[NSUserDefaults standardUserDefaults] objectForKey:@"sid"]};
    [VVNetWorkTool postWithUrl:Url(MYBASIC) body:dic bodyType:1 httpHeader:nil responseType:0 progress:^(NSProgress *progress) {
        
    } success:^(id result) {
        [self.basicInfo setValuesForKeysWithDictionary:result];
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
