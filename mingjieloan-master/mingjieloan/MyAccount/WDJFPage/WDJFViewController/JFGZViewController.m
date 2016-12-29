//
//  JFGZViewController.m
//  Yilicai
//
//  Created by 盐商 on 16/4/7.
//  Copyright © 2016年 Louding. All rights reserved.
//
//  积分使用规则界面

#import "JFGZViewController.h"
#import "JFGZCell.h"
#import "WDJFViewController.h"

@interface JFGZViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *jfgzTableView;

@property (nonatomic, strong) NSArray *sectionTitleArr;

@property (nonatomic, copy) NSString *firstStr;

@property (nonatomic, copy) NSString *secondStr;

@property (nonatomic, copy) NSString *thirdStr;

@property (nonatomic, strong) NSString *jiantou1Name;

@property (nonatomic, strong) NSString *jiantou2Name;

@property (nonatomic, strong) NSString *jiantou3Name;

@property (nonatomic, assign) NSInteger buttonHeihgt;

/** 提现手续费 */
@property (nonatomic, copy) NSString *POINT_TYPE_WITHDRAW;

/** 新手注册的*/
@property (nonatomic, copy) NSString *POINT_TYPE_REGIST;

/** 邀请好友送多少积分*/
@property (nonatomic, copy) NSString *POINT_TYPE_FRIEND_REGIST;

/** 每天多少*/
@property (nonatomic, copy) NSString *POINT_TYPE_TENDER_PERSENT;

/** 每天提示*/
@property (nonatomic, copy) NSString *POINT_TYPE_TENDER_PERSENT_EXAMPLE;


@property (nonatomic, assign) BOOL close;

@end

@implementation JFGZViewController

/**
 *XXXXXXXXXXXXX
 */
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        
        self.sectionTitleArr = [NSArray array];
    }
    
    return self;
}

/**
 *XXXXXXXXXXXXX
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    UIColor * color = [UIColor whiteColor];
    NSDictionary * dict=[NSDictionary dictionaryWithObject:color forKey:NSForegroundColorAttributeName];
    self.navigationController.navigationBar.titleTextAttributes = dict;
    self.navigationItem.title = @"积分使用规则";
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] init];
    
    backButton.title = @"我的积分";
    
    self.navigationItem.backBarButtonItem = backButton;
    
    self.jiantou1Name = @"down-arrow";
    self.jiantou2Name = @"down-arrow";
    self.jiantou3Name = @"down-arrow";
    
    self.buttonHeihgt = 0;
    self.close = YES;
    
    self.POINT_TYPE_REGIST = @"?";
    
    self.POINT_TYPE_FRIEND_REGIST = @"?";
    
    self.POINT_TYPE_TENDER_PERSENT = @"?";
    
    self.POINT_TYPE_TENDER_PERSENT_EXAMPLE = @"?";
    
    //网络动态获取积分的规则
    [self regIntegral];
    
    self.sectionTitleArr = @[@"一、如何获得积分？", @"二、积分如何使用？", @"三、积分是否有有效期？"];
    
    [self createTableView];
}


- (void)regIntegral {
    
    NSString *url = [NSString stringWithFormat:@"%@%@", HOSTURL,INTEGRALX];
    
    NSString *body = [NSString stringWithFormat:@"sid=%@", self.sid];
    [VVNetWorkTool postWithUrl:url body:body bodyType:BodyTypeString httpHeader:nil responseType:0 progress:^(NSProgress *progress) {
    
    }success:^(id result){
        
        //提现手续费，每笔扣多少积分
        if (result[@"POINT_TYPE_WITHDRAW"] != nil) {
            self.POINT_TYPE_WITHDRAW = result[@"POINT_TYPE_WITHDRAW"];
        }
        
        //新手注册的
        if (result[@"POINT_TYPE_WITHDRAW"] != nil) {
            self.POINT_TYPE_REGIST = result[@"POINT_TYPE_REGIST"];
        }
        
        //邀请好友送多少积分
        if (result[@"POINT_TYPE_FRIEND_REGIST"] != nil) {
            self.POINT_TYPE_FRIEND_REGIST = result[@"POINT_TYPE_FRIEND_REGIST"];
        }
        
        //每天多少
        if (result[@"POINT_TYPE_TENDER_PERSENT"] != nil) {
            self.POINT_TYPE_TENDER_PERSENT = result[@"POINT_TYPE_TENDER_PERSENT"];
        }
        
        //每天提示
        if (result[@"POINT_TYPE_TENDER_PERSENT_EXAMPLE"] != nil) {
            self.POINT_TYPE_TENDER_PERSENT_EXAMPLE = result[@"POINT_TYPE_TENDER_PERSENT_EXAMPLE"];
        }
        
 
    } fail:^(NSError *error) {
     
    }];
    
}

- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    //提现手续费，每笔扣多少积分
    if (self.POINT_TYPE_REGIST == nil ||
        self.POINT_TYPE_FRIEND_REGIST == nil ||
        self.POINT_TYPE_TENDER_PERSENT == nil ||
        self.POINT_TYPE_TENDER_PERSENT_EXAMPLE == nil) {
        
        [self regIntegral];
    }
  
}


/**
 *XXXXXXXXXXXXX
 */
- (void)createTableView{
    
    self.jfgzTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kWIDTH, kHEIGHT) style:UITableViewStyleGrouped];
    
    [self.view addSubview:self.jfgzTableView];
    
    self.jfgzTableView.delegate = self;
    
    self.jfgzTableView.dataSource = self;
    
}

/**
 *XXXXXXXXXXXXX
 */
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.sectionTitleArr.count;
    
}

/**
 *XXXXXXXXXXXXX
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1;
    
}

/**
 *XXXXXXXXXXXXX
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    JFGZCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JFGZCell"];
    
    if (!cell) {
        
        cell = [[JFGZCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"JFGZCell"];
        
    }
    
    if (indexPath.section == 0) {
        
        cell.str = self.firstStr;
        
    }else if (indexPath.section == 1){
        
        cell.str = self.secondStr;
        
        cell.jfscButton.frame = CGRectMake(15 * FitWidth, 190 * FitHeight, 100 * FitWidth, self.buttonHeihgt);
        
        cell.jfscButton.hidden = self.close;
        
        [cell.jfscButton addTarget:self action:@selector(celljfscButton:) forControlEvents:UIControlEventTouchUpInside];
        
    }else{
        
        cell.str = self.thirdStr;
        
    }
    
    
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}


/**
 * cell 点击方法
 */
- (void)celljfscButton:(UIButton *)button {
    
    WDJFViewController *wdjfVC = [[WDJFViewController alloc] init];
    
    wdjfVC.sid = self.sid;
    
    [self.navigationController pushViewController:wdjfVC animated:YES];
}


/**
 *XXXXXXXXXXXXX
 */
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    UIButton *cellButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    cellButton.frame = CGRectMake(0, 0, 60 * FitWidth, 40 * FitHeight);
    
    [cellButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    cellButton.titleLabel.textAlignment = NSTextAlignmentLeft;
    
    [cellButton addTarget:self action:@selector(cellButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    cellButton.backgroundColor = [UIColor whiteColor];
    
    cellButton.tag = section + 10000;
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(15 * FitWidth, 0, kWIDTH, FitHeight * 40)];
    
    [cellButton addSubview:titleLabel];
    
    titleLabel.text = [self.sectionTitleArr objectAtIndex:section];
    
    titleLabel.textAlignment = NSTextAlignmentLeft;
    
    titleLabel.font = [UIFont systemFontOfSize:13];
    
    titleLabel.textColor = [UIColor colorWithRed:27 / 255.0 green:28 / 255.0 blue:88 / 255.0 alpha:1.0];
    
    UIImageView *xiajiantouImageView = [[UIImageView alloc] initWithFrame:CGRectMake(kWIDTH - 10 * FitWidth - 30 * FitWidth, 15 * FitHeight, 18 , 10)];
    
    [cellButton addSubview:xiajiantouImageView];
    
    
    if (section == 0) {
        
        xiajiantouImageView.image = [UIImage imageNamed:self.jiantou1Name];
        
    }
    if (section == 1) {
        
        xiajiantouImageView.image = [UIImage imageNamed:self.jiantou2Name];
        
    }
    if (section == 2) {
        
        xiajiantouImageView.image = [UIImage imageNamed:self.jiantou3Name];
        
    }
    
    
    return cellButton;
}


/**
 *XXXXXXXXXXXXXXXXXX
 */
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 40 * FitHeight;
    
}


/**
 *XXXXXXXXXXXXXXXXXX
 */
- (void)cellButtonClicked:(UIButton *)button {
    
    button.selected = !button.isSelected;
    
    if (button.tag == 10000) {
        
        if (button.isSelected) {
            
            if (self.firstStr == nil) {
                
                CGFloat XXX = self.POINT_TYPE_TENDER_PERSENT.floatValue * 100;
                
                int XXXInt = (int)XXX;
                
                self.firstStr = [NSString stringWithFormat:@"1. 新手注册送%@积分；\n2. 邀请好友注册送%@积分；\n3. 每日签到奖励10积分，连续7日签到额外奖励50积分；\n4. 投资产品按照投资金额年化%d%s送相应积分；投资奖励积分=投资金额*项目期限/365天*%@;\n%@\n5. 会员奖励积分及活动返还积分，具体见会员奖励规则;\n6. 其他。",self.POINT_TYPE_REGIST,self.POINT_TYPE_FRIEND_REGIST,XXXInt,"%",self.POINT_TYPE_TENDER_PERSENT,self.POINT_TYPE_TENDER_PERSENT_EXAMPLE];
                
                self.firstStr = self.firstStr;
                
                self.jiantou1Name = @"top-arrow";
                
                    [self.jfgzTableView reloadData];
            }else{
                
                self.firstStr = nil;
                
                self.jiantou1Name = @"down-arrow";
                
                [self.jfgzTableView reloadData];

            }
        }
    }
        if (button.tag == 10001) {
            
            if (button.isSelected) {
                
                if (self.secondStr == nil) {
                    
                    self.secondStr = @"1. 积分可兑换铭捷贷现金券及实物商品等；\n2. 积分可兑换铭捷贷现金券规则：\n1000积分=10元现金券\n1900积分=20元现金券\n2700积分=30元现金券\n4000积分=50元现金券\n7000积分=100元现金券\n注：现金券使用见各现金券具体使用规则；";
                    
                    self.jiantou2Name = @"top-arrow";
                    
                    self.buttonHeihgt = 20 * FitHeight;
                    
                    self.close = NO;
                    
                    [self.jfgzTableView reloadData];
                }else{
                    
                    self.secondStr = nil;
                    
                    self.buttonHeihgt = 0;
                    
                    self.close = YES;
                    
                    self.jiantou2Name = @"down-arrow";
                    
                    [self.jfgzTableView reloadData];
                }
            }
        }
            if (button.tag == 10002) {
                
                if (button.isSelected) {
                    
                    if (self.thirdStr == nil) {
                        
                        self.thirdStr = @"积分具有有效期，在每年6月30日和12月31日将消除当日积分余额的25%。\n(例：2015年6月30日，当日积分余额10000分，积分将消除2500积分)";
                        
                        self.jiantou3Name = @"top-arrow";
                        
                        [self.jfgzTableView reloadData];
                    }else{
                        
                        self.thirdStr = nil;
                        
                        self.jiantou3Name = @"down-arrow";
                        
                        [self.jfgzTableView reloadData];
                    }
                }
            }
    
}

/**
 *XXXXXXXXXXXXXXXXXX
 */
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        
        if (self.firstStr == nil) {
            
            CGFloat height = [JFGZCell heightOfLabel:self.firstStr andWith:kWIDTH];
            
            return height ;
            
        }else{
        
            return 220 * FitHeight;
        }
        
        
        
    }else if (indexPath.section == 1){
        
        if (self.secondStr == nil) {
            
            CGFloat height = [JFGZCell heightOfLabel:self.secondStr andWith:kWIDTH];
            
            return height;
        }else{
            
            CGFloat height = [JFGZCell heightOfLabel:self.secondStr andWith:kWIDTH];
            
            return 220 * FitHeight;
        }
        
        
        
    }else{
        
        if (self.thirdStr == nil) {
            CGFloat height = [JFGZCell heightOfLabel:self.thirdStr andWith:kWIDTH];
            
            return height;
        }else{
            
            CGFloat height = [JFGZCell heightOfLabel:self.thirdStr andWith:kWIDTH];
            
            return height + 10 * FitHeight;
        }
        
        
        
    }
    

}

/**
 *XXXXXXXXXXXXXXXXXX
 */
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    if (section == 2) {
        
        return 500 * FitHeight;
        
    }
    
    return 1.0;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if (section == 2) {
        
        UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kWIDTH, 470 * FitHeight)];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, footerView.frame.size.height - 30 * FitHeight, kWIDTH, 30 * FitHeight)];
        
        [footerView addSubview:label];
        
        label.textAlignment = NSTextAlignmentCenter;
        
        label.textColor = [UIColor grayColor];
        
        label.textColor = [UIColor darkGrayColor];
        
        label.font = [UIFont systemFontOfSize:15];
        
        label.text = @"以上活动解释权归铭捷贷所有";
        
        label.backgroundColor = [UIColor groupTableViewBackgroundColor];
        
        return footerView;
    }
    
    return nil;
}




@end
