//
//  HYZXModel.h
//  Yilicai
//
//  Created by 盐商 on 16/5/26.
//  Copyright © 2016年 Louding. All rights reserved.
//

#import "BaseModel.h"

@interface HYZXModel : BaseModel

@property (nonatomic, assign) NSInteger coupons;//我的卡卷

@property (nonatomic, assign) NSInteger average_assets;//本月日均总资产

@property (nonatomic, assign) NSInteger status;

@property (nonatomic, assign) NSInteger member_level;//会员级别

@property (nonatomic, assign) NSInteger integral;//我的积分

@end
