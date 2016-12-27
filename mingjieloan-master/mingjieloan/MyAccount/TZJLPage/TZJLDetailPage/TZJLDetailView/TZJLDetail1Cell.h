//
//  TZJLDetail1Cell.h
//  Yilicai
//
//  Created by 盐商 on 16/7/12.
//  Copyright © 2016年 Louding. All rights reserved.
//

#import "BaseTableViewCell.h"
#import "TZJLDetailModel.h"
#import "ReturnItems.h"

@interface TZJLDetail1Cell : BaseTableViewCell

@property (nonatomic, strong) UILabel *touzijineLabel;

@property (nonatomic, strong) UILabel *touziPriceLabel;

@property (nonatomic, strong) UILabel *nianhuashouyilvLabel;

@property (nonatomic, strong) UILabel *nianhuaRateLabel;

@property (nonatomic, strong) UILabel *extraLabel;

@property (nonatomic, strong) UILabel *huankuanfangshiLabel;

@property (nonatomic, strong) UILabel *huankuanWayLabel;

@property (nonatomic, strong) UILabel *qixianLabel;

@property (nonatomic, strong) UILabel *dateLabel;

@property (nonatomic, strong) UILabel *qixiriqiLabel;

@property (nonatomic, strong) UILabel *qixiDateLabel;

@property (nonatomic, strong) UILabel *daoqiriqiLabel;

@property (nonatomic, strong) UILabel *deadLineLabel;

@property (nonatomic, copy) NSString *rateStr;

@property (nonatomic, copy) NSString *extaStr;

@property (nonatomic, strong) TZJLDetailModel *model;

+ (CGFloat)widthOfLabel:(NSString *)text andWith:(CGFloat)height;

@end
