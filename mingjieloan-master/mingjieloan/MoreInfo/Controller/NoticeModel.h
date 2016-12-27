//
//  NoticeModel.h
//  mingjieloan
//
//  Created by kang on 16/12/26.
//  Copyright © 2016年 mingjie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NoticeModel : NSObject

@property (nonatomic, assign) long long int dateline;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *content;
@end
