//
//  ZRZTableViewCell.h
//  Yilicai
//
//  Created by 盐商 on 16/2/29.
//  Copyright © 2016年 Louding. All rights reserved.
//

#import "BaseTableViewCell.h"
#import "ZRZmodel.h"

@interface ZRZTableViewCell : BaseTableViewCell

/*
 * 产品名
 */
@property (nonatomic, strong) UILabel *productNameLabel;

@property (nonatomic, strong) UILabel *zhuanRangLabel;

@property (nonatomic, strong) UIView *lineView;

@property (nonatomic, strong) UILabel *zhuanRangJGLabel;

@property (nonatomic, strong) UILabel *yuQiSYLabel;

@property (nonatomic, strong) UILabel *shengYuQXLabel;

/*
 * 项目本金
 */
@property (nonatomic, strong) UILabel *zhuanRangPriceLabel;

/*
 * 预期收益率
 */
@property (nonatomic, strong) UILabel *yuQiRateLabel;

/*
 * 剩余期限
 */
@property (nonatomic, strong) UILabel *restDayLabel;

@property (nonatomic, strong) UIImageView *zhuanRangGPRQImageView;

@property (nonatomic, strong) UILabel *zhuanRangGPRQLabel;

/*
 * 转让挂牌日期
 */
@property (nonatomic, strong) UILabel *zhuanRangGPDateLabel;

@property (nonatomic, strong) UIImageView *zhuanRangXJRQImageView;

@property (nonatomic, strong) UILabel *zhuanRangXJRQLabel;

/*
 * 转让挂牌日期
 */
@property (nonatomic, strong) UILabel *zhuanRangXJDateLabel;

@property (nonatomic, copy) ZRZmodel *model;

@end
