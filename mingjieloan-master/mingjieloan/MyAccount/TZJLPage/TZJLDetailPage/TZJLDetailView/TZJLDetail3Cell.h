//
//  TZJLDetail3Cell.h
//  Yilicai
//
//  Created by 盐商 on 16/7/12.
//  Copyright © 2016年 Louding. All rights reserved.
//

#import "BaseTableViewCell.h"
#import "ReturnItems.h"

@interface TZJLDetail3Cell : BaseTableViewCell

@property (nonatomic, strong) UILabel *receiveDateLabel;

@property (nonatomic, strong) UILabel *principalLabel;

@property (nonatomic, strong) UILabel *rateLabel;

@property (nonatomic, strong) UILabel *totalLabel;

@property (nonatomic, strong) UILabel *statusLabel;

@property (nonatomic, strong) ReturnItems *model;

@end
