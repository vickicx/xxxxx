//
//  TZJLDetail2Cell.h
//  Yilicai
//
//  Created by 盐商 on 16/7/12.
//  Copyright © 2016年 Louding. All rights reserved.
//

#import "BaseTableViewCell.h"
#import "TZJLDetailModel.h"

@interface TZJLDetail2Cell : BaseTableViewCell

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UILabel *priceLabel;

@property (nonatomic, strong) TZJLDetailModel *model;

@end
