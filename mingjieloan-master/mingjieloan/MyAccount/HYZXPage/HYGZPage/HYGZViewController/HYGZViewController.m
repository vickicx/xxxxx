//
//  HYGZViewController.m
//  Yilicai
//
//  Created by 盐商 on 16/5/24.
//  Copyright © 2016年 Louding. All rights reserved.
//

#import "HYGZViewController.h"
#import "HYGZCell.h"
#import "HYGZ2Cell.h"


@interface HYGZViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *hygzTableView;

@property (nonatomic, strong) NSArray *sectionTitleArr;

@property (nonatomic, copy) NSString *firstStr;

@property (nonatomic, copy) NSString *secondStr;

@property (nonatomic, copy) NSString *thirdStr;

@property (nonatomic, copy) NSString *fourthStr;

@property (nonatomic, assign) NSInteger firstHeight;

@property (nonatomic, assign) NSInteger secondHeight;

@property (nonatomic, assign) NSInteger thirdHeight;

@property (nonatomic, assign) NSInteger fourthHeight;

@property (nonatomic, copy) NSString *boxTitleStr;

@property (nonatomic, copy) NSString *boxStr;

@property (nonatomic, copy) NSString *cakeTitleStr;

@property (nonatomic, copy) NSString *cakeStr;

@property (nonatomic, assign) NSInteger boxHeight;

@property (nonatomic, assign) NSInteger cakeHeight;

@property (nonatomic, strong) NSString *jiantouName;

@property (nonatomic, strong) NSString *jiantou1Name;

@property (nonatomic, strong) NSString *jiantou2Name;

@property (nonatomic, strong) NSString *jiantou3Name;

@property (nonatomic, strong) NSString *jiantou4Name;

@property (nonatomic, assign) NSInteger buttonHeihgt;

@property (nonatomic, assign) BOOL close;

@end

@implementation HYGZViewController

//- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
//    
//    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//    
//    if (self) {
//        
//           }
//    
//    return self;
//}



- (void)viewDidLoad {
    self.sectionTitleArr = [NSArray array];

    [super viewDidLoad];
    
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] init];
    
    backItem.title = @"会员规则";
    
    self.navigationController.navigationItem.backBarButtonItem = backItem;
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    UIColor * color = [UIColor whiteColor];
    NSDictionary * dict=[NSDictionary dictionaryWithObject:color forKey:NSForegroundColorAttributeName];
    self.navigationController.navigationBar.titleTextAttributes = dict;
    self.navigationItem.title = @"会员规则";
    
    self.jiantou1Name = @"down-arrow";
    self.jiantou2Name = @"down-arrow";
    self.jiantou3Name = @"down-arrow";
    self.jiantou4Name = @"down-arrow";
    
    self.buttonHeihgt = 0;
    self.close = YES;
    
    self.sectionTitleArr = @[@"如何成为铭捷贷会员", @"每月日均总资产计算", @"会员享受哪些特权", @"会员等级如何变动"];
    
    [self createTableView];
    
    if (self.zongzichan == 1) {
        
        self.firstStr = nil;
        self.firstHeight = 0;
        
        self.secondStr = @"在每一个自然月内，铭捷贷每日会统计用户账户里的总资产，取该自然月所有日总资产的平均值，即为每月日均总资产。总资产与每月日均总资产计算公式，如下图所示：";
        
        self.secondHeight = 70 * FitHeight;
        
        self.boxTitleStr = nil;
        self.boxStr = nil;
        self.cakeTitleStr = nil;
        self.cakeStr = nil;
        self.boxHeight = 0;
        self.cakeHeight = 0;
        
        self.fourthStr = nil;
        
        self.buttonHeihgt = 20 * FitHeight;
        self.close = NO;
        
        self.jiantou2Name = @"top-arrow";
        
        
        
        [self.hygzTableView reloadData];
    }
}

- (void)createTableView
{
    self.hygzTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kWIDTH, kHEIGHT) style:UITableViewStyleGrouped];
    [self.view addSubview:self.hygzTableView];
    self.hygzTableView.delegate = self;
    self.hygzTableView.dataSource = self;

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.section == 2) {
    
        HYGZ2Cell *cell = [tableView dequeueReusableCellWithIdentifier:@"HYGZ2Cell"];
        if (!cell) {
            
            cell = [[HYGZ2Cell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"HYGZ2Cell"];
            
        }
        
        cell.boxTitleStr = self.boxTitleStr;
        cell.boxStr = self.boxStr;
        cell.cakeTitleStr = self.cakeTitleStr;
        cell.cakeStr = self.cakeStr;
        cell.boxImageView.frame = CGRectMake(20 * FitWidth, 30 * FitHeight, 70 * FitWidth, self.boxHeight);
        cell.boxImageView.image = [UIImage imageNamed:@"box-white"];
        cell.cakeImageView.frame = CGRectMake(20 * FitWidth, 60 * FitHeight + cell.boxImageView.frame.size.height, 70 * FitWidth, self.boxHeight);
        cell.cakeImageView.image = [UIImage imageNamed:@"birthday-white"];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        return cell;
        
    }else{
        
        HYGZCell *cell = [tableView dequeueReusableCellWithIdentifier:[NSString stringWithFormat:@"HYGZCell%ld", (long)indexPath.section]];
        if (!cell) {
            
            cell = [[HYGZCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"HYGZCell"];
            
        }
        
        if (indexPath.section == 0) {
            
            cell.str = self.firstStr;
            cell.huiyuanImageView.image = [UIImage imageNamed:@"vip-grade"];
            cell.huiyuanImageView.frame = CGRectMake(15 * FitWidth, 100 * FitHeight + cell.describeLabel.frame.size.height + 15, kWIDTH - 30 * FitHeight, self.firstHeight);
        }
        if (indexPath.section == 1) {
            
            cell.str = self.secondStr;
            cell.huiyuanImageView.image = [UIImage imageNamed:@"money-count"];
            cell.huiyuanImageView.frame = CGRectMake(15 * FitWidth, 100 * FitHeight, kWIDTH - 30 * FitWidth, self.secondHeight);
            
            cell.hyzxButton.frame = CGRectMake(kWIDTH - 150 * FitWidth, 170 * FitHeight, 150 * FitWidth, self.buttonHeihgt);
            
            cell.hyzxButton.hidden = self.close;
            
            [cell.hyzxButton addTarget:self action:@selector(cellhyzxButton:) forControlEvents:UIControlEventTouchUpInside];
            
        }
        
        if (indexPath.section == 3) {
            
            cell.str = self.fourthStr;
        }

        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        return cell;
    }
    
    

}

/**
 *查看我的再投本金按钮
 */
- (void)cellhyzxButton:(UIButton *)button
{

    DepositsHistoryViewController *tzjliewController = [[DepositsHistoryViewController alloc] init];
    
    UIBarButtonItem *backIetm = [[UIBarButtonItem alloc] init];
    
    tzjliewController.sid = self.sid;
    
    tzjliewController.investing = self.investing;
    
    tzjliewController.interest = self.interest;
    
    tzjliewController.expectedReturn = self.expectedReturn;
    
    tzjliewController.pageTage = self.pageTage;
    
    backIetm.title = @"返回";
    
    self.navigationItem.backBarButtonItem = backIetm;
    
    [self.navigationController pushViewController:tzjliewController animated:YES];
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    UIButton *cellButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    cellButton.frame = CGRectMake(0, 0, 60 * FitWidth, 40 * FitHeight);

    [cellButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    cellButton.titleLabel.textAlignment = NSTextAlignmentLeft;
    
    [cellButton addTarget:self action:@selector(cellButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    cellButton.backgroundColor = [UIColor whiteColor];
    
        cellButton.titleLabel.backgroundColor = [XXColor btnGoldenColor];
    
    cellButton.tag = section + 10000;
    
    UIImageView *headImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10 * FitWidth, 15 * FitHeight, 20 * FitWidth, 20 * FitHeight)];
    [cellButton addSubview:headImageView];
    headImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"cellHead%ld", (long)section]];
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20 * FitWidth + headImageView.frame.size.width, 5 * FitHeight, kWIDTH, FitHeight * 40)];
    
    [cellButton addSubview:titleLabel];
    
    titleLabel.text = [self.sectionTitleArr objectAtIndex:section];
    titleLabel.textAlignment = NSTextAlignmentLeft;
    titleLabel.font = [UIFont systemFontOfSize:15];
    titleLabel.textColor = [UIColor blackColor];
    
    UIImageView *xiajiantouImageView = [[UIImageView alloc] initWithFrame:CGRectMake(kWIDTH - 10 * FitWidth - 35 * FitWidth, 25 * FitHeight, 18, 10)];
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
    if (section == 3) {
        
        xiajiantouImageView.image = [UIImage imageNamed:self.jiantou4Name];
    }
    
    
    return cellButton;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 50 * FitHeight;
}

- (void)cellButtonClicked:(UIButton *)button
{
    button.selected = !button.isSelected;
    
    if (button.tag == 10000) {
        
        if (button.isSelected) {
            
            if (self.firstStr == nil) {
                
                self.firstStr = @"1. 用户成功注册铭捷贷即为铭捷贷会员;\n2. 铭捷贷会员共分为V1、V2、V3、V4、V5、V6、V7、V8八个等级;\n3. 会员等级由客户上月日均总资产决定，会员等级越高，享受到的会员特权越多。";
                
                self.firstStr = self.firstStr;
                
                self.firstHeight = 335 * FitHeight;
                
                self.jiantou1Name = @"top-arrow";
                
                [self.hygzTableView reloadData];
            }else{
                
                self.firstStr = nil;
                self.firstHeight = 0;
                
                self.jiantou1Name = @"down-arrow";
                
                [self.hygzTableView reloadData];
            }
        }
    }
    if (button.tag == 10001) {
        
        if (button.isSelected) {
            
            if (self.secondStr == nil) {
                
                self.secondStr = @"在每一个自然月内，铭捷贷每日会统计用户账户里的总资产，取该自然月所有日总资产的平均值，即为每月日均总资产。总资产与每月日均总资产计算公式，如下图所示：";
                
                self.secondHeight = 70 * FitHeight;
                
                self.jiantou2Name = @"top-arrow";
                
                self.buttonHeihgt = 20 * FitHeight;
                
                self.close = NO;
                
                [self.hygzTableView reloadData];
            }else{
                
                self.secondStr = nil;
                
                self.secondHeight = 0;
                
                self.jiantou2Name = @"down-arrow";
                
                self.buttonHeihgt = 0;
                
                self.close = YES;
                
                [self.hygzTableView reloadData];
            }
        }
    }
    if (button.tag == 10002) {
        
        if (button.isSelected) {
            
            if (self.boxTitleStr == nil) {
                
                self.boxTitleStr = @"定期积分奖励";
                self.boxStr = @"V3，V4，V5，V6， V7和V8会员在每月1-10号，可领取最高10000分的奖励积分，积分可以在积分商城兑换现金券及奖品等。";
                self.cakeTitleStr = @"生日现金券";
                self.cakeStr = @"V4，V5，V6， V7和V8会员在生日当月，可领取最高100元的现金券。";
                self.boxHeight = 70 * FitHeight;
                self.cakeHeight = 70 * FitHeight;
                
                self.jiantou3Name = @"top-arrow";
                
                [self.hygzTableView reloadData];
            }else{
                
                self.boxTitleStr = nil;
                self.boxStr = nil;
                self.cakeTitleStr = nil;
                self.cakeStr = nil;
                self.boxHeight = 0;
                self.cakeHeight = 0;
                
                self.jiantou3Name = @"down-arrow";
                
                [self.hygzTableView reloadData];
            }
        }
    }
    if (button.tag == 10003) {
        
        if (button.isSelected) {
            
            if (self.fourthStr == nil) {
                
                self.fourthStr = @"1. 每月1日0点，铭捷贷根据会员上一月度日均总资产调整会员等级，并享受相应的特权；\n2. 系统自动调整会员等级，无需用户做特殊升级申请。\n\n举例：\n1. 用户A在2016年8月的月均总资产为120000元，满足V4条件，则用户A在9月1日起等级为V4，享受V4特权；\n2. 用户A在2016年的9月的月均总资产为25万元，满足V5条件，则用户A将在10月1日升级为V5，享受V5特权；\n3. 用户A在2016年9月的月均总资产为8万元，只满足V3条件，则用户A将在10月1日降级为V3，享受V3特权。";
                
                self.jiantou4Name = @"top-arrow";
                
                [self.hygzTableView reloadData];
            }else{
                
                self.fourthStr = nil;
                
                self.jiantou4Name = @"down-arrow";
                
                [self.hygzTableView reloadData];
            }
        }
    }
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.section == 0) {
        
        if (self.firstStr == nil) {
            
            CGFloat height = [HYGZCell heightOfLabel:self.firstStr andWith:kWIDTH - 30 * FitWidth];
            
            //NSLog(@"%f",height);
            
            return height;
            
        }else{
            
            CGFloat height = [HYGZCell heightOfLabel:self.firstStr andWith:kWIDTH - 30 * FitWidth];
            
            //NSLog(@"%f",height);
            
            return height + 380 * FitHeight;
        }
        
        
        
        
    }else if (indexPath.section == 1){
        
        if (self.secondStr == nil) {
            CGFloat height = [HYGZCell heightOfLabel:self.secondStr andWith:kWIDTH - 30 * FitWidth];
            
            return height;
        }else{
            
//            CGFloat height = [HYGZCell heightOfLabel:self.secondStr andWith:375 * KWIDTH];
            
            return 70 * FitHeight + 130 * FitHeight;
        }
        
        
        
    }else if (indexPath.section == 2){
        
        if (self.boxTitleStr == nil) {
            CGFloat height = [HYGZCell heightOfLabel:self.boxTitleStr andWith:kWIDTH - 30 * FitWidth];
            
            return height;
        }else{
            
            CGFloat height1 = [HYGZCell heightOfLabel:self.boxTitleStr andWith:kHEIGHT];
            
            CGFloat height2 = [HYGZCell heightOfLabel:self.boxStr andWith:kWIDTH];
            
            CGFloat height3 = [HYGZCell heightOfLabel:self.cakeTitleStr andWith:kWIDTH];
            
            CGFloat height4 = [HYGZCell heightOfLabel:self.cakeStr andWith:kWIDTH];
            
            return 230 * FitHeight;
            
        }
        
        
        
    }else{
        
        
        
        
        if (self.fourthStr == nil) {
            CGFloat height = [HYGZCell heightOfLabel:self.fourthStr andWith:kWIDTH - 30 * FitWidth];
            
            return height;
        }else{
            
//            CGFloat height = [HYGZCell heightOfLabel:self.fourthStr andWith:375 * KWIDTH];
            
            return 260 * FitHeight;
        }
        
        
        
    }
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    
    if (section == 3) {
        
        return 420 *FitHeight;
    }else{
        
        return 10 * FitHeight;
    }
    
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if (section == 2) {
        
        UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kWIDTH, 420 * FitHeight)];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, footerView.frame.size.height - 30 * FitHeight, kWIDTH, 30 * FitHeight)];
        [footerView addSubview:label];
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = [UIColor grayColor];
        label.textColor = [UIColor darkGrayColor];
        label.font = [UIFont systemFontOfSize:14 * FitWidth];
        
        label.text = @"铭捷贷保留最终解释权";
        label.backgroundColor = [UIColor groupTableViewBackgroundColor];
        
        return footerView;
    }
    
    return nil;
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
