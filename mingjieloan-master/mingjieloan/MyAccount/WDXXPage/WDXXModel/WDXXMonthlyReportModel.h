//
//  WDXXMonthlyReportModel.h
//  Yilicai
//
//  Created by 盐商 on 16/5/17.
//  Copyright © 2016年 Louding. All rights reserved.
//

#import "BaseModel.h"

@interface WDXXMonthlyReportModel : BaseModel

//金融资产
@property (nonatomic, copy) NSString *TotalFirstDay;//月初总资产
@property (nonatomic, copy) NSString *TenderFirstDay;// 月初项目资产
@property (nonatomic, copy) NSString *AccountFirstDay;// 月初账户余额
@property (nonatomic, copy) NSString *AccumulateFirstDay;// 月初积分
@property (nonatomic, copy) NSString *TotalLastDay;// 月末总资产
@property (nonatomic, copy) NSString *TenderLastDay;// 月末项目资产
@property (nonatomic, copy) NSString *AccountLastDay;// 月末账户余额
@property (nonatomic, copy) NSString *AccumulateLastDay;// 月末积分
@property (nonatomic, copy) NSString *TotalChange;// 总资产变化值
@property (nonatomic, copy) NSString *TenderChange;// 项目资产变化值
@property (nonatomic, copy) NSString *AccountChange;// 账户余额变化值
@property (nonatomic, copy) NSString *AccumulateChange;// 积分变化值
@property (nonatomic, copy) NSString *RedPacketReceived;// 现金卷获得
@property (nonatomic, copy) NSString *RedPacketUsed;// 现金卷使用
@property (nonatomic, copy) NSString *RedPacketExpire;// 现金卷过期
//金融资产变化
//@property (nonatomic, copy) NSString *TotalFirstDay;// 月初总资产
@property (nonatomic, copy) NSString *Recharge;// 充值
@property (nonatomic, copy) NSString *Withdraw;// 提现
@property (nonatomic, copy) NSString *IncomeTender;// 投资项目
//@property (nonatomic, copy) NSString *RedPacketUsed;// 现金卷抵扣
@property (nonatomic, copy) NSString *IncomeBack;// 返现
//@property (nonatomic, copy) NSString *TotalLastDay;// 月末总资产
//@property (nonatomic, copy) NSString *TotalChange;// 总资产变化值

//积分变化
//@property (nonatomic, copy) NSString *AccumulateFirstDay;// 月初积分
@property (nonatomic, copy) NSString *AccumulateReceived;// 获得积分
@property (nonatomic, copy) NSString *AccumulateUsed;// 花费积分
//@property (nonatomic, copy) NSString *AccumulateLastDay;// 月末积分
//@property (nonatomic, copy) NSString *AccumulateChange;// 积分变化值

//未来三月预估
@property (nonatomic, copy) NSString *PrognosisNextMonthTitle1;// 第一个月日期
@property (nonatomic, copy) NSString *PrognosisNextMonthTitle2;// 第二个月日期
@property (nonatomic, copy) NSString *PrognosisNextMonthTitle3;// 第三个月日期
@property (nonatomic, copy) NSString *PrognosisNextMonthTotal1;// 第一个月预测收款额
@property (nonatomic, copy) NSString *PrognosisNextMonthTotal2;// 第二个月预测收款额
@property (nonatomic, copy) NSString *PrognosisNextMonthTotal3;// 第三个月预测收款额
@property (nonatomic, copy) NSString *PrognosisNextMonthCapital1;// 第一个月预测本金
@property (nonatomic, copy) NSString *PrognosisNextMonthCapital2;// 第二个月预测本金
@property (nonatomic, copy) NSString *PrognosisNextMonthCapital3;// 第三个月预测本金
@property (nonatomic, copy) NSString *PrognosisNextMonthInterest1;// 第一个月预测收益
@property (nonatomic, copy) NSString *PrognosisNextMonthInterest2;// 第二个月预测收益
@property (nonatomic, copy) NSString *PrognosisNextMonthInterest3;// 第三个月预测收益

//收款项目(本金+收益)
@property (nonatomic, copy) NSString *ProjectSumTotal;// 项目总计 收款额
@property (nonatomic, copy) NSString *ProjectSumCapital;// 项目总计 收款额
@property (nonatomic, copy) NSString *ProjectSumInterest;// 项目总计 收款额
@property (nonatomic, copy) NSString *products_title;// 收款项目
@property (nonatomic, copy) NSString *sum_recover_amount;// 收款额
@property (nonatomic, copy) NSString *recover_amount_capital_yes;// 本金
@property (nonatomic, copy) NSString *recover_amount_interest_yes;// 收益

@property (nonatomic, copy) NSString *Income;// 本月收益
@property (nonatomic, copy) NSString *FirstDay;// 开始日期
@property (nonatomic, copy) NSString *LastDay;// 结束日期
@property (nonatomic, copy) NSString *MonthCn;// 月份

@end
