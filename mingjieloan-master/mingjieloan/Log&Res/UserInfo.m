//
//  UserInfo.m
//  mingjieloan
//
//  Created by 王好帅 on 2016/12/28.
//  Copyright © 2016年 mingjie. All rights reserved.
//

#import "UserInfo.h"

@implementation UserInfo

static UserInfo *userInfo = nil;

+ (UserInfo *)sharedInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        userInfo = (UserInfo *)@"UserInfo";
        userInfo = [[UserInfo alloc] init];
    });
    NSString *classStr = NSStringFromClass([self class]);
    if ([classStr isEqualToString:@"UserInfo"] == NO) {
                NSParameterAssert(nil);
    }
    return userInfo;
}

- (instancetype)init {
    self = [super init];
    NSString *string = (NSString *)userInfo;
    if ([string isKindOfClass:[NSString class]] == YES && [string isEqualToString:@"UserInfo"] ) {
        if (self) {
            
        }
        return self;
    } else {
        return nil;
    }
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    if ([key isEqual:@"id"]) {
        
    }
}



@end
