//
//  ReturningModel.h
//  Yilicai
//
//  Created by 盐商 on 16/7/13.
//  Copyright © 2016年 Louding. All rights reserved.
//

#import "BaseModel.h"

@interface ReturningModel : BaseModel

@property (nonatomic, copy) NSString *isTransfer;

@property (nonatomic, copy) NSString *total;

@property (nonatomic, copy) NSString *principalAndInterest;

@property (nonatomic, copy) NSString *extra_rate;

@property (nonatomic, copy) NSString *expiryDate;

@property (nonatomic, copy) NSString *statusText;

@property (nonatomic, copy) NSString *oid_tender_id;

@property (nonatomic, copy) NSNumber *repayTime;

@property (nonatomic, copy) NSString *id;

@property (nonatomic, copy) NSString *interestBeginDate;

@property (nonatomic, copy) NSString *price;

@property (nonatomic, copy) NSString *rate;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *createDate;

@property (nonatomic, copy) NSString *tender_from;


@end
