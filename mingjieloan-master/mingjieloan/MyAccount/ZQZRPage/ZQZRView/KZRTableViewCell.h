//
//  KZRTableViewCell.h
//  Yilicai
//
//  Created by 盐商 on 16/2/29.
//  Copyright © 2016年 Louding. All rights reserved.
//

#import "BaseTableViewCell.h"
#import "ZQZRModel.h"

@interface KZRTableViewCell : BaseTableViewCell

/*
 * 产品名
 */
@property (nonatomic, strong) UILabel *productNameLabel;

@property (nonatomic, strong) UIButton *zhuanRangButton;

@property (nonatomic, strong) UIImageView *zhuanRangImageView;

@property (nonatomic, strong) UIView *lineView;

@property (nonatomic, strong) UILabel *xiangMuBJLabel;

@property (nonatomic, strong) UILabel *yuQiSYLabel;

@property (nonatomic, strong) UILabel *shengYuQXLabel;

/*
 * 项目本金
 */
@property (nonatomic, strong) UILabel *xiangMuPrincipalLabel;

/*
 * 预期收益率
 */
@property (nonatomic, strong) UILabel *yuQiRateLabel;

/*
 * 剩余期限
 */
@property (nonatomic, strong) UILabel *restDayLabel;

@property (nonatomic, strong) UIImageView *startImageView;

@property (nonatomic, strong) UILabel *qiXiRiLabel;

/*
 * 起息日
 */
@property (nonatomic, strong) UILabel *startLabel;

@property (nonatomic, strong) UIImageView *deadLineImageView;

@property (nonatomic, strong) UILabel *daoQiRiLabel;

/*
 * 到期日
 */
@property (nonatomic, strong) UILabel *deadLineLabel;

@property (nonatomic, copy) ZQZRModel *model;

@end
