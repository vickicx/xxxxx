//
//  ProductModel.h
//  mingjieloan
//
//  Created by kang on 16/12/28.
//  Copyright © 2016年 mingjie. All rights reserved.
//

#import "BaseModel.h"

@interface ProductModel : BaseModel


@property (nonatomic, copy)NSString *strId;
//百分比
@property (nonatomic, assign)NSInteger investmentProgress;

//标的状态
@property (nonatomic, assign)NSInteger statu;

//判断新手
@property (nonatomic, assign)NSInteger new_hand;

//剩下多少钱钱可投
@property (nonatomic, copy)NSString *remainingInvestmentAmount;

@property (nonatomic, assign)NSInteger oid_transfer_id;

@property (nonatomic, assign)NSInteger is_transfer;

@property (nonatomic, copy)NSString *String; //名称

@property (nonatomic, assign)double annualizedGain; //预计年化收益率

@property (nonatomic, strong)NSMutableArray *investmentPeriodDesc; //投资时限

@property (nonatomic, copy)NSString *repaymentMethodName;//到期还本付息

@property (nonatomic, assign)NSInteger confine;

@property (nonatomic, assign)NSInteger activity; ///////用加息

@property (nonatomic, copy)NSString *name;

//什么什么专区
@property (nonatomic, copy)NSString *product_type_name;

@property (nonatomic, copy)NSString *product_type_image_url;

@property (nonatomic, copy)NSString *activityTab;

@property (nonatomic, assign)NSInteger activityType;

@property (nonatomic, assign)NSInteger singlePurchaseLowerLimit;

@property (nonatomic, copy)NSString *guaranteeModeName;

@property (nonatomic, copy)NSString *totalInvestment;

@property (nonatomic, assign)NSInteger guaranteeMode;

@property (nonatomic, assign)NSInteger repaymentMethod;

@property (nonatomic, copy)NSString *productUrl;

@property (nonatomic, assign)NSInteger productType;

@property (nonatomic, assign)NSInteger auditinfo;

@property (nonatomic, assign)NSInteger origininfo;

@property (nonatomic, copy)NSString *bondingDesc;

@property (nonatomic, copy)NSString *guarantee;

@property (nonatomic, assign)double extraRate;



@end
