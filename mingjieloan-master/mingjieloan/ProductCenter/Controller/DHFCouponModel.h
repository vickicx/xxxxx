//
//  DHFCouponModel.h
//  mingjieloan
//
//  Created by kang on 17/1/6.
//  Copyright © 2017年 mingjie. All rights reserved.
//

#import "BaseModel.h"

@interface DHFCouponModel : BaseModel

@property (nonatomic, copy)NSString *cash_desc;
@property (nonatomic, copy)NSString *cash_price;
@property (nonatomic, copy)NSString *end_time;
@property (nonatomic, assign)NSInteger couponID;
@property (nonatomic, assign)NSInteger rate_coupon_send_id;
@property (nonatomic, assign)NSInteger type_flag;

@end
