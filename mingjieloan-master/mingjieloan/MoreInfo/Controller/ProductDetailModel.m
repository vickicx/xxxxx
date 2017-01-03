//
//  ProductDetailModel.m
//  mingjieloan
//
//  Created by kang on 16/12/30.
//  Copyright © 2016年 mingjie. All rights reserved.
//

#import "ProductDetailModel.h"

@implementation ProductDetailModel


- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    if ([key isEqualToString:@"description"]) {
        _descriptionJS = value;
    }
}

@end
