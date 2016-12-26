//
//  HeightWithString.h
//  ShyNing
//
//  Created by dllo on 15/11/18.
//  Copyright © 2015年 GYD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface HeightWithString : NSObject

//计算lable文字高度

//参数1；文本  参数2；lable宽度  参数3；字体大小

+(CGFloat)heightForTextLable:(NSString *)text width:(CGFloat)width fontSize:(CGFloat)fontSize;

+(CGFloat)getSpaceLabelHeight:(NSString*)str withFont:(UIFont*)font withWidth:(CGFloat)width;

+(void)setLabelSpace:(UILabel*)label withValue:(NSString*)str withFont:(UIFont*)font;


@end
