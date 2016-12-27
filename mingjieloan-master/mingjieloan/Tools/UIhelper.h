//
//  UIhelper.h
//  mingjieloan
//
//  Created by vicki on 2016/12/27.
//  Copyright © 2016年 mingjie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIhelper : NSObject
+ (void)showToast:(NSString *)msg view:(UIView *)view;


+ (void)loginTimeout;
@end
