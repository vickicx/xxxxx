//
//  LoginModel.m
//  mingjieloan
//
//  Created by vicki on 2016/12/21.
//  Copyright © 2016年 mingjie. All rights reserved.
//

#import "LoginModel.h"

@implementation LoginModel

+ (instancetype)randomDictionary:(NSDictionary *)dictionary {
    
    
    LoginModel *loginModel = [[LoginModel alloc] init];
    [LoginModel setValuesForKeysWithDictionary:dictionary];
    return loginModel;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:_sid forKey:@"sid"];
    [aCoder encodeObject:_uid forKey:@"uid"];
    [aCoder encodeObject:_username forKey:@"username"];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    
    self = [super init];
    
    if (self) {
        _sid = [aDecoder decodeObjectForKey:@"sid"];
        
        _uid = [aDecoder decodeObjectForKey:@"uid"];
        
        _username = [aDecoder decodeObjectForKey:@"username"];
    }    
    return self;
}

@end
