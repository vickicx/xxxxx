//
//  pApplicationCheckModel.h
//  mingjieloan
//
//  Created by kang on 16/12/30.
//  Copyright © 2016年 mingjie. All rights reserved.
//

#import "BaseModel.h"

@interface pApplicationCheckModel : BaseModel

@property (nonatomic, assign)NSInteger credibilityCheckFlg;
@property (nonatomic, assign)NSInteger estateCheckFlg;
@property (nonatomic, assign)NSInteger guaranteeCheckFlg;
@property (nonatomic, assign)NSInteger householdCheckFlg;
@property (nonatomic, assign)NSInteger idCardCheckFlg;
@property (nonatomic, assign)NSInteger marriageCheckFlg;


@end
