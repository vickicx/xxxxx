//
//  JYJLModel.h
//  Yilicai
//
//  Created by 盐商 on 16/3/21.
//  Copyright © 2016年 Louding. All rights reserved.
//

#import "BaseModel.h"

@interface JYJLModel : BaseModel

@property (nonatomic, copy) NSString *transactionType;//交易类型

@property (nonatomic, copy) NSString *createTime;//时间

@property (nonatomic, copy) NSString *beginningBalance;//操作前金额

@property (nonatomic, copy) NSNumber *transactionId;//流水账号

@property (nonatomic, copy) NSString *operationAmount;//操作金额

@property (nonatomic, copy) NSString *available;//可用余额

@end
