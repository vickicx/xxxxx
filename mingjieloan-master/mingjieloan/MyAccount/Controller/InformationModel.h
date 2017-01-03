//
//  InformationModel.h
//  mingjieloan
//
//  Created by 杜虹锋 on 2016/12/30.
//  Copyright © 2016年 mingjie. All rights reserved.
//

#import "BaseModel.h"

@interface InformationModel : BaseModel

@property (nonatomic, strong)NSMutableArray *informationImageList;
@property (nonatomic, strong)NSMutableArray *typeImageUrl;
@property (nonatomic, strong)NSMutableArray *typeName;

@end
