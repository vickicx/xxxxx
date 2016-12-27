//
//  SQZR2TableViewCell.h
//  Yilicai
//
//  Created by 盐商 on 16/3/2.
//  Copyright © 2016年 Louding. All rights reserved.
//

#import "BaseTableViewCell.h"

@interface SQZR2TableViewCell : BaseTableViewCell

//剩余期限
@property (nonatomic, strong) UILabel *shengYuQXlabel;

@property (nonatomic, strong) UILabel *restDayLabel;
//预计年化收益率
@property (nonatomic, strong) UILabel *yuJiNHSYLLabel;

@property (nonatomic, strong) UILabel *yuJiNHRateLabel;

@property (nonatomic, strong) UIView *lineView;

@end
