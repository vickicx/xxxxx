//
//  TZJLDetailModel.h
//  Yilicai
//
//  Created by 盐商 on 16/7/12.
//  Copyright © 2016年 Louding. All rights reserved.
//

#import "BaseModel.h"

@interface TZJLDetailModel : BaseModel

@property (nonatomic, copy) NSString *total;

@property (nonatomic, copy) NSString *products_title;

@property (nonatomic, copy) NSNumber *status;

@property (nonatomic, copy) NSString *extra_rate;

@property (nonatomic, copy) NSString *finance_interest_rate;

@property (nonatomic, copy) NSString *total_and_extra;

@property (nonatomic, copy) NSNumber *extra;

@property (nonatomic, copy) NSString *finance_period;

@property (nonatomic, copy) NSString *finance_end_interest_date;

@property (nonatomic, copy) NSString *url;

@property (nonatomic, copy) NSString *penalbond;

@property (nonatomic, copy) NSString *products_status;

@property (nonatomic, copy) NSString *finance_repay_type;

@property (nonatomic, copy) NSString *finance_amount;

@property (nonatomic, copy) NSString *finance_start_interest_date;

@end
