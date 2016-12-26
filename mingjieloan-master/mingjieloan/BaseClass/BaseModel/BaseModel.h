//
//  BaseModel.h
//  mingjieloan
//
//  Created by vicki on 2016/12/20.
//  Copyright © 2016年 vicki. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseModel : NSObject

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
/**
 *  赋值
 *
 *  @param value JSONValue
 *  @param key    JSONKey
 */
- (void)setValue:(id)value forUndefinedKey:(NSString *)key;


@end
