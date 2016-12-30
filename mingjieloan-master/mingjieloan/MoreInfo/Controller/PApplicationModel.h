//
//  PApplicationModel.h
//  mingjieloan
//
//  Created by kang on 16/12/30.
//  Copyright © 2016年 mingjie. All rights reserved.
//

#import "BaseModel.h"

@interface PApplicationModel : BaseModel
@property (nonatomic, assign)NSInteger pFinancePersonAge;
@property (nonatomic, copy)NSString *pFinancePersonName;
@property (nonatomic, copy)NSString *pFinancePersonSex;
@property (nonatomic, copy)NSString *pPurpose;
@end
