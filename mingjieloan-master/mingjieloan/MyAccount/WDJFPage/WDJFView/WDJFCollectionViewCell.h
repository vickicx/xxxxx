//
//  WDJFCollectionViewCell.h
//  Yilicai
//
//  Created by 盐商 on 16/3/28.
//  Copyright © 2016年 Louding. All rights reserved.
//

#import "BaseCollectionViewCell.h"
#import "JFSCModel.h"

@interface WDJFCollectionViewCell : BaseCollectionViewCell

@property (nonatomic, strong) UIImageView *picImageView;

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UILabel *descriptionLabel;

@property (nonatomic, strong) UIButton *exchangeBtn;

@property (nonatomic, strong) UILabel *restLabel;

@property (nonatomic, strong) JFSCModel *model;

@end
