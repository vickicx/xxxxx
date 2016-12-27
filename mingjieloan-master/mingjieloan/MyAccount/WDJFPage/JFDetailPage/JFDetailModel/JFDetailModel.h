//
//  JFDetailModel.h
//  Yilicai
//
//  Created by 盐商 on 16/4/8.
//  Copyright © 2016年 Louding. All rights reserved.
//

#import "BaseModel.h"

@interface JFDetailModel : BaseModel

@property (nonatomic, copy) NSString *ins_date;//操作日期

@property (nonatomic, copy) NSString *point_type;//操作类型

@property (nonatomic, copy) NSString *point;//操作类型(例：已过期)

@property (nonatomic, copy) NSString *point_description;//备注

@property (nonatomic, copy) NSString *batch_run_time;

@property (nonatomic, copy) NSString *befor_point;

@property (nonatomic, copy) NSString *delete_point;

@property (nonatomic, copy) NSString *result_point;

@end
