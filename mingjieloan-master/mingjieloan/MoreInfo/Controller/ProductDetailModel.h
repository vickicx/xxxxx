//
//  ProductDetailModel.h
//  mingjieloan
//
//  Created by kang on 16/12/30.
//  Copyright © 2016年 mingjie. All rights reserved.
//

#import "BaseModel.h"

@interface ProductDetailModel : BaseModel

@property (nonatomic, copy)NSString *agreement;// = "\U300a\U501f\U6b3e\U534f\U8bae\U300b\U300a\U51fa\U501f\U4eba\U54a8\U8be2\U670d\U52a1\U534f\U8bae\U300b\U300a\U4fdd\U8bc1\U5408\U540c\U300b";
@property (nonatomic, copy)NSString *annualizedGain;// = "4.8";
@property (nonatomic, assign)NSInteger baseLimitAmount;// = 10000;
@property (nonatomic, copy)NSString *collateralDescription;// = "";
@property (nonatomic, copy)NSString *description;//担保方介绍
@property (nonatomic, copy)NSString *descriptionRiskDescri;//安全保障
@property (nonatomic, copy)NSString *detailDescription;// 项目简介
@property (nonatomic, copy)NSString *expirationDate;// = "4\U592911\U65f637\U5206";
@property (nonatomic, assign)NSInteger extraRate;
@property (nonatomic, copy)NSString *firstPaybackDate;// = "<null>";
@property (nonatomic, copy)NSString *guaranteeModeName;// = "\U7b2c\U4e09\U65b9\U673a\U6784\U62c5\U4fdd";
@property (nonatomic, copy)NSString *interestBeginDate;// = "";
@property (nonatomic, strong)NSMutableArray *investmentPeriodDesc;//* =         (12,"\U5929");*/
@property (nonatomic, assign)NSInteger investmentProgress;// = 0;//百分比
@property (nonatomic, copy)NSString *name;//项目名称
@property (nonatomic, assign)NSInteger newstatus;// = 5;
@property (nonatomic, copy)NSString *products_type;// = 01;
@property (nonatomic, assign)NSInteger remainingInvestmentAmount;//剩余可投钱
@property (nonatomic, copy)NSString *repaymentMethodName;// = "\U5230\U671f\U8fd8\U672c\U4ed8\U606f";
@property (nonatomic, assign)NSInteger singlePurchaseLowerLimit;//已投 = 10000;
@property (nonatomic, assign)NSInteger status;// = 5;
@property (nonatomic, copy)NSString *tenderAward;
@property (nonatomic, assign)NSInteger totalInvestment;// = 2000000;
@property (nonatomic, copy)NSString *transfer_froze_time;




@end
