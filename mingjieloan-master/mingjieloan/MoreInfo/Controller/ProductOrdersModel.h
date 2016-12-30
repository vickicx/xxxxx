//
//  ProductOrdersModel.h
//  mingjieloan
//
//  Created by kang on 16/12/30.
//  Copyright © 2016年 mingjie. All rights reserved.
//

#import "BaseModel.h"

@interface ProductOrdersModel : BaseModel

@property (nonatomic, copy)NSString *realName;
@property (nonatomic, copy)NSString *price;
@property (nonatomic, copy)NSString *createData;

@end
