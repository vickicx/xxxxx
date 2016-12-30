//
//  ProductModel.m
//  mingjieloan
//
//  Created by kang on 16/12/28.
//  Copyright © 2016年 mingjie. All rights reserved.
//

#import "ProductModel.h"

@implementation ProductModel

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
    if ([key isEqualToString:@"id"]) {
        self.strId = value;
    }
    
}

@end
