//
//  BasicInfo.m
//  mingjieloan
//
//  Created by 王好帅 on 2016/12/28.
//  Copyright © 2016年 mingjie. All rights reserved.
//

#import "BasicInfo.h"

@implementation BasicInfo

static BasicInfo *basicInfo = nil;

+ (BasicInfo *)sharedInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        basicInfo = (BasicInfo *)@"BasicInfo";
        basicInfo = [[BasicInfo alloc] init];
    });
    NSString *classStr = NSStringFromClass([self class]);
    if ([classStr isEqualToString:@"BasicInfo"] == NO) {
        NSParameterAssert(nil);
    }
    return basicInfo;
}

- (instancetype)init {
    self = [super init];
    NSString *string = (NSString *)basicInfo;
    if ([string isKindOfClass:[NSString class]] == YES && [string isEqualToString:@"BasicInfo"] ) {
        if (self) {
            
        }
        return self;
    } else {
        return nil;
    }
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    if ([key isEqual:@"account"]) {
        self.accountStatus  = value[@"accountStatus"];
        self.asset          = value[@"asset"];
        self.autoRepay      = value[@"autoRepay"];
        self.autoTransfer   = value[@"autoTransfer"];
        self.available      = value[@"available"];
        self.bankAccount    = value[@"bankAccount"];
        self.bankName       = value[@"bankName"];
        self.cardStatus     = value[@"cardStatus"];
        self.cashPrice      = value[@"cashPrice"];
        self.frozen         = value[@"frozen"];
        self.idCard         = value[@"idCard"];
        self.realName       = value[@"realName"];
        self.uid            = value[@"uid"];
    }
    if ([key isEqualToString:@"user"]) {
        self.createTime     = value[@"createTime"];
        self.email          = value[@"email"];
        self.emailValidated = value[@"emailValidated"];
        self.idValidated    = value[@"idValidated"];
        self.lastModTime    = value[@"lastModTime"];
        self.name           = value[@"name"];
        self.nameValidated  = value[@"nameValidated"];
        self.password       = value[@"password"];
        self.phone          = value[@"phone"];
        self.refer          = value[@"refer"];
        self.salt           = value[@"salt"];
        self.source         = value[@"source"];
    }
}

@end
