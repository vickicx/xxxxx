//
//  JYJLTableViewCell.h
//  Yilicai
//
//  Created by 盐商 on 16/3/21.
//  Copyright © 2016年 Louding. All rights reserved.
//

#import "BaseTableViewCell.h"
#import "JYJLModel.h"

@interface JYJLTableViewCell : BaseTableViewCell

@property (nonatomic, strong) UILabel *titleNameLabel;

@property (nonatomic, strong) UILabel *operationAmountLabel;

@property (nonatomic, strong) UILabel *descriptionLabel;

@property (nonatomic, strong) UILabel *createTimeLabel;

@property (nonatomic, strong) JYJLModel *model;

@end
