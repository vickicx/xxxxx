//
//  WDXXModel.h
//  Yilicai
//
//  Created by 盐商 on 16/3/28.
//  Copyright © 2016年 Louding. All rights reserved.
//

#import "BaseModel.h"

@interface WDXXModel : BaseModel

@property (nonatomic, copy) NSString *id;

@property (nonatomic, copy) NSString *sender;

@property (nonatomic, copy) NSNumber *receiver;

@property (nonatomic, copy) NSNumber *del_flg;

@property (nonatomic, copy) NSString *contents;

@property (nonatomic, copy) NSString *subject;

@property (nonatomic, copy) NSNumber *msg_type;

@property (nonatomic, copy) NSNumber *open_flg;

@property (nonatomic, copy) NSString *ins_date;

@end
