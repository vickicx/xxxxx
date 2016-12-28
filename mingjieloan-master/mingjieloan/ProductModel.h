//
//  ProductModel.h
//  mingjieloan
//
//  Created by kang on 16/12/28.
//  Copyright © 2016年 mingjie. All rights reserved.
//

#import "BaseModel.h"

@interface ProductModel : BaseModel

@property (nonatomic, assign)NSInteger activity; ///////用加息
@property (nonatomic, copy)NSString *activityTab;
@property (nonatomic, assign)double annualizedGain; //预计年化收益率
@property (nonatomic, assign)NSInteger confine;
@property (nonatomic, assign)double extraRate;
@property (nonatomic, copy)NSString *financeStartDate;

@property (nonatomic, assign)NSInteger guaranteeMode;
@property (nonatomic, copy)NSString *guaranteeModeName;
@property (nonatomic, copy)NSString *strId;

@property (nonatomic, strong)NSMutableArray *investmentPeriodDesc; //投资时限
//百分比
@property (nonatomic, assign)NSInteger investmentProgress;
@property (nonatomic, assign)NSInteger is_transfer;
@property (nonatomic, copy)NSString *name; //名称
@property (nonatomic, assign)NSInteger newstatus;
@property (nonatomic, copy)NSString *oid_transfer_id;
//什么什么专区
@property (nonatomic, copy)NSString *productType;
@property (nonatomic, copy)NSString *productUrl;
@property (nonatomic, copy)NSString *product_type_image_url;
//剩下多少钱钱可投
@property (nonatomic, copy)NSString *remainingInvestmentAmount;
@property (nonatomic, copy)NSString *repaymentMethodName;//到期还本付息
@property (nonatomic, assign)NSInteger singlePurchaseLowerLimit;
//标的状态
@property (nonatomic, assign)NSInteger statu;
@property (nonatomic, assign)NSInteger totalInvestment;

@property (nonatomic, assign)NSInteger auditinfo;

@property (nonatomic, assign)NSInteger origininfo;

@property (nonatomic, copy)NSString *bondingDesc;

@property (nonatomic, copy)NSString *guarantee;


@end
