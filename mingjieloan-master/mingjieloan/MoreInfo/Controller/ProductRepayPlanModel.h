//
//  ProductRepayPlanModel.h
//  mingjieloan
//
//  Created by kang on 16/12/30.
//  Copyright © 2016年 mingjie. All rights reserved.
//

#import "BaseModel.h"

@interface ProductRepayPlanModel : BaseModel

@property (nonatomic, assign)long long int pdate;
@property (nonatomic, assign)NSInteger interest;
@property (nonatomic, assign)NSInteger principal;
@property (nonatomic, assign)NSInteger ptotal;

@end
