//
//  LoginModel.h
//  mingjieloan
//
//  Created by vicki on 2016/12/21.
//  Copyright © 2016年 mingjie. All rights reserved.
//

#import "BaseModel.h"

@interface LoginModel : BaseModel<NSCoding>
@property (copy, nonatomic) NSString * sid;
@property (copy, nonatomic) NSString * uid;
@property (copy, nonatomic) NSString * username;
+ (instancetype)randomDictionary:(NSDictionary *)dictionary;
@end
