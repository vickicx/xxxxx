//
//  JFDetailTableViewCell.h
//  Yilicai
//
//  Created by 盐商 on 16/4/11.
//  Copyright © 2016年 Louding. All rights reserved.
//

#import "BaseTableViewCell.h"
#import "JFDetailModel.h"

@interface JFDetailTableViewCell : BaseTableViewCell

@property (nonatomic, strong) UILabel *dateLabel;

@property (nonatomic, strong) UILabel *priceLabel;

@property (nonatomic, strong) UILabel *descriptionLabel;

@property (nonatomic, assign) NSInteger detailType;

@property (nonatomic, strong) JFDetailModel *model;

+(NSString *)countNumAndChangeformat:(NSString *)num;

@end
