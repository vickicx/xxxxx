//
//  GetColor16.h
//  SRBApp
//
//  Created by zxk on 14/12/16.
//  Copyright (c) 2014年 zxk. All rights reserved.
//

/*! @brief 16进制颜色转换RGB
 *  @description
 */
//#import "ZZBaseObject.h"

#define GetColor(r) [GetColor16 hexStringToColor:r];

#import <UIKit/UIKit.h>

@interface GetColor16 :NSObject


+(UIColor *) hexStringToColor: (NSString *) stringToConvert;
@end
