//
//  ReturnedModel.h
//  Yilicai
//
//  Created by 盐商 on 16/7/13.
//  Copyright © 2016年 Louding. All rights reserved.
//

#import "BaseModel.h"

@interface ReturnedModel : BaseModel

@property (nonatomic, copy) NSString *id;

@property (nonatomic, copy) NSString *interestBeginDate;

@property (nonatomic, copy) NSString *lastReturn;

@property (nonatomic, copy) NSString *rate;

@property (nonatomic, copy) NSString *price;

@property (nonatomic, copy) NSString *extra_rate;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *endDate;

@property (nonatomic, copy) NSString *statusText;

@property (nonatomic, copy) NSString *createDate;

@end
