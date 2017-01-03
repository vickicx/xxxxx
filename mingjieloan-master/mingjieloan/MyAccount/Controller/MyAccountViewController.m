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


@interface MyAccountViewController ()<UITableViewDelegate,UITableViewDataSource,TrageRecordDelegate>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong)  UILabel *titleText;

@property (nonatomic,strong)  UIImageView *levelImgV;

@property (nonatomic, strong) AccountHeadView *headView;
@end

@implementation MyAccountViewController

- (void)viewDidLoad {
    UIBarButtonItem *backIetm = [[UIBarButtonItem alloc] init];
    
    backIetm.title =@"我的账户";
    
    self.navigationItem.backBarButtonItem = backIetm;
  
    
    [super viewDidLoad];

    [self createView];
    [self getMYInfo];
    [self getBasicInfo];
    
    
}

- (void)createView {
    self.titleText = [[UILabel alloc] initWithFrame: CGRectMake(0, 0, 100*FitWidth, 20 * FitHeight)];
    _titleText.textColor = [UIColor whiteColor];
   [_titleText setTextAlignment:NSTextAlignmentRight];
    self.levelImgV = [[UIImageView alloc] initWithFrame:CGRectMake(_titleText.right, _titleText.top, 60 * FitWidth, _titleText.font.lineHeight)];
    
    UIView * titleViews = [[UIView alloc] initWithFrame:CGRectMake(160*FitWidth, 0, _titleText.width + _levelImgV.width,_titleText.height)];
    [titleViews addSubview:_titleText];
    [titleViews addSubview:_levelImgV];
    
    self.navigationItem.titleView=titleViews;

    self.headView = [[AccountHeadView alloc] initWithFrame:CGRectMake(0, 0, kWIDTH, kHEIGHT * 0.584)];
    _headView.delegate = self;
    [self.view addSubview:_headView];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kWIDTH, kHEIGHT) style:UITableViewStyleGrouped];
    self.tableView.tableHeaderView = _headView;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.sectionHeaderHeight = 10 * FitHeight;
    self.tableView.sectionFooterHeight = 0;
    UINib *nib = [UINib nibWithNibName:@"MyAccountTableViewCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"UITableViewCellIdentifier"];
    
    [self.view addSubview:self.tableView];
    
    
}


- (void)tradeRecord {
    JYJLViewController * jyjlVc = [[JYJLViewController alloc] init];
    jyjlVc.sid = [[NSUserDefaults standardUserDefaults] objectForKey:@"sid"];
    [self.navigationController pushViewController:jyjlVc animated:YES];
    
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

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.section) {
        case 0:
            if (indexPath.row == 0) {
                //签到获取积分
                
            }else if (indexPath.row  ==1){
                //会员中心(完成)
                HYZXViewController *hyzxVC = [[HYZXViewController alloc] init];
                hyzxVC.sid = [[NSUserDefaults standardUserDefaults] objectForKey:@"sid"];
                [self.navigationController pushViewController:hyzxVC animated:YES];
                
            }else if (indexPath.row  ==2){
                //我的积分（完成）
                
                JFViewController *jfViewController = [[JFViewController alloc] init];
                
                jfViewController.sid = [[NSUserDefaults standardUserDefaults] objectForKey:@"sid"];
                
                [self.navigationController pushViewController:jfViewController animated:YES];
            }else {
                //我的卡卷
            }
           
            break;
        case 1:
            if (indexPath.row == 0) {
                //债权转让
                LDY_RightChangeViewController *zqzrVC = [[LDY_RightChangeViewController alloc] init];
                
                zqzrVC.sid = [[NSUserDefaults standardUserDefaults] objectForKey:@"sid"];
                
                [self.navigationController pushViewController:zqzrVC animated:YES];
                
                
            }else if (indexPath.row  ==1){
                //回款计划(完成)
                DepositsHistoryViewController *depositsHVC = [[DepositsHistoryViewController alloc] init];
                  depositsHVC.sid = [[NSUserDefaults standardUserDefaults] objectForKey:@"sid"];
                 [self.navigationController pushViewController:depositsHVC animated:YES];
                
            }
            break;
            
        case 2:
            if (indexPath.row == 0) {
                //我的邀请
                
            }else if (indexPath.row  ==1){
                //账户中心
                DHFUserCenterViewController *shiyanVC = [[DHFUserCenterViewController alloc] init];
                [self.navigationController pushViewController:shiyanVC animated:YES];
                
            }
            break;
            
        default:
            break;
    }
    NSLog(@"%ld, %ld", indexPath.row, indexPath.section);
}

- (void)getMYInfo {
    NSDictionary *dic = @{@"sid":[[NSUserDefaults standardUserDefaults] objectForKey:@"sid"]};
    [VVNetWorkTool postWithUrl:Url(MY) body:dic bodyType:1 httpHeader:nil responseType:0 progress:^(NSProgress *progress) {
        
    } success:^(id result) {
        [self.userInfo setValuesForKeysWithDictionary:result];
        self.headView.userInfo = self.userInfo;
        
    } fail:^(NSError *error) {
        
    }];
}



- (void)getBasicInfo {
    NSDictionary *dic = @{@"sid":[[NSUserDefaults standardUserDefaults] objectForKey:@"sid"]};
    [VVNetWorkTool postWithUrl:Url(MYBASIC) body:dic bodyType:1 httpHeader:nil responseType:0 progress:^(NSProgress *progress) {
        
    } success:^(id result) {
        [self.basicInfo setValuesForKeysWithDictionary:result];
        self.headView.basicInfo = self.basicInfo;
        _titleText.text = self.basicInfo.name;
        NSString *VipImageName = [NSString stringWithFormat:@"vip_%@",self.basicInfo.member_level];
        _levelImgV.image = [UIImage imageNamed:VipImageName];
        
        
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
