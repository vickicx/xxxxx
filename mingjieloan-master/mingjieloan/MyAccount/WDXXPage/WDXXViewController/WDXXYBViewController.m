//
//  WDXXYBViewController.m
//  Yilicai
//
//  Created by 盐商 on 16/5/13.
//  Copyright © 2016年 Louding. All rights reserved.
//

#import "WDXXYBViewController.h"
#import "MonthlyReportThreeCell.h"
#import "MonthlyReportFourCell.h"
#import "MonthlyReporthFiveCell.h"
#import "MonthlyReportSixCell.h"
#import "WDXXMonthlyReportModel.h"
#import "XXColor.h"

@interface WDXXYBViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UILabel *ybTitleLabel;

@property (nonatomic, strong) UILabel *ybDateLabel;

@property (nonatomic, strong) UIView *lineView;

@property (nonatomic, strong) UILabel *benyueshouyiLabel;

@property (nonatomic, strong) UILabel *benyueshouyiDateLabel;

@property (nonatomic, strong) UILabel *dateLineLabel;

@property (nonatomic, strong) UITableView *jrzcTableView;

@property (nonatomic, strong) UITableView *jrzcbhTableView;

@property (nonatomic, strong) UITableView *jfbhTableView;

@property (nonatomic, strong) UITableView *xmskTableView;

@property (nonatomic, strong) UITableView *threeMonthTableView;

@property (nonatomic, strong) UITableView *monthlyReportTableView;

@property (nonatomic, strong) NSMutableArray *dataArr;

@property (nonatomic, strong) NSMutableArray *data2Arr;

@property (nonatomic, strong) NSMutableArray *mainArr;

@property (nonatomic, strong) NSMutableArray *main2Arr;

@property (nonatomic,strong) NSMutableDictionary *dataDic;

@property (nonatomic, copy) NSString *lastDay;

@property (nonatomic, strong) UILabel *bottomLabel;

@property (nonatomic, strong) UILabel *xianjinquanLabel;

@property (nonatomic, copy) NSString *dateStr;

@property (nonatomic, copy) NSString *bottomStr;

@end

@implementation WDXXYBViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        self.dataArr = [NSMutableArray array];
        self.data2Arr = [NSMutableArray array];
        self.mainArr = [NSMutableArray array];
        self.main2Arr = [NSMutableArray array];

    }
    
    return self;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"全部消息" style:UIBarButtonItemStylePlain target:nil action:nil];
    
    [self dataHandle];
    
    [self creatTableView];
    
    
}


- (void)dataHandle
{
    NSString *url = [NSString stringWithFormat:@"%@%@", HOSTURL, WDXXYB];
    
    NSString *body = [NSString stringWithFormat:@"sid=%@&month=%@", self.sid, self.month];
    
    [VVNetWorkTool postWithUrl:url body:body bodyType:0 httpHeader:nil responseType:0 progress:^(NSProgress *progress) {
        
    } success:^(id result) {
        
        self.dataDic = result;
        
        self.dataArr = [[result objectForKey:@"orders"] objectForKey:@"items"];
        
        self.lastDay = [result objectForKey:@"LastDay"];
        
        self.dateStr = [result objectForKey:@"MonthCn"];
        
        
        WDXXMonthlyReportModel *model = [[WDXXMonthlyReportModel alloc] init];
        
        [model setValuesForKeysWithDictionary:self.dataDic];
        
        [self.main2Arr addObject:model];
        
        for (NSDictionary *dic in self.dataArr) {
            
            WDXXMonthlyReportModel *model = [[WDXXMonthlyReportModel alloc] init];
            
            [model setValuesForKeysWithDictionary:dic];
            
            [self.mainArr addObject:model];
        }
        
        
        self.benyueshouyiLabel.text = [NSString stringWithFormat:@"本月收益%@元  (%@~%@)", [self.dataDic objectForKey:@"Income"], [self.dataDic objectForKey:@"FirstDay"], [self.dataDic objectForKey:@"LastDay"]];
        
        //        self.benyueshouyiDateLabel.text = [NSString stringWithFormat:@"(%@~%@)", [self.dataDic objectForKey:@"FirstDay"], [self.dataDic objectForKey:@"LastDay"]];
        
        //        NSString *str = [NSString stringWithFormat:@"%@月%@日", [[self.lastDay substringToIndex:7] substringFromIndex:5], [self.lastDay substringFromIndex:8]];
        
        self.bottomStr = [NSString stringWithFormat:@"以上数据截止到%@，您对账单有任何疑问,请联系客服咨询（400-807-6777）", [self.dataDic objectForKey:@"LastDay"]];
        
        
        //        if (self.bottomLabel != nil) {
        //
        //            self.bottomLabel.text = [NSString stringWithFormat:@"以上数据截止到%@，您对账单有任何疑问,请联系客服咨询（400-807-6777）", [self.dataDic objectForKey:@"LastDay"]];
        //
        //            //改变行间距
        //            NSMutableAttributedString * attributedString1 = [[NSMutableAttributedString alloc] initWithString:self.bottomLabel.text];
        //            NSMutableParagraphStyle * paragraphStyle1 = [[NSMutableParagraphStyle alloc] init];
        //            [paragraphStyle1 setLineSpacing:6];
        //            [attributedString1 addAttribute:NSParagraphStyleAttributeName value:paragraphStyle1 range:NSMakeRange(0, [self.bottomLabel.text length])];
        //            [self.bottomLabel setAttributedText:attributedString1];
        //            [self.bottomLabel sizeToFit];
        //            self.bottomLabel.textAlignment = NSTextAlignmentCenter;
        //        }
        
        self.xianjinquanLabel.text = [NSString stringWithFormat:@"(本月获得%@元现金券，使用%@元现金券，过期%@元现金券)", [self.dataDic objectForKey:@"RedPacketReceived"], [self.dataDic objectForKey:@"RedPacketUsed"], [self.dataDic objectForKey:@"RedPacketExpire"]];
        
        
        [self.monthlyReportTableView reloadData];
        
        
        
    } fail:^(NSError *error) {
        
    }];
}


- (void)creatTableView
{
    self.monthlyReportTableView = [[UITableView alloc] initWithFrame:CGRectMake(5 * FitWidth, 64, FitWidth * 375 - 10 * FitWidth, FitHeight * 667 - 64) style:UITableViewStyleGrouped];
    [self.view addSubview:self.monthlyReportTableView];
    self.monthlyReportTableView.backgroundColor = [UIColor whiteColor];
    
    self.monthlyReportTableView.delegate = self;
    self.monthlyReportTableView.dataSource = self;
    
    
    self.ybTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 20 * FitHeight, 200 * FitWidth, 25 * FitHeight)];
    [self.monthlyReportTableView addSubview:self.ybTitleLabel];
    
    self.ybTitleLabel.textColor = [XXColor goldenColor];
    self.ybTitleLabel.font = [UIFont systemFontOfSize:12];
    self.ybTitleLabel.text = [NSString stringWithFormat:@"%@年%@月账单", [self.msgTitle substringToIndex:4], [self.msgTitle substringFromIndex:6]];
    
//    self.ybTitleLabel.backgroundColor = [UIColor cyanColor];
    
    self.ybDateLabel = [[UILabel alloc] initWithFrame:CGRectMake(375 * FitWidth - 20 * FitWidth - 200 * FitWidth, 20 * FitHeight, 200 * FitWidth, 25 * FitHeight)];
    [self.monthlyReportTableView addSubview:self.ybDateLabel];
    self.ybDateLabel.textColor = [XXColor goldenColor];
    self.ybDateLabel.font = [UIFont systemFontOfSize:12];
    self.ybDateLabel.textAlignment = NSTextAlignmentRight;
    
    self.ybDateLabel.text = self.date;
    
//    self.ybDateLabel.backgroundColor = [UIColor yellowColor];
    
    
    self.lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 30 * FitHeight + self.ybTitleLabel.frame.size.height, self.monthlyReportTableView.frame.size.width, 1.5 * FitHeight)];
    [self.monthlyReportTableView addSubview:self.lineView];
    self.lineView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    
    self.benyueshouyiLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 40 * FitHeight + self.ybTitleLabel.frame.size.height + self.lineView.frame.size.height, self.view.frame.size.width, 30 * FitHeight)];
    [self.monthlyReportTableView addSubview:self.benyueshouyiLabel];
    self.benyueshouyiLabel.font = [UIFont systemFontOfSize:12];
    
    
//    self.benyueshouyiLabel.text = [NSString stringWithFormat:@"本月收益%@元", [self.dataDic objectForKey:@"Income"]];
//    self.benyueshouyiLabel.backgroundColor = [UIColor redColor];
    
    self.benyueshouyiDateLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.benyueshouyiLabel.frame.size.width, 40 * FitHeight + self.ybTitleLabel.frame.size.height + self.lineView.frame.size.height, 250 * FitWidth, 30 * FitHeight)];
    [self.monthlyReportTableView addSubview:self.benyueshouyiDateLabel];
    self.benyueshouyiDateLabel.font = [UIFont systemFontOfSize:12];
    self.benyueshouyiDateLabel.textColor = [UIColor grayColor];
    
//    self.benyueshouyiDateLabel.text = @"(2016-04-04~2016-04-30)";
    
    self.xianjinquanLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 260 * FitHeight, 375 * FitWidth - 10 * FitWidth, 30 * FitHeight)];
    self.xianjinquanLabel.backgroundColor = [UIColor colorWithRed:246 / 255.0 green:247 / 255.0 blue:248 / 255.0 alpha:1.0];
    [self.monthlyReportTableView addSubview:self.xianjinquanLabel];
    self.xianjinquanLabel.font = [UIFont systemFontOfSize:9.5];
    self.xianjinquanLabel.textAlignment = NSTextAlignmentLeft;
    
//    self.bottomLabel = [[UILabel alloc] initWithFrame:CGRectMake(40 * KWIDTH, 1010 * KHEIGHT, 375 * KWIDTH - 80 * KWIDTH, 60 * KHEIGHT)];
//    [self.monthlyReportTableView addSubview:self.bottomLabel];
//    self.bottomLabel.font = [UIFont systemFontOfSize:11.5];
//    self.bottomLabel.numberOfLines = 2;
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        
        return 5;
        
    }else if (section == 1) {
        
        return 9;
        
    }else if (section == 2) {
        
        return 2;
        
    }else if (section == 3) {
        
        if (self.mainArr.count > 0) {
            
            return 2 + self.mainArr.count;
        }
        
        return 2;
        
    }else {
        
        return 4;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    WDXXMonthlyReportModel *model = [[WDXXMonthlyReportModel alloc] init];
    
    if (self.main2Arr.count > 0) {
        
        model = [self.main2Arr objectAtIndex:0];
    }
    
    //金融资产
    if (indexPath.section == 0) {
        
        MonthlyReporthFiveCell *firstCell = [tableView dequeueReusableCellWithIdentifier:[NSString stringWithFormat:@"%ld%ld", indexPath.section, indexPath.row]];
        if (!firstCell) {
            
            firstCell = [[MonthlyReporthFiveCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[NSString stringWithFormat:@"%ld%ld", indexPath.section, indexPath.row]];
        }
        
        if (indexPath.row == 0) {
            
            firstCell.backgroundColor = [UIColor colorWithRed:223 / 255.0 green:228 / 255.0 blue:232 / 255.0 alpha:1.0];
            
            firstCell.secondLabel.text = @"总资产";
            
            firstCell.thirdLabel.text = @"投资项目";
            
            firstCell.fourthLabel.text = @"账户余额";
            
            firstCell.fifthLabel.text = @"积分";
        }else{
            
            if (indexPath.row % 2 != 0) {
                
                firstCell.backgroundColor = [UIColor colorWithRed:246 / 255.0 green:247 / 255.0 blue:248 / 255.0 alpha:1.0];
            }
        }
        
        
        if (indexPath.row == 1) {
            
            firstCell.firstLabel.text = model.FirstDay;
            firstCell.secondLabel.text = model.TotalFirstDay;
            firstCell.thirdLabel.text = model.TenderFirstDay;
            firstCell.fourthLabel.text = model.AccountFirstDay;
            firstCell.fifthLabel.text = model.AccumulateFirstDay;
        }
        if (indexPath.row == 2) {
            
            firstCell.firstLabel.text = model.LastDay;
            firstCell.secondLabel.text = model.TotalLastDay;
            firstCell.thirdLabel.text = model.TenderLastDay;
            firstCell.fourthLabel.text = model.AccountLastDay;
            firstCell.fifthLabel.text = model.AccumulateLastDay;
        }
        if (indexPath.row == 3) {
            
            firstCell.firstLabel.text = @"变化值";
            firstCell.secondLabel.text = model.TotalChange;
            firstCell.thirdLabel.text = model.TenderChange;
            firstCell.fourthLabel.text = model.AccountChange;
            firstCell.fifthLabel.text = model.AccumulateChange;
            
            //总资产变化
            if (model.TotalChange.integerValue > 0) {
                
                firstCell.secondLabel.textColor = [UIColor colorWithRed:46 / 255.0 green:163 / 255.0 blue:64 / 255.0 alpha:1.0];
                
                firstCell.secondLabel.text = [NSString stringWithFormat:@"+%@", model.TotalChange];
            }
            if (model.TotalChange.integerValue < 0) {
                
                firstCell.secondLabel.textColor = [UIColor colorWithRed:253 / 255.0 green:40 / 255.0 blue:19 / 255.0 alpha:1.0];
                
                firstCell.secondLabel.text = [NSString stringWithFormat:@"%@", model.TotalChange];
            }
            
            //投资项目变化
            if (model.TenderChange.integerValue > 0) {
                
                firstCell.thirdLabel.textColor = [UIColor colorWithRed:46 / 255.0 green:163 / 255.0 blue:64 / 255.0 alpha:1.0];
                
                firstCell.thirdLabel.text = [NSString stringWithFormat:@"+%@", model.TenderChange];
            }
            if (model.TenderChange.integerValue < 0) {
                
                firstCell.thirdLabel.textColor = [UIColor colorWithRed:253 / 255.0 green:40 / 255.0 blue:19 / 255.0 alpha:1.0];
                
                firstCell.thirdLabel.text = [NSString stringWithFormat:@"%@", model.TenderChange];
            }
            
            //账户余额变化
            if (model.AccountChange.integerValue > 0) {
                
                firstCell.fourthLabel.textColor = [UIColor colorWithRed:46 / 255.0 green:163 / 255.0 blue:64 / 255.0 alpha:1.0];
                
                firstCell.fourthLabel.text = [NSString stringWithFormat:@"+%@", model.AccountChange];
            }
            if (model.AccountChange.integerValue < 0) {
                
                firstCell.fourthLabel.textColor = [UIColor colorWithRed:253 / 255.0 green:40 / 255.0 blue:19 / 255.0 alpha:1.0];
                
                firstCell.fourthLabel.text = [NSString stringWithFormat:@"%@", model.AccountChange];
            }
            
            //积分变化
            if (model.AccumulateChange.integerValue > 0) {
                
                firstCell.fifthLabel.textColor = [UIColor colorWithRed:46 / 255.0 green:163 / 255.0 blue:64 / 255.0 alpha:1.0];
                
                firstCell.fifthLabel.text = [NSString stringWithFormat:@"+%@", model.AccumulateChange];
            }
            if (model.AccumulateChange.integerValue < 0) {
                
                firstCell.fifthLabel.textColor = [UIColor colorWithRed:253 / 255.0 green:40 / 255.0 blue:19 / 255.0 alpha:1.0];
                
                firstCell.fifthLabel.text = [NSString stringWithFormat:@"%@", model.AccumulateChange];
            }
            
        }
//        if (indexPath.row == 4) {
//            
//            UILabel *fourLabel = [[UILabel alloc] initWithFrame:firstCell.frame];
//            [firstCell addSubview:fourLabel];
//            fourLabel.text = [NSString stringWithFormat:@"本月获得%@元现金券，使用%@元现金券，过期%@元现金券", model.RedPacketReceived, model.RedPacketUsed, model.RedPacketExpire];
//        }
        
        firstCell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        return firstCell;
        
    }else if (indexPath.section == 1) {
        
        //金融资产变化
        MonthlyReportThreeCell *secondCell = [tableView dequeueReusableCellWithIdentifier:[NSString stringWithFormat:@"%ld%ld", indexPath.section, indexPath.row]];
        if (!secondCell) {
            
            secondCell = [[MonthlyReportThreeCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[NSString stringWithFormat:@"%ld%ld", indexPath.section, indexPath.row]];
        }
        
        if (indexPath.row == 0) {
            secondCell.backgroundColor = [UIColor colorWithRed:223 / 255.0 green:228 / 255.0 blue:232 / 255.0 alpha:1.0];
            
            secondCell.thirdLabel.text = @"总资产";
        }else{
            
            if (indexPath.row % 2 != 0) {
                
                secondCell.backgroundColor = [UIColor colorWithRed:246 / 255.0 green:247 / 255.0 blue:248 / 255.0 alpha:1.0];
            }
        }
        
        if (indexPath.row == 1) {
            
            secondCell.firstLabel.text = model.FirstDay;
            secondCell.thirdLabel.text = model.TotalFirstDay;
        }
        if (indexPath.row == 2) {
            
            secondCell.firstLabel.text = @"充值";
            secondCell.thirdLabel.text = model.Recharge;
        }
        if (indexPath.row == 3){
            
            secondCell.firstLabel.text = @"提现";
            secondCell.thirdLabel.text = model.Withdraw;
        }
        if (indexPath.row == 4){
            
            secondCell.secondLabel.text = @"投资项目";
            secondCell.thirdLabel.text = model.IncomeTender;
        }
        if (indexPath.row == 5){
            
            secondCell.firstLabel.text = @"收益";
            secondCell.secondLabel.text = @"现金券抵扣";
            secondCell.thirdLabel.text = model.RedPacketUsed;
        }
        if (indexPath.row == 6) {
            
            secondCell.secondLabel.text = @"返现";
            secondCell.thirdLabel.text = model.IncomeBack;
        }
        if (indexPath.row == 7) {
            
            secondCell.firstLabel.text = model.LastDay;
            secondCell.thirdLabel.text = model.TotalLastDay;
        }
        if (indexPath.row == 8) {
            
            secondCell.firstLabel.text = @"变化值";
            secondCell.thirdLabel.text = model.TotalChange;
            
            if (model.TotalChange.integerValue > 0) {
                
                secondCell.thirdLabel.textColor = [UIColor colorWithRed:46 / 255.0 green:163 / 255.0 blue:64 / 255.0 alpha:1.0];
                
                secondCell.thirdLabel.text = [NSString stringWithFormat:@"+%@", model.TotalChange];
            }
            if (model.TotalChange.integerValue < 0) {
                
                secondCell.thirdLabel.textColor = [UIColor colorWithRed:253 / 255.0 green:40 / 255.0 blue:19 / 255.0 alpha:1.0];
                
                secondCell.thirdLabel.text = [NSString stringWithFormat:@"%@", model.TotalChange];
                
                
            }
            
        }
        
        secondCell.selectionStyle = UITableViewCellSelectionStyleNone;
        return secondCell;
        
    }else if (indexPath.section == 2) {
        
        
        //积分变化
        MonthlyReportSixCell *thirdCell = [tableView dequeueReusableCellWithIdentifier:[NSString stringWithFormat:@"%ld%ld", indexPath.section, indexPath.row]];
        if (!thirdCell) {
            
            thirdCell = [[MonthlyReportSixCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[NSString stringWithFormat:@"%ld%ld", indexPath.section, indexPath.row]];
        }
        
        if (indexPath.row == 0) {
            thirdCell.backgroundColor = [UIColor colorWithRed:223 / 255.0 green:228 / 255.0 blue:232 / 255.0 alpha:1.0];
            
            thirdCell.secondLabel.text = model.FirstDay;
            thirdCell.thirdLabel.text = @"获得";
            thirdCell.fourthLabel.text = @"花费";
            thirdCell.fifthLabel.text = model.LastDay;
            thirdCell.sixthLabel.text = @"变化值";
        }else{
            
            if (indexPath.row % 2 != 0) {
                
                thirdCell.backgroundColor = [UIColor colorWithRed:246 / 255.0 green:247 / 255.0 blue:248 / 255.0 alpha:1.0];
                thirdCell.firstLabel.text = @"积分";
                thirdCell.secondLabel.text = model.AccumulateFirstDay;
                
                thirdCell.thirdLabel.text = model.AccumulateReceived;
                if (model.AccumulateReceived.integerValue > 0) {
                    
                    thirdCell.thirdLabel.textColor = [UIColor colorWithRed:46 / 255.0 green:163 / 255.0 blue:64 / 255.0 alpha:1.0];
                    
                    thirdCell.thirdLabel.text = [NSString stringWithFormat:@"+%@", model.AccumulateReceived];
                }
                
                thirdCell.fourthLabel.text = model.AccumulateUsed;
                if (model.AccumulateUsed.integerValue < 0) {
                    
                    thirdCell.fourthLabel.textColor = [UIColor colorWithRed:253 / 255.0 green:40 / 255.0 blue:19 / 255.0 alpha:1.0];
                    
                    thirdCell.fourthLabel.text = [NSString stringWithFormat:@"%@", model.AccumulateUsed];
                }
                
                thirdCell.fifthLabel.text = model.AccumulateLastDay;
                thirdCell.sixthLabel.text = model.AccumulateChange;
                if (model.AccumulateChange.integerValue > 0) {
                    
                    thirdCell.sixthLabel.textColor = [UIColor colorWithRed:46 / 255.0 green:163 / 255.0 blue:64 / 255.0 alpha:1.0];
                    
                    thirdCell.sixthLabel.text = [NSString stringWithFormat:@"+%@", model.AccumulateChange];
                }
                if (model.AccumulateChange.integerValue < 0) {
                    
                    thirdCell.sixthLabel.textColor = [UIColor colorWithRed:253 / 255.0 green:40 / 255.0 blue:19 / 255.0 alpha:1.0];
                    
                    thirdCell.sixthLabel.text = [NSString stringWithFormat:@"%@", model.AccumulateChange];
                }
                
            }
        }
        
        thirdCell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        return thirdCell;
        
    }else if (indexPath.section == 3) {
        
        
        //项目收款
        
        MonthlyReportFourCell *fourthCell = [tableView dequeueReusableCellWithIdentifier:[NSString stringWithFormat:@"%ld%ld", indexPath.section, indexPath.row]];
        if (!fourthCell) {
            
            fourthCell = [[MonthlyReportFourCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[NSString stringWithFormat:@"%ld%ld", indexPath.section, indexPath.row]];
        }
        
        if (indexPath.row == 0) {
            fourthCell.backgroundColor = [UIColor colorWithRed:223 / 255.0 green:228 / 255.0 blue:232 / 255.0 alpha:1.0];
            
            fourthCell.secondLabel.text = @"收款额";
            fourthCell.thirdLabel.text = @"本金";
            fourthCell.fourthLabel.text = @"收益";
            
        }else{
            
            if (indexPath.row % 2 != 0) {
                
                fourthCell.backgroundColor = [UIColor colorWithRed:246 / 255.0 green:247 / 255.0 blue:248 / 255.0 alpha:1.0];
            }
            
            if (indexPath.row == 1) {
                
                fourthCell.firstLabel.text = @"总计";
                fourthCell.secondLabel.text = model.ProjectSumTotal;
                fourthCell.thirdLabel.text = model.ProjectSumCapital;
                fourthCell.fourthLabel.text = [NSString stringWithFormat:@"+%@", model.ProjectSumInterest];
                fourthCell.fourthLabel.textColor = [UIColor colorWithRed:46 / 255.0 green:163 / 255.0 blue:64 / 255.0 alpha:1.0];
            }else{
                
                if (self.mainArr.count > 0) {
                    
                        model = [self.mainArr objectAtIndex:indexPath.row - 2];
                }
                
                fourthCell.firstLabel.text = model.products_title;
                fourthCell.secondLabel.text = model.sum_recover_amount;
                fourthCell.thirdLabel.text = model.recover_amount_capital_yes;
                fourthCell.fourthLabel.text = model.recover_amount_interest_yes;
                
                if (model.recover_amount_interest_yes.integerValue > 0) {
                    fourthCell.fourthLabel.text = [NSString stringWithFormat:@"+%@", model.recover_amount_interest_yes];
                    fourthCell.fourthLabel.textColor = [UIColor colorWithRed:46 / 255.0 green:163 / 255.0 blue:64 / 255.0 alpha:1.0];
                }
                
            }
        }
        
        
        fourthCell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        return fourthCell;
        
    }else{
        
        
        //未来三月预估
        MonthlyReportFourCell *fifthCell = [tableView dequeueReusableCellWithIdentifier:[NSString stringWithFormat:@"%ld%ld", indexPath.section, indexPath.row]];
        if (!fifthCell) {
            
            fifthCell = [[MonthlyReportFourCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[NSString stringWithFormat:@"%ld%ld", indexPath.section, indexPath.row]];
        }
        
        if (indexPath.row == 0) {
            fifthCell.backgroundColor = [UIColor colorWithRed:223 / 255.0 green:228 / 255.0 blue:232 / 255.0 alpha:1.0];
            
            fifthCell.secondLabel.text = @"收款额";
            fifthCell.thirdLabel.text = @"本金";
            fifthCell.fourthLabel.text = @"收益";
            
        }else{
            
            if (indexPath.row % 2 != 0) {
                
                fifthCell.backgroundColor = [UIColor colorWithRed:246 / 255.0 green:247 / 255.0 blue:248 / 255.0 alpha:1.0];
            }
            
            
            if (indexPath.row == 1) {
                
                fifthCell.firstLabel.text = model.PrognosisNextMonthTitle1;
                fifthCell.secondLabel.text = model.PrognosisNextMonthTotal1;
                fifthCell.thirdLabel.text = model.PrognosisNextMonthCapital1;
                fifthCell.fourthLabel.text = model.PrognosisNextMonthInterest1;
                
            }
            if (indexPath.row == 2) {
                
                fifthCell.firstLabel.text = model.PrognosisNextMonthTitle2;
                fifthCell.secondLabel.text = model.PrognosisNextMonthTotal2;
                fifthCell.thirdLabel.text = model.PrognosisNextMonthCapital2;
                fifthCell.fourthLabel.text = model.PrognosisNextMonthInterest2;
            }
            if (indexPath.row == 3) {
                
                fifthCell.firstLabel.text = model.PrognosisNextMonthTitle3;
                fifthCell.secondLabel.text = model.PrognosisNextMonthTotal3;
                fifthCell.thirdLabel.text = model.PrognosisNextMonthCapital3;
                fifthCell.fourthLabel.text = model.PrognosisNextMonthInterest3;
            }
            
            if (model.PrognosisNextMonthInterest3.integerValue > 0) {
                fifthCell.fourthLabel.textColor = [UIColor colorWithRed:46 / 255.0 green:163 / 255.0 blue:64 / 255.0 alpha:1.0];
                fifthCell.fourthLabel.text = [NSString stringWithFormat:@"+%@", fifthCell.fourthLabel.text];
            }
            
            
            
        }
        
        fifthCell.selectionStyle = UITableViewCellSelectionStyleNone;
        return fifthCell;
        
    }
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        
        return 25 * FitHeight;
    }else{
        
        return 30 * FitHeight;
    }
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        
        return 150 * FitWidth;
    }else{
        
        
        return 40 * FitHeight;
    }
    
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    
    if (section == 0) {
        
        return @"金融资产";
    }else if (section == 1){
        
        return @"金融资产变化";
    }else if (section == 2) {
        
        return @"积分变化";
    }else if (section == 3){
        
//        NSString *str = [NSString stringWithFormat:@"%@年%@月  项目收款(本金+收益)", [self.msgTitle substringToIndex:4], [self.msgTitle substringFromIndex:6]];
        
        
        NSString *str = [NSString stringWithFormat:@"%@  项目收款(本金+收益)", self.dateStr];
        
        
        
        return str;
    }else{
        
        return @"未来三月估算";
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 4) {
        
        return 80 * FitWidth;
    }
    
    return 0.1;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if (section == 4) {
        
        UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 80 * FitHeight)];
        
        self.bottomLabel = [[UILabel alloc] initWithFrame:CGRectMake(40 * FitWidth, 10 * FitHeight, 375 * FitWidth - 80 * FitWidth, 60 * FitHeight)];
        [footerView addSubview:self.bottomLabel];
        self.bottomLabel.font = [UIFont systemFontOfSize:11.5];
        self.bottomLabel.numberOfLines = 2;
        
        self.bottomLabel.text = self.bottomStr;
        
        if (self.bottomLabel.text != nil) {
            //改变行间距
            NSMutableAttributedString * attributedString1 = [[NSMutableAttributedString alloc] initWithString:self.bottomLabel.text];
            NSMutableParagraphStyle * paragraphStyle1 = [[NSMutableParagraphStyle alloc] init];
            [paragraphStyle1 setLineSpacing:6];
            [attributedString1 addAttribute:NSParagraphStyleAttributeName value:paragraphStyle1 range:NSMakeRange(0, [self.bottomLabel.text length])];
            [self.bottomLabel setAttributedText:attributedString1];
            [self.bottomLabel sizeToFit];
            self.bottomLabel.textAlignment = NSTextAlignmentCenter;
            
        }
        
        
        
//        self.bottomLabel.backgroundColor = [UIColor redColor];
        
        return footerView;
    }
    
    return nil;
}


//- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
//{
//    if (section == 4) {
//        
//        
//        
//        if (self.lastDay.length == 10) {
//            NSString *str = [NSString stringWithFormat:@"%@月%@日", [[self.lastDay substringToIndex:7] substringFromIndex:5], [self.lastDay substringFromIndex:8]];
//            
//            return [NSString stringWithFormat:@"以上数据截止到%@，您对账单有任何疑问,请联系客服咨询（400-807-6777）", str];
//        }
//        
//
//    }
//    
//    
//    
//    return nil;
//}


//- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
//{
//    UILabel *footerLabel = [[UILabel alloc] initWithFrame:CGRectMake(80 * KWIDTH, 0, 375 * KWIDTH - 160 * KWIDTH, 60 * KHEIGHT)];
//    
//    
//    if (self.dataDic != nil) {
//        NSString *str = [NSString stringWithFormat:@"%@月%@日", [[self.dataDic objectForKey:@"LastDay"] substringWithRange: NSMakeRange(6,7)], [[self.dataDic objectForKey:@"LastDay"] substringFromIndex:9]];
//        
//        footerLabel.text = [NSString stringWithFormat:@"以上数据截止到%@，您对账单有任何疑问,请联系客服咨询（400-807-6777）", str];
//        
////        return footerLabel;
//    }
//    
//    return [self.dataDic objectForKey:@"LastDay"];
//    
//    
//    
//}


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
