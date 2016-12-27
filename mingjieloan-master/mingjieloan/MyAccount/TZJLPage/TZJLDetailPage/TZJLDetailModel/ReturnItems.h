//
//  ReturnItems.h
//  Yilicai
//
//  Created by 盐商 on 16/7/15.
//  Copyright © 2016年 Louding. All rights reserved.
//

#import "BaseModel.h"

@interface ReturnItems : BaseModel

@property (nonatomic, copy) NSString *recover_flg;

@property (nonatomic, copy) NSString *recover_date;

@property (nonatomic, copy) NSString *recover_amount_interest;

@property (nonatomic, copy) NSString *recover_amount_capital;

@property (nonatomic, copy) NSString *recover_amount_total;

@end
