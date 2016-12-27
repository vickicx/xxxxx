//
//  ZRZmodel.h
//  Yilicai
//
//  Created by 盐商 on 16/3/7.
//  Copyright © 2016年 Louding. All rights reserved.
//

#import "BaseModel.h"

@interface ZRZmodel : BaseModel

@property (nonatomic, copy) NSString *transfer_products_title;

@property (nonatomic, copy) NSString *transfer_period;

@property (nonatomic, copy) NSNumber *oid_transfer_id;

@property (nonatomic, copy) NSString *transfer_capital_scale;

@property (nonatomic, copy) NSNumber *prev_oid_tender_id;

@property (nonatomic, copy) NSString *products_title;//产品名

@property (nonatomic, copy) NSString *transfer_manage_fee_scale;

@property (nonatomic, copy) NSString *finance_interest_rate;

@property (nonatomic, copy) NSString *finance_period;

@property (nonatomic, copy) NSString *cancel_status;

@property (nonatomic, copy) NSString *failed_flg;

@property (nonatomic, copy) NSString *transfer_time;

@property (nonatomic, copy) NSString *ins_date;

@property (nonatomic, copy) NSString *upd_date;

@property (nonatomic, copy) NSNumber *oid_user_id;

@property (nonatomic, copy) NSString *discount_amount;

@property (nonatomic, copy) NSString *min_tender_amount;

@property (nonatomic, copy) NSString *tender_amount;

@property (nonatomic, copy) NSString *transfer_capital;

@property (nonatomic, copy) NSNumber *transfer_contract_id;

@property (nonatomic, copy) NSNumber *oid_original_tender_id;

@property (nonatomic, copy) NSString *transfer_capital_wait;

@property (nonatomic, copy) NSString *transfer_full_status;

@property (nonatomic, copy) NSString *activity;

@property (nonatomic, copy) NSString *transfer_interest_rate;//利息

@end
