//
//  DHFCouponModel.m
//  mingjieloan
//
//  Created by kang on 17/1/6.
//  Copyright © 2017年 mingjie. All rights reserved.
//

#import "DHFCouponModel.h"

@implementation DHFCouponModel

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"id"]) {
        _couponID = value;
    }
}


@end
