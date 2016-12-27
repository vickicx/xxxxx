//
//  DQRCell.h
//  Yilicai
//
//  Created by 盐商 on 16/7/11.
//  Copyright © 2016年 Louding. All rights reserved.
//

#import "BaseTableViewCell.h"
#import "ConfirmModel.h"

@interface DQRCell : BaseTableViewCell

@property (nonatomic, strong) UILabel *touziLabel;

@property (nonatomic, strong) UILabel *touziPriceLabel;

@property (nonatomic, strong) UILabel *huiquanzhongLabel;

@property (nonatomic, strong) UIView *lineView;

@property (nonatomic, strong) UILabel *titleNameLabel;

@property (nonatomic, strong) UILabel *interestLabel;

@property (nonatomic, strong) UILabel *extraLabel;

@property (nonatomic, strong) UILabel *touziDateLabel;

@property (nonatomic, copy) NSString *extaStr;

@property (nonatomic, strong) ConfirmModel *model;

+ (CGFloat)widthOfLabel:(NSString *)text andWith:(CGFloat)height;

@end
