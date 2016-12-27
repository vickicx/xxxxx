//
//  YZRTableViewCell.h
//  Yilicai
//
//  Created by 盐商 on 16/2/29.
//  Copyright © 2016年 Louding. All rights reserved.
//

#import "BaseTableViewCell.h"
#import "YZRModel.h"

@interface YZRTableViewCell : BaseTableViewCell

/*
 * 产品名
 */
@property (nonatomic, strong) UILabel *productNameLabel;

@property (nonatomic, strong) UILabel *productStateLabel;

@property (nonatomic, strong) UIView *lineView;

@property (nonatomic, strong) UILabel *dateTitleLabel;

/*
 * 转让日期
 */
@property (nonatomic, strong) UILabel *dateLabel;

@property (nonatomic, strong) UILabel *priceTitleLabel;

/*
 * 转让价格
 */
@property (nonatomic, strong) UILabel *priceLabel;

@property (nonatomic, copy) YZRModel *model;

@end
