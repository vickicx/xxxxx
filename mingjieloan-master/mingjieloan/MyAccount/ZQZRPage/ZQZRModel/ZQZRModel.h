//
//  ZQZRModel.h
//  Yilicai
//
//  Created by 盐商 on 16/2/29.
//  Copyright © 2016年 Louding. All rights reserved.
//

#import "BaseModel.h"

@interface ZQZRModel : BaseModel

@property (nonatomic, copy) NSString *products_title;//产品标题

@property (nonatomic, copy) NSNumber *oid_platform_products_id;//平台产品ID

@property (nonatomic, copy) NSString *tender_amount;//本金

@property (nonatomic, copy) NSString *finance_interest_rate;//预期收益率

@property (nonatomic, copy) NSString *finance_period;//期限

@property (nonatomic, copy) NSString *finance_start_interest_date;//起息日

@property (nonatomic, copy) NSString *finance_end_interest_date;//到息日

@property (nonatomic, copy) NSString *lave_date;//剩余天数

@property (nonatomic, copy) NSNumber *oid_tender_id;//转让标原始来源投资ID

@property (nonatomic, copy) NSNumber *oid_user_id;//转让人ID

@property (nonatomic, copy) NSString *min_tender_amount;//最小投标金额

@property (nonatomic, copy) NSString *tender_from;//转让来源

@property (nonatomic, copy) NSString *extra_rate;//加息

@end
