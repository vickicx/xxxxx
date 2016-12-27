//
//  HKZCell.h
//  Yilicai
//
//  Created by 盐商 on 16/7/11.
//  Copyright © 2016年 Louding. All rights reserved.
//

#import "BaseTableViewCell.h"
#import "ReturningModel.h"

@interface HKZCell : BaseTableViewCell

@property (nonatomic, strong) UILabel *touziLabel;

@property (nonatomic, strong) UILabel *touziPriceLabel;

@property (nonatomic, strong) UILabel *huiquanzhongLabel;

@property (nonatomic, strong) UIView *lineView;

@property (nonatomic, strong) UILabel *titleNameLabel;

@property (nonatomic, strong) UILabel *interestLabel;

@property (nonatomic, strong) UILabel *extraLabel;

@property (nonatomic, strong) UILabel *qixiDateLabel;

@property (nonatomic, strong) UILabel *qishuLabel;

@property (nonatomic, strong) UILabel *nextDateLabel;

@property (nonatomic, strong) UILabel *priceLabel;

@property (nonatomic, strong) UILabel *deadLineLabel;

@property (nonatomic, strong) UILabel *yinghuiLabel;

@property (nonatomic, strong) UIButton *transferButton;

@property (nonatomic, copy) NSString *extaStr;

@property (nonatomic, strong) ReturningModel *model;

+(NSString *)getDateString:(NSString *)spString;

+ (CGFloat)widthOfLabel:(NSString *)text andWith:(CGFloat)height;

@end
